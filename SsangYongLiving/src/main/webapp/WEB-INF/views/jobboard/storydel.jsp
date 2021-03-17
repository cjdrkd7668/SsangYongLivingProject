<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<section>

	<div class="menuInfo">
	<img src="/living/resources/images/job/rInfo.png" style="width:30px;">
	<div class="menuTitle">알바 스토리&nbsp;&nbsp;&nbsp;<span class="menuTitleSub">글 삭제</span></div>
	</div>
	<div class="menuLine"></div>

	<div class="bottomWrapper">
	
	<form method="POST" action="/living/jobboard/storydelok.action">
	<div>
		<button type="submit" class="btn btn-warning">글 삭제</button>
		<button type="button" class="btn btn-default" onclick="location.href='/living/jobboard/storyview.action';">뒤로</button>
	</div>
	<input type="hidden" name="seq" value="${seq}"> <!-- 글번호 -->
	</form>
	
	</div>


</section>