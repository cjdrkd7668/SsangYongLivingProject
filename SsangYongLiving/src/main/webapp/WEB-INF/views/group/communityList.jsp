<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- container 시작 -->
<div class="container">

    <div class="page-header">
        공구 이모저모
        
        <b class="orange" style="font-size: 1.2em;">&nbsp;[${pdto.subject }]</b>
        <button class="btn backPostBtn" onclick="location.href='/living/group/view.action?seq=${pdto.seq }&nowPage=1';">
            공구 글로 돌아가기
        </button>
        <br>
        <small>[${pdto.companyName } - ${pdto.subject }] 커뮤니티입니다.&nbsp;관련 없는 글은 무통보 삭제될 수 있습니다.</small>
        
    </div>
    <div class="divider"></div>

    <!-- 테이블 시작 -->
    <div class="tables">
        <!-- 많이 본 글 테이블 시작 -->
        <table class="table table-condensed readTable">
        	<thead>
	            <tr>
	                <th><img src="/living/resources/images/group/eye.png">&nbsp;많이 본 글</th>
	            </tr>
            </thead>
            <tbody>
            	<c:forEach items="${mostViewList }" var="mvdto" varStatus="status">
	            <tr>
	            	<!-- 1~3번 글일 경우 시작 -->
	                <c:if test="${status.index <= 2 }">
	                <td class="link orange" onclick="location.href='/living/group/community/view.action?seq=${mvdto.seq}&memberSeq=1&nowPage=${nowPage }';">
	                	
	                	<c:out value="${status.index+1 }. " />
	                	${mvdto.subject } (<small class="orange" style="font-size:1em;">${mvdto.commentCount }</small>)
	                	<input type="hidden" class="seq" value="${mvdto.seq }">
	                	
	                	<!-- 최신 글 시작 -->
						<c:if test="${mvdto.gap < 1 }">
							<span class="badge newBadge">N</span>
						</c:if>
						<!-- 최신 글 끝 -->
	                </td>
	                </c:if>
	                <!-- 1~3번 글일 경우 끝 -->
	                
	                <!-- 1~3번 글이 아닐 경우 시작 -->
	                <c:if test="${status.index > 2 }">
	                <td class="link" onclick="location.href='/living/group/community/view.action?seq=${mvdto.seq}&memberSeq=1&nowPage=${nowPage }';">
	                	
	                	<c:out value="${status.index+1 }. " />
	                	${mvdto.subject } (<small class="orange" style="font-size:1em;">${mvdto.commentCount }</small>)
	                	<input type="hidden" class="seq" value="${mvdto.seq }">
	                	
	                </td>
	                </c:if>
	                <!-- 1~3번 글이 아닐 경우 끝 -->
	                
	            </tr>
	            </c:forEach>
	
            </tbody>
        </table>
        <!-- 많이 본 글 테이블 끝 -->

         <!-- 추천 글 테이블 시작 -->
        <table class="table table-condensed recTable">
        	<thead>
	            <tr>
	                <th><img src="/living/resources/images/group/heart.png">&nbsp;추천 글</th>
	            </tr>
            </thead>
            <tbody>
	            <c:forEach items="${recList }" var="rdto" varStatus="status">
	            <tr>
	            	<!-- 1~3번 글일 경우 시작 -->
	                <c:if test="${status.index <= 2 }">
	                <td class="link orange" onclick="location.href='/living/group/community/view.action?seq=${rdto.seq}&memberSeq=1&nowPage=${nowPage }';">
	                	<c:out value="${status.index+1 }. " />
	                	${rdto.subject } (<small class="orange" style="font-size:1em;">${rdto.commentCount }</small>)
	                	<input type="hidden" class="seq" value="${rdto.seq }">

	                </td>
	                </c:if>
	                <!-- 1~3번 글일 경우 끝 -->
	                
	                <!-- 1~3번 글이 아닐 경우 시작 -->
	                <c:if test="${status.index > 2 }">
	                <td class="link" onclick="location.href='/living/group/community/view.action?seq=${rdto.seq}&memberSeq=1&nowPage=${nowPage }';">
	                	<c:out value="${status.index+1 }. " />
	                	${rdto.subject } (<small class="orange" style="font-size:1em;">${rdto.commentCount }</small>)
	                	<input type="hidden" class="seq" value="${rdto.seq }">

	                </td>
	                </c:if>
	                <!-- 1~3번 글이 아닐 경우 끝 -->
	            </tr>
	            </c:forEach>
            </tbody>
        </table>
        <!-- 추천 글 테이블 끝 -->

        <!-- 댓글 많은 글 테이블 시작 -->
        <table class="table table-condensed comTable">
        	<thead>
	            <tr>
	                <th><img src="/living/resources/images/group/cmt.png">&nbsp;댓글 많은 글</th>
	            </tr>
            </thead>
            <tbody>
	            <c:forEach items="${mostCmtList }" var="mcdto" varStatus="status">
	            <tr>
	            	<!-- 1~3번 글일 경우 시작 -->
	                <c:if test="${status.index <= 2 }">
	                <td class="link orange" onclick="location.href='/living/group/community/view.action?seq=${mcdto.seq}&memberSeq=1&nowPage=${nowPage }';">
	                	<c:out value="${status.index+1 }. " />
	                	${mcdto.subject } (<small class="orange" style="font-size:1em;">${mcdto.commentCount }</small>)
	                	<input type="hidden" class="seq" value="${mcdto.seq }">

	                </td>
	                </c:if>
	                <!-- 1~3번 글일 경우 끝 -->
	                
	                <!-- 1~3번 글이 아닐 경우 시작 -->
	                <c:if test="${status.index > 2 }">
	                <td class="link" onclick="location.href='/living/group/community/view.action?seq=${mcdto.seq}&memberSeq=1&nowPage=${nowPage }';">
	                	<c:out value="${status.index+1 }. " />
	                	${mcdto.subject } (<small class="orange" style="font-size:1em;">${mcdto.commentCount }</small>)
	                	<input type="hidden" class="seq" value="${mcdto.seq }">
            			<!-- 최신 글 시작 -->
						<c:if test="${mcdto.gap < 1 }">
							<span class="badge newBadge" style="background-color: red;">N</span>
						</c:if>
						<!-- 최신 글 끝 -->
	                </td>
	                </c:if>
	                <!-- 1~3번 글이 아닐 경우 끝 -->
	                
	            </tr>
	            </c:forEach>
            </tbody>
        </table>
        <!-- 댓글 많은 글 테이블 끝 -->
            
    </div>
    <!-- 테이블 끝 -->

    <hr class="greybg">

    <!-- 오늘 새 글/전체 글 버튼 시작 -->
    <div class="mypageBtn">
        <button class="btn btn-default">
            <b>전체 글</b>
        </button>
        <button class="btn btn-default">
            <b>내가 쓴 글</b>
        </button>
        <div class="search">
            <input type="text" class="form-control" placeholder="검색어를 입력해주세요."><i class="fas fa-search"></i>
        </div>
    </div>
    <!-- 오늘 새 글/전체 글 버튼 끝 -->

    <!-- 커뮤니티 테이블 시작 -->
    <table class="table table-hover commuTable">
        <tr class="softbg">
            <th class="col-md-1">번호</th>
            <th class="col-md-5">제목</th>
            <th class="col-md-2">글쓴이</th>
            <th class="col-md-2">작성일</th>
            <th class="col-md-1">추천</th>
            <th class="col-md-1">조회</th>
        </tr>
        
        <c:forEach items="${list }" var="dto">
        <tr class="link" onclick="location.href='/living/group/community/view.action?seq=${dto.seq}&memberSeq=1&nowPage=${nowPage }';">
        	<input type="hidden" class="seq" value="${dto.seq }">
            <td>${dto.seq }</td>
            <td style="text-align:left;">${dto.subject }
            	<!-- 댓글 수 시작 -->
				<c:if test="${dto.commentCount > 0 }">
				<span class="badge" style="background-color: #FF6300; padding: 5px;">${dto.commentCount }</span>
				</c:if>
				<!-- 댓글 수 끝 -->
				<!-- 최신 글 시작 -->
				<c:if test="${dto.gap < 1 }">
					<span class="badge newBadge">N</span>
				</c:if>
				<!-- 최신 글 끝 -->
            
            </td>
            <td>${dto.memberName }</td>
            <td>${dto.regDate }</td>
            <td>${dto.recCount }</td>
            <td>${dto.readCount }</td>
        </tr>
        </c:forEach>
         
    </table>
    <!-- 커뮤니티 테이블 끝 -->
    
    <!-- 페이지 바 시작 -->
    <div id="pagebar"></div>
	<!-- 페이지 바 끝 -->

    <button class="btn writeBtn" onclick="location.href='/living/group/community/add.action?postSeq=${pdto.seq}&memberSeq=${seq}&nowPage=${nowPage}';">글쓰기</button>

    <div style="clear: both;"></div>

