<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- jQuery CDN-->
<script src="https://code.jquery.com/jquery-1.9.0.js" integrity="sha256-TXsBwvYEO87oOjPQ9ifcb7wn3IrrW91dhj6EMEtRLvM=" crossorigin="anonymous"></script>

<!-- Web socket CDN -->
<script src="http://cdn.sockjs.org/sockjs-0.3.4.js"></script>

<!-- container 시작 -->
<div class="container">

    <table class="chatContainer">
        
        <thead>
            <tr>
                <th colspan="2">
                    <img src="/living/resources/images/group/chat.png">&nbsp;식료품마켓 1:1 문의&nbsp;&nbsp;
                    <img src="/living/resources/images/group/24.png" style="width: 80px; float: right;">&nbsp;<br>
                    <span>&nbsp;~무엇이든 물어보세요~</span>
                </th>
            </tr>
        </thead>
        <tbody>
            
            <tr class="memberChatInfo">
                <td colspan="2"><div id="message" style="width:100%;"></div></td>
            </tr>
           
            <!-- 대화 상자 시작 -->
            <tr class="addChat">
                <td colspan="2">
                    <div>
                        <input type="text" id="messageinput" name="message" class="form-control detail" placeholder="대화 내용을 입력한 뒤 엔터 키를 누르세요." style="width: 80%; float:left;">
                        <input value="보내기" type="button" id="sendBtn" class="btn" onclick="send();" style="width: 18%; float: right;">
                    </div>
                </td>
            </tr>
            <!-- 대화 상자 끝 -->

            <tr class="btnChat softbg">
               <td colspan="2">
                    <button class="btn greybg backChatBtn">
                        	돌아가기
                    </button>
                    <button class="btn greybg backChatBtn" onclick="closeSocket();">
                        	종료
                    </button>
                    <button class="btn greybg backChatBtn" onclick="openSocket();">
                        	접속
                    </button>
               </td> 
            </tr>
        </tbody>

    </table>


    
 
    

</div>
<!-- container 끝 -->

<script>

    window.onload = function() {
        $(".detail").focus();
    };

	var ws;
	var messages = document.getElementById("message");

	function openSocket() {
		if (ws !== undefined && ws.readyState !== WebSocket.CLOSED) {
			writeResponse("WebSocket is already opend.");
			return;
		}

		//웹소켓 객체 만드는 코드
		ws = new WebSocket('ws://localhost:8090/living/chatserver');

		ws.onopen = function(event) {
			 if (event.data === undefined)
				return;
			writeResponse("WebSocket is already opend.");
			writeResponse(event.data);
		};
		ws.onmessage = function(event) {
			writeResponse(event.data);
		};
		ws.onclose = function(event) {
			writeResponse("Connection closed");
		}
	}
	function send() {
		var text = document.getElementById("messageinput").value;
		ws.send(text);
		text = "";
	}
	function closeSocket() {
		ws.close();
	}
	function writeResponse(text) {
		message.innerHTML += "<br/>" + text;
	}
</script>