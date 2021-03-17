<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="header">
	<nav class="navbar navbar-default navbar-static-top">
		<div class="container-fluid">
			<a class="navbar-brand" href="/living/index.action">
				<img alt="Brand" src="/living/resources/images/SsangYoungLivingLogo.png" id="logo">
			</a>
			<div class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li class="active"><a href="/living/index.action">홈</a></li>
					<li><a href="/living/recipe/main.action">냉장고 털기</a></li>
					<li><a href="#">공동 구매 찾기</a></li>
					<li><a href="/living/job/index.action">내 동네 알바 찾기</a></li>
					<li><a href="/living/used/main.action">중고 거래 하기</a></li>
					
        			
        			<c:if test="${empty id }">
        			<li><a href="/living/auth/login.action">로그인</a></li>
        			</c:if>
        			
        			<li><a href="/sybang/join/joinbuttons.do">회원가입</a></li>
        			
        			 
        			<c:if test="${not empty id }">
        			<li><a href="/living/auth/logout.action">로그아웃</a></li>
        			</c:if>
        			
				</ul>
			</div>
		</div> <!-- container-fluid -->
	</nav> <!-- navbar -->
</div>








































