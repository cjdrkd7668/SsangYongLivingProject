<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="content" id="content">

	<div class="searchboxList">
		<input type="text" class="form-control" onkeyup="enterkey();"
			id="searchList" placeholder="찾고 싶은 상품을 검색해보세요!" style="display: inline;">
		<button class="img-button-search" type="submit">
			<i class="fa fa-search"></i>
		</button>
	</div>

	<div class="product-list">
		<div class="box">
		
			<c:forEach items="${list}" var="dto">
			<div class="procList" onclick="location.href='/living/used/productView.action?seq=${dto.seq}';" style="cursor:pointer">
				<img src="/living/resources/images/used/used01.jpg"
					style="width: 180px; border-radius: 5px;">
				<h5 class="etc" style="width: 180px">${dto.subject}</h5>
				<span>${dto.price}원</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>${dto.trade}</span>
			</div>
			</c:forEach>
			
		
		</div>
		<!-- box 끝 -->
	</div>

	<!-- 페이징  -->
	<div class="paging" style="text-align: center;">
		<!-- pagination -->
		<nav>
			<ul class="pagination">
				${pageBar}
			</ul>
		</nav>
	</div>




</div>
<!-- content 끝-->