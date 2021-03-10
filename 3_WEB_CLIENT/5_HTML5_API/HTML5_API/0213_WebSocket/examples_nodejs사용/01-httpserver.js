
var server = require("http").createServer();

server.on("connection", function(socket) {
	socket.on("data", function(data) {
		console.log(data.toString());
	});
});

server.on("request", function(request, response) {

	response.writeHead(
		200, 
		{
			"Content-Type" : "text/plain"
		}
	);
	
	response.write("It Works!");
	
	response.end();
});

server.listen(80, "");