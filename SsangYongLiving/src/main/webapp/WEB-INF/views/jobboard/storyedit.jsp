<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<section>

	<div class="menuInfo">
	<img src="/living/resources/images/job/rInfo.png" style="width:30px;">
	<div class="menuTitle">알바 스토리&nbsp;&nbsp;&nbsp;<span class="menuTitleSub">글 수정</span></div>
	</div>
	<div class="menuLine"></div>

	<div class="writeStory">



		<form method="POST" action="/living/jobboard/storyeditok.action">
			<table class="table bordered">
				<tr>
					<th class="thColor">제목</th>
					<td><input type="text" name="title" class="form-control"
						value="${dto.title}"></td>
				</tr>
				<tr>
					<th class="thColor">내용</th>
					<td><textarea name="material" class="form-control"
							style="height: 270px;">${dto.material}</textarea></td>
				</tr>
			</table>

			<div class="writeInfo">
				<span class="glyphicon glyphicon-bell"
					style="width: 70px; font-size: 1.2em;"></span><span class="noInfo">근거없는
					비방글은 삭제될 수 있습니다.</span>
			</div>


			<div class="writeBtns">
				<button type="submit" class="btn btn-warning">글 수정</button>
				<button type="button" class="btn btn-default"
					onclick="location.href='/living/jobboard/storyview.action?seq=${dto.seq}';">뒤로</button>
			</div>
			<input type="hidden" name="seq" value="${dto.seq}">
			<!-- 글번호 -->
		</form>
		<div style="clear: both"></div>

	</div>
	<!-- writeStory 끝 -->



</section>