<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div id="recipe-detail-container">

	<h1><small>고수들의 레시피  / </small>${rdto.recipeSubject}</h1>
	
	<div class="recipe-info">
		<div class="recipe-thumbnail">
			<img src="/living/resources/images/${rdto.recipeImage}" alt="${rdto.recipeImage}">
		</div>
		<table>
			<tr>
				<th>작성자</th>
				<td colspan="3">
					${rdto.name}
				</td>
			</tr>
			<tr>
				<th>별점</th>
				<td>
					<c:forEach var="i" begin="1" end="${rdto.starAvg }">
	    			<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
					</c:forEach>
					<c:if test="${rdto.starAvg == 0}">
					<span class="glyphicon glyphicon-star-empty" aria-hidden="true"></span>
					</c:if>
				</td>
				<th>난이도</th>
				<td>
					${rdto.recipeLevel}
				</td>
			</tr>
			<tr>
				<th>요리 설명</th>
				<td colspan="3">
					<span>${rdto.recipeContent}</span>
				</td>
			</tr>
		</table>
	</div>
	
	<h3>필수 재료</h3>

	<div class="detail-ingre">

		<div class="recipe-cart" style="background: #C8EFD4;">
		
			<c:forEach items="${rsList}" var="rsdto">
			<div class="recipe-ingre-item">
				<img src="/living/resources/images/${rsdto.ingredientImage}">
				<div>${rsdto.ingredientName}</div>
				<div>${rsdto.recipeStockNum} ${rsdto.ingredientUnit}</div>
			</div>
			</c:forEach>

		</div>

	</div>
	
	<h3>요리 순서</h3>
	
	<div class="recipe-order">

		<div id="recipe-order-carousel" class="carousel slide"
			data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<c:forEach var="i" begin="1" end="${fn:length(roList)}">
				<li class="order-carousel-indicator" data-target="#carousel-example-generic" data-slide-to="i"></li>
				</c:forEach>
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox">
				<c:forEach items="${roList}" var="rodto">
				<div class="item order-carousel-item">
					<img src="/living/resources/images/${rodto.recipeOrderImage}" alt="${rodto.recipeOrderImage}">
					<div class="carousel-caption">${rodto.recipeOrderContent}</div>
				</div>
				</c:forEach>
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
				<c:forEach items="${rcList}" var="rcdto">
				<tr>
					<td>${rcdto.name}</td>
					<td>${rcdto.recipeCommentregdate}</td>
				</tr>
				<tr>
					<td>${rcdto.recipeCommentContent}</td>
					<td>
					<c:if test="${seq == rcdto.memberSeq}">
					<a href='/living/recipe/delComment.action?commentSeq=${rcdto.recipeCommentSeq}&recipeSeq=${rdto.recipeSeq}&page=${page}'>삭제</a>
					</c:if>
					</td>
				</tr>
				</c:forEach>
			</tbody>	
		</table>
		<c:if test="${access == 1 || access == 0}">
		<form method="POST" action="/living/recipe/addComment.action" id="recipe-add-comment-form" >
			<div class="form-group">
				<label for="recipe-add-content">댓글</label> 
				<textarea class="form-control" name="recipeCommentContent" placeholder="댓글을 작성해주세요." required></textarea>
			</div>
			<button type="submit" class="btn btn-default">댓글 달기</button>
			<div class="comment-star">
				<span>별점 : </span>
				<span class="star glyphicon glyphicon-star"></span>
				<span class="star glyphicon glyphicon-star"></span>
				<span class="star glyphicon glyphicon-star"></span>
				<span class="star glyphicon glyphicon-star-empty"></span>
				<span class="star glyphicon glyphicon-star-empty"></span>			
			</div>
			<input type="hidden" name="recipeCommentStar" id="recipeCommentStar" value="3">
			<input type="hidden" name="recipeSeq" id="recipeSeq" value="${rdto.recipeSeq}">
			<input type="hidden" name="page" id="page" value="${page}">
		</form>
		</c:if>
		
	</div>

	<div class="btn-group">
		<c:if test="${seq == rdto.memberSeq}">
		<button type="button" class="btn btn-default" onclick="location.href='/living/recipe/editRecipe.action?page=${page}&recipeSeq=${rdto.recipeSeq}'">수정</button>
		<button type="button" class="btn btn-default" id="delete-btn">삭제</button>
		</c:if>
		<button type="button" class="btn btn-default" onclick="location.href='/living/recipe/board.action?page=${page}'">목록</button>
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
					<button type="button" class="btn btn-danger" onclick="location.href='/living/recipe/delRecipe.action?seq=${rdto.recipeSeq}&page=${page}'">예, 삭제하겠습니다</button>
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
	
	$('.order-carousel-indicator').siblings().eq(0).addClass("active");
	$('.order-carousel-item').siblings().eq(0).addClass("active");
	
	$('.star').click(function() {
		$('.star').removeClass('glyphicon-star-empty');
		$('.star').removeClass('glyphicon-star');
		$(this).prevAll().addClass('glyphicon-star');
		$(this).addClass('glyphicon-star');
		$(this).nextAll().addClass('glyphicon-star-empty');
		$(this).siblings().eq(0).removeClass('glyphicon-star');
		
		$('#recipeCommentStar').attr('value', $(this).parent().find('.glyphicon-star').length);
		console.log($(this).parent().find('.glyphicon-star').length);
	});
</script>
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    