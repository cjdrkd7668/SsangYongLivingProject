<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
/* 차트 CSS 시작 */
@import 'https://code.highcharts.com/css/highcharts.css';

/* Link the series colors to axis colors */
.highcharts-color-0 {
	fill: #FF6300;
	stroke: #FF6300;
}
.highcharts-axis.highcharts-color-0 .highcharts-axis-line {
	stroke: #FF6300;
}
.highcharts-axis.highcharts-color-0 text {
	fill: #FF6300;
}
.highcharts-color-1 {
	fill: #218380;
	stroke: #218380;
}
.highcharts-axis.highcharts-color-1 .highcharts-axis-line {
	stroke: #218380;
}
.highcharts-axis.highcharts-color-1 text {
	fill: #218380;
}
/* 차트 CSS 끝 */
</style>

<!-- container 시작 -->
<div class="container">

    <div class="panel">
        <h1><i class="fas fa-quote-left"></i>&nbsp;${dto.subject }&nbsp;<i class="fas fa-quote-right"></i></h1>
    </div>

    <!-- 상품 설명 테이블 시작 -->
    <table class="table table-default viewTable">
        <tr>
            <td colspan="2" rowspan="3">
                <img src="/living/resources/images/group/product001.jpg">
            </td>
            <td colspan="2"><h3 class="softbg">${dto.price }<small>&nbsp;원</small></h3></td>
        </tr>
        <tr>
            <td colspan="2">${dto.detail }</td>
        </tr>
        <tr>
            <td colspan="2">
                <div>
                    <input type="number" id="count" class="form-control" min="1" max="10" step="1" value="1"> 개
                </div>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <div>
                    <span class="orange">${dto.timeRemaining}</span>일 남음&nbsp;&nbsp;&nbsp;&nbsp;
                </div>
            </td>
            <td colspan="2">
                <div>
                    총 상품 금액 : <span id="totalPrice"></span>원
                </div>
            </td>
        </tr>
        <tr>
            <!-- <td><div class="glyphicon glyphicon-heart-empty grey"></div></td> -->
            <td>
                <div class="glyphicon glyphicon-heart red"></div>
            </td>
            <!-- <td><div class="glyphicon glyphicon-shopping-cart red"></div></td> -->
            <td>
                <div class="glyphicon glyphicon-shopping-cart grey"></div>
            </td>
            <td colspan="2">
                <button class="form-control orangebg">구매하기</button>
            </td>
        </tr>
        <tr>
            <td colspan="4"></td>
        </tr>
    </table>
    <!-- 상품 설명 테이블 끝 -->
    
    <div class="divider" style="top: -16px;"></div>
    
    
    <!-- 오늘 새 글/전체 글 버튼 시작 -->
    <div class="mypageBtn">
        <button class="btn btn-default">
            <b>QnA</b>
        </button>
        <button class="btn btn-default" onclick="location.href='/living/group/community/list.action?postSeq=${dto.seq}&nowPage=1';">
            <b>공구 이모저모</b>
        </button>
    </div>
    <!-- 오늘 새 글/전체 글 버튼 끝 -->

    <!-- 좌측 게시판 시작 -->
    <div class="col-md-9">

        <!-- Qna 테이블 시작 -->
        <table class="table commuTable">
            <tr class="softbg">
                <th>번호</th>
                <th>제목</th>
                <th>글쓴이</th>
                <th>작성일</th>
                <th>조회</th>
            </tr>
            
            <c:forEach items="${qlist }" var="qdto">
            
            <!-- 회원이 쓴 글이라면 --> 
            <c:if test="${not empty qdto.memberSeq}">
            <tr>
                <td>${qdto.seq}</td>
	            <td>${qdto.subject}</td>
	            <td>${qdto.name }</td>
                <td>${qdto.updateDate }</td>
                <td>${qdto.readCount }</td>
            </tr>
            </c:if>
            
            <!-- 업체가 쓴 글이라면 -->
            <c:if test="${not empty qdto.companySeq}">
            <tr class="softbg">
                <td>${qdto.seq}</td>
	            <td>RE : ${qdto.subject}</td>
	            <td>${qdto.name }</td>
                <td>${qdto.updateDate }</td>
                <td>${qdto.readCount }</td>
	        </tr>
            </c:if>
            </c:forEach>
        </table>
        <!-- Qna 테이블 끝 -->

        <button class="btn writeBtn">글쓰기</button>

        <div style="clear: both;"></div>

    </div>
    <!-- 좌측 게시판 끝 -->

    <!-- 우측 업체 정보 시작 -->
    <div class="col-md-3">
        <table class="table table-default companyTable">
            <tr>
                <th>업체 : ${dto.companyName }</th>
            </tr>
            <tr>
            	<!-- 지도 시작 -->
                <td><div id="map" style="width:180px; height:180px; margin: 0px auto;"></div></td>
                <!-- 지도 끝 -->
            </tr>
            <tr>
                <td>
                    <div>마지막 로그인 <small>${dto.companyLastTime }</small></div>
                    <div>진행 중인 공구 <small>${dto.companyCount }</small></div>
                </td>
            </tr>
            <tr>
                <td>
                    <button class="btn chatBtn" onclick="location.href='/living/group/community/chat.action?companySeq=${dto.companySeq}';">
                    	<div class="glyphicon glyphicon-envelope"></div>
                    	&nbsp;1:1 문의하기
                    </button>
                    
                </td>
            </tr>
             <tr>
            	<td>
            		<!-- 차트 시작 -->
				    <div id="chart" style="width: 200px; height: 200px;"></div>
				    <!-- 차트 끝 -->
            	</td>
            </tr>
        </table>

    </div>
    <!-- 우측 업체 정보 끝 -->

