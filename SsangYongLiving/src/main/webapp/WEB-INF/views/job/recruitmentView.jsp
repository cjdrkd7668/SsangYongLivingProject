<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<section>

	<div>
	<img src="/living/resources/images/job/market02.jpg" style="filter: brightness(50%);" class="middleContent">
	<div class="middleSub">서빙/음식점</div>
	<div class="middleTitle">${dto.storeName}</div>
	</div>
	
	

	<div class="bottomWrapper">
	
	<div class="announcementUpper">
	

	
	<div class="aInfoContentWrapper">
		<div class="aInfoContent">
		<div><img src="/living/resources/images/job/job.png" style="width:50px;"></div>
		<div class="infoDetail">서빙</div>
		</div>
		
		<div class="aInfoContent">
		<div><img src="/living/resources/images/job/money.png" style="width:50px;"></div>
		<div class="infoDetail">${dto.wage}원</div>
		</div>
		
		<div class="aInfoContent">
		<div><img src="/living/resources/images/job/calendar.png" style="width:50px;"></div>
		<div class="infoDetail">${dto.workingDay}</div>
		</div>
		
		<div class="aInfoContent">
		<div><img src="/living/resources/images/job/chronometer.png" style="width:50px;"></div>
		<div class="infoDetail">시간협의</div>
		</div>
		<div style="clear:both"></div>		
		
	</div>
	<!-- aInfoContentWrapper -->
	
	<div class="announcementLine"></div>
		
	<div class="startInfo">근무시작일: <span class="aStartDate">${dto.startDay} ~ ${dto.endDay}</span></div>

	<div class="aAddress">주소: <span class="aAddressImpact">${dto.address}</span></div>
	
	
	<div class="applyArea">
	<a class="btn btn-warning btn-lg" href="#" role="button">지원하기</a>
	</div>
	
	</div>
	<!-- announcementUpper 끝 -->
	<div class="rInfoBottom">한줄 주요사항: ${dto.mainPoint}</div>
	
	<!-- 브라우저에 띄워보기 -->
	<!-- 
	<div>남지원자수: ${cdto.MNum} 여지원자수: ${cdto.FNum} 총합:${cdto.totalNum}</div>
	 -->
	 
	<div class="announcementLower">
	<h4>오시는 길</h4>
	
	
	<div id="map" style="width:800px;height:300px;"></div>
	
	
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=	f8be647e9bcdabb5c7ddc1287e93d363&libraries=services"></script>
	
	
	<script>

	var address = "${dto.address}";	
	//코드 실행 순서는 JAVA -> JSTL -> HTML -> JavaScript 순이기 때문에
	//script 영역에서 jstl의 el 구문을 사용할 수 있다. --> 
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
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
	
	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new kakao.maps.InfoWindow({
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">우리 가게</div>'
	        });
	        infowindow.open(map, marker);
	
	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	});  
	
		
	</script>
	
	
	</div>
	<!-- 오시는길 영역 끝 -->

	<div class="announcementLower">
	<h4>지원자 통계</h4>
	
	
	<div class="chatInfo">
	<h5>성별</h5>
	<div id="piechart" style="width: 200px; height: 200px; display:inline-block;"></div>
	</div>
	
	<div class="chatInfo">
	<h5>연령</h5>
	<div id="columnchart_values" style="width: 200px; height: 200px; display:inline-block;"></div>
	</div>
	
	<div class="chatInfo">
	<h5>경력</h5>
	<div id="donutchart" style="width: 230px; height: 230px;"></div>
	</div>
	<div style="clear:both"></div>
	
	</div>
	<!-- 지원자 통계 영역 끝 -->
	
	<div class="lowerBtnArea">
	<button type="submit" class="btn btn-warning">뒤로</button>
	<button type="submit" class="btn btn-warning">북마크</button>
	</div>
	
	</div>
	<!-- bottomWrapper 끝 -->

</section>


<!-- 파이차트 -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
 
        <!-- 이 부분은 get으로 가져오기 -->
        
		var man = ${cdto.getMNum()};
		var woman = ${cdto.getFNum()};
		var totalNum = ${cdto.getTotalNum()};
		
		var manInfo = man / totalNum * 10;
		var womanInfo = woman / totalNum * 10;
		
		
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Language', 'Speakers (in millions)'],
          ['남',  manInfo],
          ['여',  womanInfo]
        ]);

      var options = {
        legend: 'none',
        pieSliceText: 'label',
        title: '',
        pieStartAngle: 100,
      };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));
        chart.draw(data, options);
      }
</script>

<!-- 히스토그램, 연령 -->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
    
    
    google.charts.load("current", {packages:['corechart']});
    google.charts.setOnLoadCallback(drawChart);
    function drawChart() {
      var data = google.visualization.arrayToDataTable([
        ["연령대", "명(수)", { role: "style" } ],
        <c:forEach items="${list}" var="adto" varStatus="status">


		
        ["${adto.age}", ${adto.ageCnt}, "#b87333"]
        
		
        <c:if test="${status.index < list.size() - 1}">
        ,
		</c:if>
        
        </c:forEach>
      ]);

      var view = new google.visualization.DataView(data);
      view.setColumns([0, 1,
                       { calc: "stringify",
                         sourceColumn: 1,
                         type: "string",
                         role: "annotation" },
                       2]);

      var options = {
        title: "지원자 연령별 통계",
        width: 200,
        height: 200,
        bar: {groupWidth: "95%"},
        legend: { position: "none" },
      };
      var chart = new google.visualization.ColumnChart(document.getElementById("columnchart_values"));
      chart.draw(view, options);
  }
    </script>
    
    
<!-- 경력, 도넛차트 -->

    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'],
          
          <c:forEach items="${clist}" var="cdto" varStatus="status">
          
          ['${cdto.career}',     ${cdto.careerCnt}]
          
          <c:if test="${status.index < clist.size() - 1}">
          ,
		  </c:if>
          
          </c:forEach>
          ]);

        var options = {
          title: '',
          pieHole: 0.4,
        };

        var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
        chart.draw(data, options);
      }
    </script>