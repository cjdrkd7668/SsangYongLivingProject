<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<div class="content" id="content">

	<!-- 로그인 session test -->
	<div>${empty seq ? "익명" : seq}</div>	
	<div><a href="/living/used/auth.action">로그인하기</a></div>
	<!-- Test End -->
	
	<img src="/living/resources/images/used/mainimg.jpg" alt="mainimg">

	<div class="searchbox">
		<input type="text" class="form-control" onkeyup="enterkey();"
			id="search" placeholder="찾고 싶은 상품을 검색해보세요!" style="display: inline;">
		<button class="img-button" type="submit">
			<i class="fa fa-search"></i>
		</button>
	</div>

	<div class="popular" style="position: relative; top: -32px;">
		<h3>인기있는 상품</h3>
		<div class="line"></div>
	</div>


	<div class="popular-product">
		<div class="box">
			<div class="popList">
				<img src="/living/resources/images/used/used01.jpg"
					style="width: 180px; border-radius: 5px;">
				<h5>컨버스 척테일러</h5>
				<span>40,000원</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>택배/직거래</span>
			</div>

			<div class="popList">
			<img src="/living/resources/images/used/used01.jpg"
					style="width: 180px; border-radius: 5px;">
				<h5>컨버스 척테일러</h5>
				<span>40,000원</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>택배/직거래</span>
			</div>

			<div class="popList">
			<img src="/living/resources/images/used/used01.jpg"
					style="width: 180px; border-radius: 5px;">
				<h5>컨버스 척테일러</h5>
				<span>40,000원</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>택배/직거래</span>
			</div>

			<div class="popList">
					<img src="/living/resources/images/used/used01.jpg"
					style="width: 180px; border-radius: 5px;">
				<h5>컨버스 척테일러</h5>
				<span>40,000원</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>택배/직거래</span>
			</div>

			<div style="clear: both"></div>

			<div class="popList">
		<img src="/living/resources/images/used/used01.jpg"
					style="width: 180px; border-radius: 5px;">
				<h5>컨버스 척테일러</h5>
				<span>40,000원</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>택배/직거래</span>
			</div>

			<div class="popList">
				<img src="/living/resources/images/used/used01.jpg"
					style="width: 180px; border-radius: 5px;">
				<h5>컨버스 척테일러</h5>
				<span>40,000원</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>택배/직거래</span>
			</div>

			<div class="popList">
			<img src="/living/resources/images/used/used01.jpg"
					style="width: 180px; border-radius: 5px;">
				<h5>컨버스 척테일러</h5>
				<span>40,000원</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>택배/직거래</span>
			</div>

			<div class="popList">
			<img src="/living/resources/images/used/used01.jpg"
					style="width: 180px; border-radius: 5px;">
				<h5>컨버스 척테일러</h5>
				<span>40,000원</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>택배/직거래</span>
			</div>
		</div>
		<!-- box 끝 -->


	</div>
</div>

<!-- 버튼 -->
<button class="btn btn-warning btn-default-upload"  onclick="location.href='/living/used/productUpload.action';">상품 올리기</button>