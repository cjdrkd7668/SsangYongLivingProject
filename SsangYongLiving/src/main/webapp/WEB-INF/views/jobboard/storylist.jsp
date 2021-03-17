<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<section>

	<div class="menuInfo">
	<img src="/living/resources/images/job/rInfo.png" style="width:30px;">
	<div class="menuTitle">알바 스토리&nbsp;&nbsp;&nbsp;<span class="menuTitleSub">알바 잡담 나눠요</span></div>
	</div>
	<div class="menuLine"></div>

	<div class="middleSearch">
		<input type="text" class="form-control short" placeholder="내용을 입력하세요">
		<button type="submit" class="btn btn-warning">검색</button>		
		<a class="btn btn-warning" href="/living/jobboard/storyadd.action" role="button" style="margin-left:830px;">글쓰기</a>
		
	</div>	
		
	<div class="bottomWrapper">	
	<div class="rItemWrapper">
	
	
	
	<table class="table bordered"> 
		<tr class="tHeaderImpact">
			<th>등록일</th>
			<th>제목</th>
			<th>작성자</th>
			<th>조회수</th>
		</tr>
		<c:forEach items="${list}" var="dto">
		<tr>
			<td><span class="dayColor">${dto.regDate}</td>
			<td><a href="/living/jobboard/storyview.action?seq=${dto.seq}"><span class="storySubject">${dto.title}</span></a></td>
			<td><span class="writer">asd***${dto.seq} 글번호</span></td>
			<td>${dto.hits}</td>
		</tr>
		</c:forEach>
	</table>

	
	</div>
	<!-- rItemWrapper 끝 -->
	</div>
	<!-- bottomWrapper 끝 -->



</section>