<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
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
</style>
<!-- container 시작 -->
<div class="container">

    <div class="panel">
        <h1><i class="fas fa-quote-left"></i>&nbsp;고당도 오렌지 1kg&nbsp;<i class="fas fa-quote-right"></i></h1>
    </div>

    <!-- 상품 설명 테이블 시작 -->
    <table class="table table-default viewTable">
        <tr>
            <td colspan="2" rowspan="3">
                <img src="/living/resources/images/group/product001.jpg">
            </td>
            <td colspan="2"><h3 class="softbg">9900<small>&nbsp;원</small></h3></td>
        </tr>
        <tr>
            <td colspan="2">이번에 소개해드리는 오렌지는 더욱 맛이 진해진 고당도 오렌지입니다.<br>
                미국의 햇살을 받아 달콤하게 자란 오렌지로 특별히 달콤한 오렌지만 골라왔습니다.<br>
                다른 사이트에서 보지 못 했던 가격으로 제공하기 위해 한정 수량 판매합니다.<br>
                고당도 오렌지의 달콤함을 만끽해보시길 바랍니다^^</td>
        </tr>
        <tr>
            <td>
                <div>
                    <input type="number" class="form-control" min="1" max="10" step="1" value="1"> 개
                </div>
            </td>
            <td>
                <button class="form-control orangebg">구매하기</button>
            </td>
        </tr>
        <tr>
            <!-- <td><div class="glyphicon glyphicon-heart-empty grey"></div></td> -->
            <td><div class="glyphicon glyphicon-heart red"></div></td>
            <td><div class="glyphicon glyphicon-shopping-cart grey"></div></td>
            <!-- <td><div class="glyphicon glyphicon-shopping-cart red"></div></td> -->
            <td colspan="2"><span class="orange">5</span>일 남음&nbsp;&nbsp;&nbsp;&nbsp;</td>
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
        <button class="btn btn-default" onclick="location.href='/living/group/community/list.action';">
            <b>공구 이모저모</b>
        </button>
    </div>
    <!-- 오늘 새 글/전체 글 버튼 끝 -->

    <!-- 좌측 게시판 시작 -->
    <div class="col-md-9">

        <!-- Qna 테이블 시작 -->
        <table class="table table-hover commuTable">
            <tr class="softbg">
                <th>번호</th>
                <th>제목</th>
                <th>글쓴이</th>
                <th>작성일</th>
                <th>조회</th>
            </tr>
            <tr>
                <td>3</td>
                <td>배송 언제 되나요?</td>
                <td>홍길동</td>
                <td>10:10</td>
                <td>1</td>
            </tr>
            <tr>
                <td>3</td>
                <td>RE: 답변입니다.</td>
                <td>과일나라</td>
                <td>10:11</td>
                <td>1</td>
            </tr>
            <tr>
                <td>3</td>
                <td>배송 언제 되나요?</td>
                <td>홍길동</td>
                <td>10:10</td>
                <td>1</td>
            </tr>
            <tr>
                <td>3</td>
                <td>RE: 답변입니다.</td>
                <td>과일나라</td>
                <td>10:11</td>
                <td>1</td>
            </tr>
            <tr>
                <td>3</td>
                <td>배송 언제 되나요?</td>
                <td>홍길동</td>
                <td>10:10</td>
                <td>1</td>
            </tr>
            <tr>
                <td>3</td>
                <td>RE: 답변입니다.</td>
                <td>과일나라</td>
                <td>10:11</td>
                <td>1</td>
            </tr>
            <tr>
                <td>3</td>
                <td>배송 언제 되나요?</td>
                <td>홍길동</td>
                <td>10:10</td>
                <td>1</td>
            </tr>
            <tr>
                <td>3</td>
                <td>RE: 답변입니다.</td>
                <td>과일나라</td>
                <td>10:11</td>
                <td>1</td>
            </tr>
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
                <th>업체 : 과일나라</th>
            </tr>
            <tr>
            	<!-- 지도 시작 -->
                <td><div id="map" style="width:180px; height:180px; margin: 0px auto;"></div></td>
                <!-- 지도 끝 -->
            </tr>
            <tr>
                <td>
                    <div>마지막 로그인 <small>14:31</small></div>
                    <div>진행 중인 공구 <small>3</small></div>
                </td>
            </tr>
            <tr>
                <td>
                    
                    <button class="btn chatBtn"><div class="glyphicon glyphicon-envelope"></div>&nbsp;&nbsp;1:1 문의하기</button>
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
	var address = "서울시 강남구 역삼동 테헤란로 132";

	var container = document.getElementById('map');
	var options = {
		center : new kakao.maps.LatLng(postLat, postLng),
		level : 4
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
	       	    content: '<div style="width:100px;text-align:center;padding:6px 0;">과일나라</div>'
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
	
</script>