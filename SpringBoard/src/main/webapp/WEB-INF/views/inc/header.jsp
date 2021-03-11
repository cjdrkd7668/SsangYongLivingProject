<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<header>
	<h1 class="page-header">Spring Board</h1>
	<div>
		<div><a href="/board/board/list.action">게시판</a></div>
		<div><a href="/board/member/auth.action">회원</a></div>
		<div>${empty id ? "익명" : id}</div>		
	</div>
</header>