</div>
<!-- container 끝 -->

<script src="/living/resources/js/highcharts.js"></script>
<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=950df7fcc5aace4db5b109e8c92b5034&libraries=services"></script>
<script>

	/* 지도 시작 */
	var postLat = 37.499343405328595;
	var postLng = 127.03321257686713;		
	var address = "${dto.companyAddress}";

	var container = document.getElementById('map');
	var options = {
		center : new kakao.maps.LatLng(postLat, postLng),
		level : 3
	};

	var map = new kakao.maps.Map(container, options);
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();

	// 주소로 좌표를 검색합니다
	geocoder.addressSearch(address, function(result, status) {

	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {

	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });

	        //인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new kakao.maps.InfoWindow({
	       	    content: '<div style="width:90px;text-align:center;">${dto.companyName}</div>'
	        });
	        infowindow.open(map, marker);

	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	});    
	/* 지도 끝 */
	
	/* 차트 시작 */
	Highcharts.chart('chart', {
    
		
	chart: {
            type: 'column',
            styledMode: true
        },
    
        title: {
            text: ' '
        },
    
        yAxis: [{
            className: 'highcharts-color-0',
            title: {
                text: ' '
            }
        }, {
            className: 'highcharts-color-1',
            opposite: true,
            title: {
                text: ' '
            }
        }],
        
        xAxis: {
            categories: ['현재 공구 글']
        },
    
        plotOptions: {
            column: {
                borderRadius: 10
            }
        },
    
        series: [{
        	name: '판매 수량',
            data: [50],
            yAxis: 0
        }, {
        	name: '공구 달성률',
            data: [90],
            yAxis: 1
        }]
    
    });
	/* 차트 끝 */
	
	//페이지 로드 되었을 때는 1개의 값
	window.onload = function() {
		$("#totalPrice").text(${dto.price});
    };

	//구매 개수를 다르게 할 때마다 총 값도 변한다.
	$("#count").change(function(){
		var price = ${dto.price};
		$("#totalPrice").text($("#count").val() * price);
	});
	
</script>