
var server = require("http").createServer(),
	ws = new (require("websocket").server)({
		httpServer : server,
		autoAcceptConnections : true
	}),
	clients = [];

function broadcast(data) {
	clients.forEach(function(client) {
		client.sendUTF(data);
	});
}

function connectHandler(conn) {
	conn.nickname = conn.remoteAddress;
    conn.on("message", messageHandler);
    conn.on("close", closeHandler);
	clients.push(conn);
	broadcast(conn.nickname + " entered the chat");
}

function closeHandler() {
	var index = clients.indexOf(this);
	if (index > -1) {
		clients.splice(index, 1);
	}
	broadcast(this.nickname + " left the chat");
}

function messageHandler(message) {
	var data = message.utf8Data.toString(),
		firstWord = data.toLowerCase().split(" ")[0];
	if (data[0] == "/") {
		switch (firstWord) {
			case "/nick" :
				var newname = data.split(" ")[1];
				if (newname != "") {
					broadcast(this.nickname + " changed name to " + newname);
					this.nickname = newname;
				}
				break;
			case "/shutdown" :
				broadcast("Server shutting down. Bye!");
				ws.shutDown();
				server.close();
				break;
			default :
				this.sendUTF("Unknown command: " + firstWord);
		}
	} else {
		broadcast(this.nickname + " says: " + data);
	}
}

ws.on("connect", connectHandler);

server.listen(80);