</div>
<!-- container 끝 -->

<script>

	/* 페이징 처리 시작 */
	let totalPage = ${totalPage};
	let nowPage = ${nowPage};
	
	for (let i=1; i<=totalPage; i++){
		let tempPagebar = "";
		
		if (i == nowPage) {
			tempPagebar += "<button type='button' class='btn active'>";
			tempPagebar += "<div>";
			tempPagebar += i;
			tempPagebar += "</div>";
			tempPagebar += "</button>";
			console.log(tempPagebar);
		
		} else {
			tempPagebar += "<button type='button' class='btn btn-default'>";
			tempPagebar += "<div>";
			tempPagebar += i;
			tempPagebar += "</div>";
			tempPagebar += "</button>";
		}
		
		$("#pagebar").append(tempPagebar);
	}
	
	//페이지바 선택 시 
	$("#pagebar").children(".btn").click(function(){
		
		//페이지 번호 : $(this).children('div').text()
		//해당 페이지로 이동
		location.href="/living/group/community/list.action?postSeq=" + ${pdto.seq} + "&nowPage=" + $(this).children('div').text();
		
	});
	/* 페이징 처리 끝 */
	
	/* 페이지 이동 시작 */
	/* $(".link").click(function(){
		//글 번호 $(this).children(".seq").val()
		//alert($(this).children(".seq").val());
		
		$.ajax({
			type: "GET",
			url: "/living/group/community/view.action",
			data: "seq=" + $(this).children(".seq").val() + "&memberSeq=1&nowPage=" + nowPage,
			success: function(result){
				
			},
			error: function(a,b,c){
				console.log(a,b,c);
			}
		});
		
		
	}); */
	
	/* 페이지 이동 끝 */

</script>