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
                <td colspan="2"></td>
            </tr>
           
            <!-- 대화 상자 시작 -->
            <tr class="addChat">
                <td colspan="2">
                    <div>
                        <input type="text" id="message" name="message" class="form-control detail" placeholder="대화 내용을 입력한 뒤 엔터 키를 누르세요.">
                        <input value="보내기" type="button" id="sendBtn" class="btn">
                        <div id="data"></div>
                    </div>
                </td>
            </tr>
            <!-- 대화 상자 끝 -->

            <tr class="btnChat softbg">
               <td colspan="2">
                    <button class="btn greybg backChatBtn">
                        돌아가기
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

    $(".detail").click(function(){

    });
    

	$(document).ready(function() {

		$("#sendBtn").click(function() {

			sendMessage();

			$('#message').val('')

		});

		$("#message").keydown(function(key) {

			if (key.keyCode == 13) {// 엔터

				sendMessage();

				$('#message').val('')

			}

		});

	});

	// 웹소켓을 지정한 url로 연결한다.

	let sock = new SockJS("<c:url value="/echo"/>");

	sock.onmessage = onMessage;

	sock.onclose = onClose;

	// 메시지 전송

	function sendMessage() {

		sock.send($("#message").val());

	}

	// 서버로부터 메시지를 받았을 때

	function onMessage(msg) {

		var data = msg.data;

		$("#data").append(data + "<br/>");

	}

	// 서버와 연결을 끊었을 때

	function onClose(evt) {

		$("#data").append("연결 끊김");

	}
</script>