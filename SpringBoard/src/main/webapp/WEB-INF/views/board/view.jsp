<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<section>
	
	<h3>글보기</h3>
	
	<table class="table table-bordered">
		<tr>
			<th style="width: 120px;">번호</th>
			<td style="width: auto;">${dto.seq}</td>
		</tr>
		<tr>
			<th>아이디</th>
			<td>${dto.id}</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${dto.subject}</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>${dto.content}</td>
		</tr>
		<tr>
			<th>날짜</th>
			<td>${dto.regdate}</td>
		</tr>
	</table>	
	<div class="btns">
		
		<button type="button" class="btn btn-default" onclick="location.href='/board/board/list.action';">목록</button>
		
		<button type="button" class="btn btn-default" onclick="location.href='/board/board/edit.action?seq=${dto.seq}';">수정</button>
		
		<button type="button" class="btn btn-default" onclick="location.href='/board/board/del.action?seq=${dto.seq}';">삭제</button>
		
	</div>
	

</section>










    