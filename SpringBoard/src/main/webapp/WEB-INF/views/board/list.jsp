<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<section>
	
	<h3>목록</h3>
	
	<table class="table table-bordered">
		<tr>
			<th style="width: 50px;">번호</th>
			<th style="width: auto;">제목</th>
			<th style="width: 80px;">아이디</th>
			<th style="width: 170px;">날짜</th>
		</tr>
		<c:forEach items="${list}" var="dto">
		<tr>
			<td>${dto.seq}</td>
			<td><a href="/board/board/view.action?seq=${dto.seq}">${dto.subject}</a></td>
			<td>${dto.id}</td>
			<td>${dto.regdate}</td>
		</tr>
		</c:forEach>
	</table>
	
	<div class="btns">
		<button type="button" class="btn btn-warning" onclick="location.href='/board/board/add.action';">쓰기</button>
	</div>
	
</section>











