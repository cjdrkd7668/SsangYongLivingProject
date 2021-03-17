<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="recipe-detail-container">

	<h1><small>고수들의 레시피  / </small>오븐에 빠진 오리</h1>
	
	<div class="recipe-info">
		<div class="recipe-thumbnail">
			<a href="#"><img src="/living/resources/images/recipe-4.jpg" alt="recipe-4.jpg"></a>
		</div>
		<table>
			<tr>
				<th>작성자</th>
				<td colspan="3">
					imthejubugudan
				</td>
			</tr>
			<tr>
				<th>별점</th>
				<td>
					<c:forEach var="i" begin="0" end="2">
	    			<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
					</c:forEach>
				</td>
				<th>난이도</th>
				<td>
					보통
				</td>
			</tr>
			<tr>
				<th>요리 설명</th>
				<td colspan="3">
					<span>TV에도 나온 유명 셰프의 레시피랍니다~</span>
				</td>
			</tr>
		</table>
	</div>
	
	<h3>필수 재료</h3>

	<div class="detail-ingre">

		<div class="recipe-cart" style="background: #C8EFD4;">

			<div class="recipe-ingre-item">
				<img src="/living/resources/images/ingredient-egg.png">
				<div>계란</div>
				<div>2 구</div>
			</div>
			<div class="recipe-ingre-item">
				<img src="/living/resources/images/ingredient-leeks.png">
				<div>대파</div>
				<div>1 단</div>
			</div>
			<div class="recipe-ingre-item">
				<img src="/living/resources/images/ingredient-bacon.png">
				<div>베이컨</div>
				<div>5 장</div>
			</div>

		</div>

	</div>
	
	<h3>요리 순서</h3>
	
	<div class="recipe-order">

		<div id="recipe-order-carousel" class="carousel slide"
			data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#carousel-example-generic" data-slide-to="0"
					class="active"></li>
				<li data-target="#carousel-example-generic" data-slide-to="1"></li>
				<li data-target="#carousel-example-generic" data-slide-to="2"></li>
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox">
				<div class="item active">
					<img src="/living/resources/images/recipe-order-2.jpg" alt="recipe-order-2.jpg">
					<div class="carousel-caption">대파를 송송 썰어서 준비해주시고, 베이컨은 상온에 10분정도 두시면 됩니다.</div>
				</div>
				<div class="item">
					<img src="/living/resources/images/recipe-order-3.jpg" alt="recipe-order-3.jpg">
					<div class="carousel-caption">대파를 송송 썰어서 준비해주시고, 베이컨은 상온에 10분정도 두시면 됩니다.</div>
				</div>
				<div class="item">
					<img src="/living/resources/images/recipe-order-4.jpg" alt="recipe-order-4.jpg">
					<div class="carousel-caption">대파를 송송 썰어서 준비해주시고, 베이컨은 상온에 10분정도 두시면 됩니다.</div>
				</div>
			</div>

			<!-- Controls -->
			<a class="left carousel-control" href="#carousel-example-generic"
				role="button" data-slide="prev"> <span
				class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#carousel-example-generic"
				role="button" data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>

	</div>
	
	<h3>댓글</h3>
	<p>타인에게 상처가 되는 말은 삼가해주세요.</p>
	
	<div class="recipe-comment">
		
		<table class="comment-section">
			<thead>
				<tr>
					<th></th>
					<th></th>				
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>cjddpf</td>
					<td>2021-03-11</td>
				</tr>
				<tr>
					<td>오늘 저녁으로 해먹었는데, 정말 맛있네요! 다음에도 기대하겠습니다. 레시피 또 올려주세요~</td>
					<td><a>삭제</a></td>
				</tr>
				<tr>
					<td>jubu100dan</td>
					<td>2021-03-12</td>
				</tr>
				<tr>
					<td>솔직히 별론데 ㅋㅋ</td>
					<td><a>삭제</a></td>
				</tr>
			</tbody>	
		</table>
		
	</div>

	<div class="btn-group">
		<button type="button" class="btn btn-default" onclick="location.href='/living/recipe/editRecipe.action'">수정</button>
		<button type="button" class="btn btn-default" id="delete-btn">삭제</button>
		<button type="button" class="btn btn-default" onclick="location.href='/living/recipe/board.action'">목록</button>
	</div>

	<div class="modal fade" id="delete-recipe-modal" tabindex="-1" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">삭제</h4>
				</div>
				<div class="modal-body">
					<p>정말 레시피를 삭제하시겠습니까? </p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">다시 생각해볼게요</button>
					<button type="button" class="btn btn-danger" onclick="location.href='/living/recipe/delete.action'">예, 삭제하겠습니다</button>
				</div>
			</div>
		</div>
	</div>
</div>   
    
<script>
	$('.carousel').carousel({
		interval : false
	})

	$('.right').click(function() {
		$('.carousel').carousel('next');
	})

	$('.left').click(function() {
		$('.carousel').carousel('prev');
	})

	$('#delete-btn').click(function() {
		$('#delete-recipe-modal').modal('show')
	})
</script>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    