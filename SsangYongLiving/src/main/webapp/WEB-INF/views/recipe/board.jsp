<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="recipe-board-container">

	<h3>고수들의 레시피</h3>
	<p>다른 쌍용리빙 회원이 올린 레시피입니다.<br>
	도전해보고싶은 레시피를 클릭해 자세히 알아보세요.</p>

	<div class="recipe-board">
		<div class="row">
			<div class="col-sm-6 col-md-4">
				<div class="thumbnail">
					<a href="/living/recipe/detail.action"><img src="/living/resources/images/recipe-4.jpg" alt="recipe-4.jpg"></a>
					<div class="caption">
						<h3>오븐에 빠진 오리</h3>
						<div>작성자: imthejubugudan</div>
						<span>난이도: 보통 | 별점:
						<c:forEach var="i" begin="0" end="2">
		    			<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
						</c:forEach>
						</span>
					</div>
				</div>
			</div>
			<div class="col-sm-6 col-md-4">
				<div class="thumbnail">
					<a href="#"><img src="/living/resources/images/recipe-1.jpg" alt="recipe-4.jpg"></a>
					<div class="caption">
						<h3>오븐에 빠진 오리</h3>
						<div>작성자: imthejubugudan</div>
						<span>난이도: 보통 | 별점:
						<c:forEach var="i" begin="0" end="2">
		    			<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
						</c:forEach>
						</span>
					</div>
				</div>
			</div>
			<div class="col-sm-6 col-md-4">
				<div class="thumbnail">
					<a href="#"><img src="/living/resources/images/recipe-9.jpg" alt="recipe-4.jpg"></a>
					<div class="caption">
						<h3>오븐에 빠진 오리</h3>
						<div>작성자: imthejubugudan</div>
						<span>난이도: 보통 | 별점:
						<c:forEach var="i" begin="0" end="2">
		    			<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
						</c:forEach>
						</span>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-6 col-md-4">
				<div class="thumbnail">
					<a href="#"><img src="/living/resources/images/recipe-7.jpg" alt="recipe-4.jpg"></a>
					<div class="caption">
						<h3>오븐에 빠진 오리</h3>
						<div>작성자: imthejubugudan</div>
						<span>난이도: 보통 | 별점:
						<c:forEach var="i" begin="0" end="2">
		    			<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
						</c:forEach>
						</span>
					</div>
				</div>
			</div>
			<div class="col-sm-6 col-md-4">
				<div class="thumbnail">
					<a href="#"><img src="/living/resources/images/recipe-8.jpg" alt="recipe-4.jpg"></a>
					<div class="caption">
						<h3>오븐에 빠진 오리</h3>
						<div>작성자: imthejubugudan</div>
						<span>난이도: 보통 | 별점:
						<c:forEach var="i" begin="0" end="2">
		    			<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
						</c:forEach>
						</span>
					</div>
				</div>
			</div>
			<div class="col-sm-6 col-md-4">
				<div class="thumbnail">
					<a href="#"><img src="/living/resources/images/recipe-3.jpg" alt="recipe-4.jpg"></a>
					<div class="caption">
						<h3>오븐에 빠진 오리</h3>
						<div>작성자: imthejubugudan</div>
						<span>난이도: 보통 | 별점:
						<c:forEach var="i" begin="0" end="2">
		    			<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
						</c:forEach>
						</span>
					</div>
				</div>
			</div>
		</div>
		
		<button type="button" class="btn btn-primary" id="write-button" onclick="location.href='/living/recipe/addRecipe.action'">레시피 쓰기</button>
		
		<!-- pagination -->
		<nav>
			<ul class="pagination">
				${pageBar}
			</ul>
		</nav>

	</div>

</div>






















