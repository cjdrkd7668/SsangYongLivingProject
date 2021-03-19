package com.test.living.group;

import java.util.HashSet;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class SocketHandler  extends TextWebSocketHandler implements InitializingBean {

	private static Logger logger = LoggerFactory.getLogger(SocketHandler.class);
	
	private Set<WebSocketSession> sessionSet = new HashSet<WebSocketSession>();
	
	public SocketHandler() {
		super();
		this.logger.info("create SocketHandler instance!");
	}
	
	//WebSocketSession session : 전송 주체 정보가 담긴 세션
	//웹소켓이 연결되면 호출된다.
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {

		super.afterConnectionEstablished(session);

		sessionSet.add(session);

		this.logger.info("add session!");
	}
	
	//웹소켓 연결이 종료되면 호출된다.
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {

		super.afterConnectionClosed(session, status);

		sessionSet.remove(session);

		this.logger.info("remove session!");
	}

	//웹소켓 클라이언틑가 메시지 전송 시 호출된다.
	@Override
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {

		super.handleMessage(session, message);

		this.logger.info("receive message:" + message.toString());

	}
	
	//전송 에러가 발생할 때 호출된다.
	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {

		this.logger.error("web socket error!", exception);
	}
	
	//WebSocketHandler가 부분 메시지를 처리할 때 호출된다.
	@Override
	public boolean supportsPartialMessages() {

		this.logger.info("call method!");

		return super.supportsPartialMessages();
	}
	
	public void sendMessage(String message) {

		for (WebSocketSession session : this.sessionSet) {

			if (session.isOpen()) {

				try {

					session.sendMessage(new TextMessage(message));

				} catch (Exception ignored) {

					this.logger.error("fail to send message!", ignored);
				}
			}
		}
	}
	
	@Override
	public void afterPropertiesSet() throws Exception {

		Thread thread = new Thread() {

			int i = 0;

			@Override
			public void run() {

				while (true) {

					try {

						sendMessage("send message index " + i++);

						Thread.sleep(1000);

					} catch (InterruptedException e) {

						e.printStackTrace();
						break;
					}
				}
			}
		};

		thread.start();
	}
}
