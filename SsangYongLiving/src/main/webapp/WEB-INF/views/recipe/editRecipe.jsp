<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div id="recipe-add-container">

	<h1>레시피 수정</h1>
	<p>레시피의 재료, 정보, 조리 순서를 수정할 수 있습니다!<br>
	
	<h3>필수 재료</h3>
	
	<div class="btn-group">
		<button type="button" class="btn btn-primary" id="add-btn">재료 추가 하기</button>
	</div>
	
	<form method="POST" encType="multipart/form-data"> 
	
	<div class="add-ingre">

		<div class="recipe-cart" id="add-recipes-here" style="background: #C8EFD4;">

		</div>
		
		<!-- 재료 모달 -->
		<div class="modal fade" id="add-ingre-modal" tabindex="-1" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title">재료 추가 하기</h4>
					</div>
					<div class="modal-body">
						<p>추가하고자 하는 재료를 눌러, 수량을 선택해주세요.</p>
						<div class="recipe-cart" style="background: #C8EFD4;">
	
							<!-- dto + c:forEach -->
							<div class="recipe-ingre-item recipe-ingre" data-seq="2">
								<img src="/living/resources/images/ingredient-beef.png">
								<div>소고기</div>
								<div>
									(단위: <span>g</span>)
								</div>
							</div>
							<div class="recipe-ingre-item recipe-ingre" data-seq="8">
								<img src="/living/resources/images/ingredient-tomato.png">
								<div>토마토</div>
								<div>
									(단위: <span>개</span>)
								</div>
							</div>
							<div class="recipe-ingre-item recipe-ingre" data-seq="5">
								<img src="/living/resources/images/ingredient-egg.png">
								<div>계란</div>
								<div>
									(단위: <span>구</span>)
								</div>
							</div>
							<div class="recipe-ingre-item recipe-ingre" data-seq="6">
								<img src="/living/resources/images/ingredient-leeks.png">
								<div>대파</div>
								<div>
									(단위: <span>개</span>)
								</div>
							</div>
							<div class="recipe-ingre-item recipe-ingre" data-seq="16">
								<img src="/living/resources/images/ingredient-bacon.png">
								<div>베이컨</div>
								<div>
									(단위: <span>장</span>)
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 재료 추가 모달 -->
		<div class="modal fade" id="add-ingre-g" tabindex="-1" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title">재료 추가</h4>
					</div>
					<div class="modal-body">
			            <label for="etc-text" class="control-label">추가할 재료의 용량을 선택해주세요 :</label>
			            <div class="slider-ingre">
	 							<input type="range" min="0" max="2000" step="50" value="200" class="slider range-ingre">
						</div>
						<span>200</span>
						<span>g</span>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary add-ingre-modal-ok">추가하기</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">취소하기</button>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 재료 추가 수량 모달 -->
		<div class="modal fade" id="add-ingre-nong" tabindex="-1" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title">재료 추가</h4>
					</div>
					<div class="modal-body">
			            <label for="etc-text" class="control-label">추가할 재료의 수량을 선택해주세요 :</label>
			            <div class="slider-ingre">
	 							<input type="range" min="1" max="20" value="10" class="slider range-ingre">
						</div>
						<span>10</span>
						<span>개</span>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary add-ingre-modal-ok">추가하기</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">취소하기</button>
					</div>
				</div>
			</div>
		</div>
		
	</div>
	
	<h3>레시피 정보 입력</h3>
	
	<div class="add-recipe-info">
		
		<div class="add-form-block">
			<div class="form-group">
				<label for="recipe-subject">제목</label> 
				<input type="text" class="form-control" id="recipe-add-subject" name="#" placeholder="제목을 입력하세요.">
			</div>
	
			<div class="form-group">
				<label for="recipe-add-thumbnail">파일 업로드</label> 
				<input type="file" id="recipe-add-thumbnail" name="#">
				<p class="help-block">레시피의 썸네일로 사용할 이미지파일을 첨부해주세요.</p>
			</div>
			
			<div class="form-group">
				<label for="recipe-add-thumbnail">난이도</label> 
				<select class="form-control" id="recipe-add-level">
					<option>쉬움</option>
					<option>보통</option>
					<option>고수</option>
				</select>
			</div>
			
			<div class="form-group">
				<label for="recipe-add-content">레시피 설명</label> 
				<textarea class="form-control" id="recipe-add-content" placeholder="레시피를 설명해주세요."></textarea>
			</div>
		</div>
		<div class="recipe-thumbnail">
			<img src="/living/resources/images/default-image.png" alt="이미지를 첨부해주세요.">
		</div>

	</div>
	
	<h3>조리 순서</h3>
	<p>조리 순서 추가를 눌러 순서대로 조리 이미지와 설명을 입력해주세요.</p>
	
	<div class="add-recipe-order">
		
		<div class="btn-group">
			<button type="button" class="btn btn-info" id="add-order-btn">조리 순서 추가 하기</button>
		</div>
	
		<div id="add-orders-here">
		</div>
	
	</div>
	
	<div class="btn-group btn-group-ok">
		<button type="submit" class="btn btn-primary">작성하기</button>
		<button type="button" class="btn btn-default" onclick="location.href='/living/recipe/board.action'">취소하기</button>
	</div>
	
	</form>

