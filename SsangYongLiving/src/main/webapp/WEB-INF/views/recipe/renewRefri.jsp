<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="recipe-grid-container" id="renew-refri">

	<div class="recipe-gbox recipe-gbox-one">	
		
		<h2>냉장고 최신화</h2>
		<p>재료를 선택해서, 수량을 입력 후 냉장고에 등록하세요.<br>
		냉장고에 재료를 추가할 때 마다, 레시피를 추천해드립니다.</p>
		
		<div class="recipe-cart">
			
			<div class="recipe-ingre-item">
				<img src="/living/resources/images/ingredient-beef.png">
				<div>소고기</div>
				<div>(단위: g)</div>	
			</div>
			<div class="recipe-ingre-item">
				<img src="/living/resources/images/ingredient-tomato.png">
				<div>토마토</div>
				<div>(단위: 개)</div>
			</div>
			<div class="recipe-ingre-item">
				<img src="/living/resources/images/ingredient-egg.png">
				<div>계란</div>
				<div>(단위: 구)</div>
			</div>
			<div class="recipe-ingre-item">
				<img src="/living/resources/images/ingredient-leeks.png">
				<div>대파</div>
				<div>(단위: 개)</div>
			</div>
			<div class="recipe-ingre-item">
				<img src="/living/resources/images/ingredient-bacon.png">
				<div>베이컨</div>
				<div>(단위: 장)</div>
			</div>
			<div class="recipe-ingre-item">
				<img src="/living/resources/images/ingredient-beef.png">
				<div>소고기</div>
				<div>(단위: g)</div>	
			</div>
			<div class="recipe-ingre-item">
				<img src="/living/resources/images/ingredient-tomato.png">
				<div>토마토</div>
				<div>(단위: 개)</div>
			</div>
			<div class="recipe-ingre-item">
				<img src="/living/resources/images/ingredient-egg.png">
				<div>계란</div>
				<div>(단위: 구)</div>
			</div>
			<div class="recipe-ingre-item">
				<img src="/living/resources/images/ingredient-leeks.png">
				<div>대파</div>
				<div>(단위: 개)</div>
			</div>
			<div class="recipe-ingre-item">
				<img src="/living/resources/images/ingredient-bacon.png">
				<div>베이컨</div>
				<div>(단위: 장)</div>
			</div><div class="recipe-ingre-item">
				<img src="/living/resources/images/ingredient-beef.png">
				<div>소고기</div>
				<div>(단위: g)</div>	
			</div>
			<div class="recipe-ingre-item">
				<img src="/living/resources/images/ingredient-tomato.png">
				<div>토마토</div>
				<div>(단위: 개)</div>
			</div>
			<div class="recipe-ingre-item">
				<img src="/living/resources/images/ingredient-egg.png">
				<div>계란</div>
				<div>(단위: 구)</div>
			</div>
			<div class="recipe-ingre-item">
				<img src="/living/resources/images/ingredient-leeks.png">
				<div>대파</div>
				<div>(단위: 개)</div>
			</div>
			<div class="recipe-ingre-item">
				<img src="/living/resources/images/ingredient-bacon.png">
				<div>베이컨</div>
				<div>(단위: 장)</div>
			</div>
			
		</div>
		
		<div class="recipe-etc btn-group">
			<button type="button" class="btn btn-success" data-toggle="modal" data-target="#add-etc">기타 재료 추가</button>
		</div>

		<div class="modal fade" id="add-etc" tabindex="-1" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title">기타 재료 추가</h4>
					</div>
					<div class="modal-body">
			            <label for="etc-text" class="control-label">메모해둘 기타 재료를 자유롭게 작성하세요:</label>
			            <textarea class="form-control" id="etc-text"></textarea>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">취소하기</button>
						<button type="button" class="btn btn-primary">저장하기</button>
					</div>
				</div>
			</div>
		</div>



	</div>
	
	<div class="recipe-gbox recipe-gbox-two">
	
		<h2>내 가상 냉장고</h2>
		<p>재료를 선택해서, 수량을 입력 후 냉장고에 등록하세요.<br>
		냉장고에 재료를 추가할 때 마다, 레시피를 추천해드립니다.</p>
		
		<div class="recipe-cart">
		
			<div class="recipe-ingre-item">
				<img src="/living/resources/images/ingredient-egg.png">
				<div>계란</div>
				<div>12 구</div>
			</div>
			<div class="recipe-ingre-item">
				<img src="/living/resources/images/ingredient-leeks.png">
				<div>대파</div>
				<div>2 단</div>
			</div>
			<div class="recipe-ingre-item">
				<img src="/living/resources/images/ingredient-bacon.png">
				<div>베이컨</div>
				<div>22 장</div>
			</div>
			
		</div>
		
		<div class="recipe-etc btn-group">
			<button type="button" class="btn btn-info" data-container="body" data-toggle="popover" data-placement="top" data-content="Vivamus sagittis lacus vel augue laoreet rutrum faucibus." id="recipe-etc">
    			기타 재료 보기
  			</button>
		</div>
		
		
	</div>
	
	<div class="recipe-gbox recipe-gbox-three">
		
		<h2>고수들의 레시피</h2>
		<p>냉장고에 재료를 추가할 때 마다, 레시피를 추천해드립니다.<br>
		레시피의 썸네일을 클릭하시면, 상세페이지로 이동합니다.</p>
		
		<div class="recipe-cart">
			<div class="row">
				<div class="col-sm-6 col-md-4">
					<div class="thumbnail">
						<a href="#"><img src="/living/resources/images/recipe-4.jpg" alt="recipe-4.jpg"></a>
						<div class="caption">
							<h3>오븐에 빠진 오리</h3>
							<div>작성자: imthejubugudan</div>
							<span>난이도: 보통 | 별점:
							<c:forEach var="i" begin="1" end="3">
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
						<a href="#"><img src="/living/resources/images/recipe-1.jpg" alt="recipe-1.jpg"></a>
						<div class="caption">
							<h3>소고기 큰 무국</h3>
							<div>작성자: ilikemooyoulike</div>
							<span>난이도: 쉬움 | 별점:
							<c:forEach var="i" begin="1" end="4">
			    			<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
							</c:forEach>
							</span>
						</div>
					</div>
				</div>
			</div>
		</div>
			
		<div class="recipe-etc btn-group">
			<button type="button" class="btn btn-primary">레시피 더 보기</button>
		</div>
		
	</div>

</div>

<script>
	$('#recipe-etc').mouseover(function() {
		$(this).popover('show')
	})
	
	$('#recipe-etc').mouseleave(function() {
		$(this).popover('hide')
	})
	
</script>




























































