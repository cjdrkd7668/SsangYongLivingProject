<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
            <!-- 업체 정보 시작 -->
            <tr class="companyChatInfo">
                <td class="col-sm-6"><img src="/living/resources/images/group/market.png">&nbsp;식료품마켓&nbsp;&nbsp;<small>3:23</small></td> 
                <td class="col-sm-6"></td>
            </tr>
            <!-- 업체 정보 끝 -->
            <!-- 업체 대화 내용 시작 -->
            <tr class="companyChatDetailInfo">
                <td colspan="2"><div class="companyDetail">안녕하세요 식료품마켓입니다~</div></td>
            </tr>
            <!-- 업체 대화 내용 끝 -->
            <!-- 회원 정보 시작 -->
            <tr class="memberChatInfo">
                <td class="col-sm-6"></td>
                <td class="col-sm-6">홍길동&nbsp;&nbsp;<small>13:24</small></td>
            </tr>
            <!-- 회원 정보 끝 -->
            <!-- 회원 대화 내용 시작 -->
            <tr class="memberChatDetailInfo">
                <td colspan="2"><div class="memberDetail">문의하려고요</div></td>
            </tr>
            <!-- 회원 대화 내용 끝 -->
             <!-- 업체 정보 시작 -->
             <tr class="companyChatInfo">
                <td class="col-sm-6"><img src="/living/resources/images/group/market.png">&nbsp;식료품마켓&nbsp;&nbsp;<small>3:23</small></td> 
                <td class="col-sm-6"></td>
            </tr>
            <!-- 업체 정보 끝 -->
            <!-- 업체 대화 내용 시작 -->
            <tr class="companyChatDetailInfo">
                <td colspan="2"><div class="companyDetail">안녕하세요 식료품마켓입니다~</div></td>
            </tr>
            <!-- 업체 대화 내용 끝 -->
            <!-- 회원 정보 시작 -->
            <tr class="memberChatInfo">
                <td class="col-sm-6"></td>
                <td class="col-sm-6">홍길동&nbsp;&nbsp;<small>13:24</small></td>
            </tr>
            <!-- 회원 정보 끝 -->
            <!-- 회원 대화 내용 시작 -->
            <tr class="memberChatDetailInfo">
                <td colspan="2"><div class="memberDetail">문의하려고요</div></td>
            </tr>
            <!-- 회원 대화 내용 끝 -->

            <!-- 대화 상자 시작 -->
            <tr class="addChat">
                <td colspan="2">
                    <div>
                        <div class="memberName"><i class="fas fa-user-edit"></i>&nbsp;홍길동</div>
                        <input type="text" class="form-control detail" placeholder="대화 내용을 입력한 뒤 엔터 키를 누르세요.">
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

</script>