</div>

<script>

	$('#add-btn').click(function() {
		$('#add-ingre-modal').modal('show')
	})
	
	$('.recipe-ingre').click(function() {
		if ($(this).children().last().children().eq(0).text() == 'g') {
			$('#add-ingre-g').modal('show')
		} else {			
			$('#add-ingre-nong').modal('show')
		}
	})
	
	//모달 내에서 range 값을 변경할 때 마다 value 보여주기
	$('.range-ingre').on('input', function() {
	  	$(this).parent().next().text(this.value);
	})
	
	$('#add-order-btn').click(function() {
		var orderHTML = $('#add-orders-here').html();
		
		orderHTML += '<div class="added-order">';
		orderHTML += '<div class="form-group">';
		orderHTML += '<label for="recipe-order-img-1">조리 사진</label>';
		orderHTML += '<input type="file" class="form-control" name="recipeOrderImage">';
		orderHTML += '</div>';
		orderHTML += '<div class="form-group">';
		orderHTML += '<label for="recipe-order-subject-1">설명</label> ';
		orderHTML += '<input type="text" class="form-control" name="recipeOrderSubject" placeholder="조리 순서를 설명해주세요.">';
		orderHTML += '</div>';
		orderHTML += '<button type="button" class="btn btn-default remove-order">삭제하기</button>';
		orderHTML += '</div>';
		orderHTML += '';
		
		$('#add-orders-here').html(orderHTML);

	})
	
	$(document).on("click", '.remove-order', function(){
		$(this).parent().remove();
	});
	
	$('.recipe-ingre').click(function() {
		$('.recipe-ingre').removeClass('selected-ingre');
		$(this).addClass('selected-ingre');
	})
	
	$('.add-ingre-modal-ok').click(function() {
		var ingreHTML = $('#add-recipes-here').html();
		
		ingreHTML += '<div class="recipe-ingre-item added-ingre">';
		ingreHTML += '<img src="' + $('.selected-ingre').children().eq(0).attr("src") + '">';
		ingreHTML += '<div>' + $('.selected-ingre').children().eq(1).text() + '</div>';
		ingreHTML += '<div>' + $(this).parent().prev().children().eq(2).text() + ' ' + $('.selected-ingre').children().eq(2).children().eq(0).text() +'</div>';
		ingreHTML += '<input type="hidden" name="ingredientSeq" value="' + $('.selected-ingre').attr("data-seq") + '">';
		ingreHTML += '<input type="hidden" name="recipeStockNum" value="' + $(this).parent().prev().children().eq(2).text() + '">';
		ingreHTML += '</div>';
		
		$('#add-recipes-here').html(ingreHTML);

	})	
	
	$(document).on("click", '.added-ingre', function() {
		$(this).remove();
	});
	
</script>











































