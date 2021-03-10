package com.kisa.html5.socket;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.InetSocketAddress;
import java.net.UnknownHostException;
import java.util.Collection;

import org.java_websocket.WebSocket;
import org.java_websocket.WebSocketImpl;
import org.java_websocket.handshake.ClientHandshake;
import org.java_websocket.server.WebSocketServer;

/**
 * <br>
 * <br>
 * <br>
 * 2013. 5. 31.::작성자:: 박기백<br>
 */
public class ServerSocket2  extends WebSocketServer {
	int cnt; //접속자
		public ServerSocket2( int port ) throws UnknownHostException {
			super( new InetSocketAddress( port ) );
		}

		public ServerSocket2( InetSocketAddress address ) {
			super( address );
		}

		@Override
		public void onOpen( WebSocket conn, ClientHandshake handshake ) {
			this.sendToAll( "new connection:" + conn.getRemoteSocketAddress().getAddress().getHostAddress());
			//this.sendToAll( "new connection: " + handshake.getResourceDescriptor() );
			System.out.println( conn.getRemoteSocketAddress().getAddress().getHostAddress() + " entered the room!" );
			cnt++;
		
		}

		@Override
		public void onClose( WebSocket conn, int code, String reason, boolean remote ) {
			this.sendToAll( conn + " has left the room!" );
			cnt--;
			System.out.println("현재접속자::::::"+cnt);
		}

		@Override
		public void onMessage( WebSocket conn, String message ) {
		this.sendToAll(message);
		this.sendToAll("현재접속자::::::"+cnt);
		
		}

		public static void main( String[] args ) throws InterruptedException , IOException {
			WebSocketImpl.DEBUG = true;
			int port = 8001; // 843 flash policy port
			try {
				port = Integer.parseInt( args[ 0 ] );
			} catch ( Exception ex ) {
			}
			ServerSocket2 s = new ServerSocket2( port );
			s.start();
			System.out.println( "ChatServer started on port: " + s.getPort()+": Chatting Server" );

			BufferedReader sysin = new BufferedReader( new InputStreamReader( System.in ) );
			while ( true ) {
				String in = sysin.readLine();
				s.sendToAll( in );
			}
		}

		@Override
		public void onError( WebSocket conn, Exception ex ) {
			ex.printStackTrace();
			if( conn != null ) {
				// some errors like port binding failed may not be assignable to a specific websocket
			}
		}

		/**
		 * Sends <var>text</var> to all currently connected WebSocket clients.
		 * 
		 * @param text
		 *            The String to send across the network.
		 * @throws InterruptedException
		 *             When socket related I/O errors occur.
		 */
		public void sendToAll( String text ) {
			Collection<WebSocket> con = connections();
			synchronized ( con ) {
				for( WebSocket c : con ) {
					c.send( text );
				}
			}
		}
	}
