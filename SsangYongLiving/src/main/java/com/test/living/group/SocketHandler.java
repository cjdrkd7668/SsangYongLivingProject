package com.test.living.group;

import java.util.ArrayList;
import java.util.List;

import javax.websocket.server.ServerEndpoint;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@ServerEndpoint("/chatserver")
public class SocketHandler extends TextWebSocketHandler {
	
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();

	//클라이언트 연결 후 실행되는 메서드
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
      sessionList.add(session);
      System.out.println("{} 연결됨"+ session.getId());
    }
    
	// 클라이언트가 서버로 메시지를 전송했을 때 실행되는 메서드
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println(("{}로 부터 {} 받음" + session.getId() + message.getPayload()));
		for (WebSocketSession sess : sessionList) {
			sess.sendMessage(new TextMessage(session.getId() + " : " + message.getPayload()));
		}
	}

	// 클라이언트와 연결을 끊었을 때 실행되는 메소드
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessionList.remove(session);
		System.out.println(("{} 연결 끊김" + session.getId()));
	 }
}
