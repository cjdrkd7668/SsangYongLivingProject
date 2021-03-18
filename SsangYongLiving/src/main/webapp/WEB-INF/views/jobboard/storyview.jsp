<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<section>


	<div class="menuInfo">
	<img src="/living/resources/images/job/rInfo.png" style="width:30px;">
	<div class="menuTitle">알바 스토리&nbsp;&nbsp;&nbsp;<span class="menuTitleSub">알바 잡담 나눠요</span></div>
	</div>
	<div class="menuLine"></div>
	
	
	<div class="bottomWrapper">
	
	<div class="storyboardHeader">
	<div class="storyTitle">${dto.title}</div>
	<div class="storysubTitle">asdf** |&nbsp;&nbsp;&nbsp;<span class="dayColor">${dto.regDate}</span></div><div class="boardInfo">댓글 6 | 조회 ${dto.hits}</div>
	</div>
	
	
	<div class="storyboardContent">
	${dto.material}
	</div>
	
	<div class="storyBottom">
	<button type="button" class="btn btn-warning" onclick="location.href='/living/jobboard/storyedit.action?seq=${dto.seq}';"><span class="glyphicon glyphicon-wrench"></span>수정</button>	
	<button type="button" class="btn btn-warning" onclick="location.href='/living/jobboard/storydel.action?seq=${dto.seq}';"><span class="glyphicon glyphicon-scissors">삭제</span></button>	
	</div>
	
	<div class="storyCommentlist">
	<hr>
	
	<div class="storyComment">
		<div>&nbsp;asdf***&nbsp;&nbsp;&nbsp;&nbsp;<span class="commentDate">2021.03.01</span></div>
		<div>&nbsp;&nbsp;인생은 극복입니다 힘내십쇼</div>
	</div>
	<hr>
	
	<div class="storyComment">
		<div>&nbsp;asdf***&nbsp;&nbsp;&nbsp;&nbsp;<span class="commentDate">2021.03.01</span></div>
		<div>&nbsp;&nbsp;인생은 극복입니다 힘내십쇼</div>
	</div>
	<hr>

	<div class="storyComment">
		<div>&nbsp;asdf***&nbsp;&nbsp;&nbsp;&nbsp;<span class="commentDate">2021.03.01</span></div>
		<div>&nbsp;&nbsp;인생은 극복입니다 힘내십쇼</div>
	</div>
	<hr>
	
	</div>
	<!-- storyCommentlist 끝 -->
	
	<!--sendCommentArea 시작  -->
	<form>
	<div class="sendCommentArea">
	<textarea class="form-control" style="height: 100px; width: 600px; display: inline-block;">
	</textarea>
	<button type="submit" class="commentSendBtn" style="display: inline-block;">등록</button>
	</div>
	</form>
	
	</div>




</section>