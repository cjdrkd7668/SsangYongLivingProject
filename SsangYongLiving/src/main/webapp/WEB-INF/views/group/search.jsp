<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- container 시작 -->
<div class="container">

    <div class="page-header">
        <b class="green" style="font-size: 1.2em;">&nbsp;[네이버 쇼핑]</b>
        지금 네이버에서<span class="orange"> [${query }]</span> 가격은?
        <button class="btn backPostBtn">
            공구 글로 돌아가기
        </button>
        <br>
        <small>상품명을 누르면 해당 사이트로 이동합니다.</small>
        
    </div>
    <div class="greenDivider"></div>

    <table class="table searchTable">
        <tr class="greenbg">
            <th class="col-sm-2">이미지</th>
            <th class="col-sm-6">상품명</th>
            <th class="col-sm-1">최저가</th>
            <th class="col-sm-2">상호명</th>
            <th class="col-sm-1">분류</th>
        </tr>
        <c:forEach items="${slist }" var="dto">
        <tr>
            <td><img src="${dto.image }" style="width:100px;"></td>
            <td><a href="${dto.link}" target="_blank">${dto.title }</a></td>
            <td class="green">${dto.lprice }</td>
            <td>${dto.mallName }</td>
            <td class="orange">${dto.category4 }</td>            
        </tr>
        </c:forEach>
    </table>
    <!-- 커뮤니티 테이블 끝 -->
 	<div class="greenDivider" style="margin-top: 30px;"></div>
 	
 	<div id="pagebar"></div>

    <div style="clear: both;"></div>

</div>
<!-- container 끝 -->
<script>
	window.onload = function() {
		let nowPage = 1;
		let total = ${total};
		
		$("#pagebar").html("");

		let tempPagebar = "";
        
        tempPagebar += "<button type='button' class='btn' onclick='move(-1);' style='width:120px;'>";
        tempPagebar += "이전";
        tempPagebar += "</button> ";
        
        tempPagebar += "<button type='button' class='btn greenbg' onclick='move(+1);' style='width:120px;'>";
        tempPagebar += "다음";
        tempPagebar += "</button>";
        
        $("#pagebar").append(tempPagebar);
	};
	
    function move(n){
    	nowPage += n;
    	search($("input[name=query]").val());
    	
    }
</script>
