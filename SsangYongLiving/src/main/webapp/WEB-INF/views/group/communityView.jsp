<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- container 시작 -->
<div class="container">

    <div class="page-header">
        공구 이모저모
        <b class="orange" style="font-size: 1.2em;">&nbsp;[${dto.postSubject }]</b>
        <button class="btn backPostBtn" onclick="location.href='/living/group/view.action?seq=${dto.postSeq}&nowPage=1';">
            공구 글로 돌아가기
        </button>
        <br>
        <small>[${dto.companyName } - ${dto.postSubject }] 커뮤니티입니다.&nbsp;관련 없는 글은 무통보 삭제될 수 있습니다.</small>
        
    </div>
    <div class="divider"></div>

    <!-- 게시글 테이블 시작 -->
    <table class="table table-default commuViewTable">
        <tr>
            <td colspan="5">[${dto.postSubject }]</td>
        </tr>
        <tr>
            <td colspan="5">${dto.subject }</td>
        </tr>
        <tr>
            <td>${dto.memberName }</td>
            <td>추천 <span class="orange">${dto.recCount }</span></td>
            <td>조회 <span class="orange">${dto.readCount }</span></td>
            <td>${dto.updateDate }</td>
            <td>댓글 <span class="grey">${dto.commentCount }</span></td>
        </tr>
        <tr>
            <td colspan="5">${dto.detail }</td>
        </tr>
        <tr>
            <td colspan="4"><button class="btn orangebg">댓글 <span class="soft">${dto.commentCount }</span></button></td>
            <td><button class="btn softbg" id="recBtn">추천 <span class="red">${dto.recCount }</span></button></td>
        </tr>
    </table>
    <!-- 게시글 테이블 끝 -->


    <!-- 댓글 테이블 시작 -->
    <!-- 댓글 form 시작 -->
    <form method="POST" action="/living/group/community/commentaddok.action">
    	<input type="hidden" name="communitySeq" id="communitySeq" value="${dto.seq }">
    	<input type="hidden" name="nowPage" id="nowPage" value="${nowPage }">
        <div class="well well-sm softbg commuAddCmt">
            <table>
                <tr>
                    <td colspan="2"><div>${memberName }님</div></td>
                </tr>
                <tr>
                    <td class="col-md-10">
                        <input class="form-control" placeholder="댓글을 남겨보세요." name="detail" id="detail">
                    </td>
                    <td class="col-md-2">
                        <button type="submit" id="commentSubmit" class="form-control" style="margin-bottom: 0px; height: 33px;">등록</button>
                    </td>
                </tr>
            </table>
        </div>
    </form>
    <!-- 댓글 form 끝 -->

    <!-- commuCmtTable 시작 -->
    <table class="table table-condensed commuCmtTable">

        <!-- 이미 작성한 댓글 시작 -->
        <c:forEach items="${clist }" var="cdto" varStatus="status">
        <tr>
            <td class="col-md-2">
            	<!-- level에 따른 이미지 추가 처리하기 -->
	            <c:if test="${cdto.level == 1 }">
	            ${cdto.memberName }
	            </c:if>
	            
	            <c:if test="${cdto.level == 2 }">
	            <img src="/living/resources/images/group/reply.png">&nbsp;${cdto.memberName }
	            </c:if>
	            
	            <c:if test="${cdto.level == 3 }">
	            <img src="/living/resources/images/group/reply.png">
	            <img src="/living/resources/images/group/reply.png">&nbsp;${cdto.memberName }
	            </c:if>
	            
	            <c:if test="${cdto.level == 4 }">
	            <img src="/living/resources/images/group/reply.png">
	            <img src="/living/resources/images/group/reply.png">
	            <img src="/living/resources/images/group/reply.png">&nbsp;${cdto.memberName }
	            </c:if>
	            
	            <c:if test="${cdto.level == 5 }">
	            <img src="/living/resources/images/group/reply.png">
	            <img src="/living/resources/images/group/reply.png">
	            <img src="/living/resources/images/group/reply.png">
	            <img src="/living/resources/images/group/reply.png">&nbsp;${cdto.memberName }
	            </c:if>
            </td>
            <td class="col-md-3">${cdto.updateDate }&nbsp;&nbsp;
            <!-- 최신 글 시작 -->
			<c:if test="${cdto.gap < 1 }">
				<span class="badge newBadge">N</span>
			</c:if>
            </td>
            <!-- 자기가 쓴 댓글일 경우에만 보이기 -->
            <c:if test="${cdto.memberSeq == seq }">
            <td class="col-md-7 cmtBtns" data-communityseq="${cdto.communitySeq}" data-index="${status.index }" data-seq="${cdto.seq }">
                <button class="editBtn">[&nbsp;<i class="fas fa-edit"></i>수정]</button>
                <button class="regBtn">[&nbsp;<i class="fas fa-check-circle"></i> 등록]</button>
               	<button class="delBtn">[&nbsp;<i class="fas fa-trash-alt"></i>&nbsp;삭제]</button>
                <button class="cancelBtn">[&nbsp;<i class="fas fa-ban"></i>&nbsp;취소]</button>
            </td>
            </c:if>
        </tr>
        <tr>
            <td colspan="2">
                <textarea class="form-control addDetail" readonly>${cdto.detail }</textarea>
            </td>
            <td class="addReply">
            	<c:if test="${cdto.memberSeq != seq }">
            	<button class="form-control replyBtn" data-communityseq="${cdto.communitySeq}" data-seq="${cdto.seq }">
            	답글쓰기
            	</button>
            	</c:if>
            </td>
        </tr>
        <!-- 이미 작성한 댓글 끝 -->
        

        <!-- 대댓글 달기 시작 -->
        <tr class="replyCmt">
            <td class="col-md-2"><img src="/living/resources/images/group/reply.png">&nbsp;${memberName }</td>
            <td class="col-md-3">
            </td>
            <td class="col-md-7 cmtBtns">
                <button class="replyRegBtn">[&nbsp;<i class="fas fa-check-circle"></i> 등록]</button>
                <button class="replyCancelBtn">[&nbsp;<i class="fas fa-ban"></i>&nbsp;취소]</button>
            </td>
        </tr>
        <tr class="replyCmt">
            <td colspan="3">
                <input type="text" class="form-control replyDetail" style="width: 100%;" placeholder="답글을 남겨보세요.">
            </td>
        </tr>
        <!-- 대댓글 달기 끝 -->
        </c:forEach>

        
    </table>
    <!-- commuCmtTable 끝 -->

    <!-- 목록보기 버튼 시작 -->
    <div class="listBtn">
        <button class="btn greybg" onclick="location.href='/living/group/community/list.action?postSeq=${dto.postSeq}&nowPage=${nowPage }';">
            	목록보기
        </button>
    </div>  
    <!-- 목록보기 버튼 끝 -->

    <div style="clear: both;"></div>

</div>
<!-- container 끝 -->


<script>

	var seq = ${dto.seq};
	var memberSeq = ${seq};
	var nowPage = ${nowPage};
	
	/* 페이지 로드 시 */
    window.onload = function() {
       $("#detail").focus();

        //답글 쓰는 칸 숨기기
       $(".replyCmt").addClass("hide");
        //등록 버튼 숨기기
       $(".regBtn").addClass("hide");
        //취소 버튼 숨기기
       $(".cancelBtn").addClass("hide");
    };

    /* 답글 쓰기 버튼 클릭 시작 */
    $(".addReply").click(function() {
        $(this).addClass("hide");
        index = $(".addReply").index(this);
        $(".replyCmt").eq(index*2).removeClass("hide");
        $(".replyCmt").eq(index*2+1).removeClass("hide");
    });
	/* 답글 쓰기 버튼 클릭 끝 */
    
    /* 답글 취소 버튼 클릭 시작 */
    $(".replyCancelBtn").click(function() {
        index = $(".replyCancelBtn").index(this);
        $(".addReply").eq(index).removeClass("hide");
        $(".replyCmt").eq(index*2).addClass("hide");
        $(".replyCmt").eq(index*2+1).addClass("hide");
    });
    /* 답글 취소 버튼 클릭 끝 */
    
    /* 추천 버튼 클릭 시작 */
    $("#recBtn").click(function(){
    	
    	$.ajax({
    		type: "GET",
    		url: "/living/group/community/updatecommunityreccount.action",
    		data: "seq=" + seq,
    		success: function(result) {
    			location.href="/living/group/community/view.action?seq="+seq+"&memberSeq="+memberSeq+"&nowPage="+nowPage;
    		},
    		error: function(a,b,c) {
    			console.log(a,b,c);
    		}
    	});
    });
    /* 추천 버튼 클릭 끝 */
    
    /* 대댓글 달기 시작 */
    //답글 버튼 클릭 시 -> 이미 있는 댓글에 댓글 달기
    $(".replyBtn").click(function(){
    	var index = $(".replyBtn").index(this);

    	//댓글 번호 $(this).data("seq")
    	//alert($(this).data("seq"));
    	var replySeq = $(this).data("seq");
    	
    	//커뮤니티 글 번호  $(this).data("communityseq")
    	//console.log($(this).data("communityseq"));
    	var communitySeq = $(this).data("communityseq");
    	
    	//등록 버튼 클릭 시
    	$(".replyRegBtn").eq(index).click(function(){

    		var detail = $(".replyDetail").eq(index).val();
    		//alert(detail);
    		//alert(nowPage);
    		
    		$.ajax({
        		type: "GET",
        		url: "/living/group/community/replyaddok.action",
        		data: "memberSeq" + memberSeq + "&communitySeq=" + communitySeq + "&pseq=" + replySeq + "&nowPage=" + nowPage + "&detail=" + detail ,
        		dataType: "text",
        		success: function(result){

        			location.href = "/living/group/community/view.action?seq=" + communitySeq + "&memberSeq=" + memberSeq + "&nowPage=" + nowPage;
        					
        		},
        		error: function(a,b,c) {
        			console.log(a,b,c);
        		}
        	});
    	});    		
    });
    /* 대댓글 달기 끝 */
    
    /* 댓글 수정 시작 */
    $(".editBtn").click(function(){
    	var editIndex = $(this).parent().data("index");
    	var cmtSeq = $(this).parent().data("seq");
    	var cmSeq = $(this).parent().data("communityseq");
    	var oldDetail = $(".addDetail").eq(editIndex).val();
    	
    	//댓글 창 readonly 풀기
    	$(".addDetail").eq(editIndex).removeAttr("readonly");
    	//댓글 창에 focus
    	$(".addDetail").eq(editIndex).focus();
    	//답글 쓰기 창 숨기기
    	$(".replyBtn").eq(editIndex).addClass("hide");

    	//수정, 삭제 버튼 숨기고 등록, 취소 버튼 보이기
		$(this).addClass("hide");
		$(this).next().removeClass("hide");
		$(this).next().next().addClass("hide");
		$(this).next().next().next().removeClass("hide");
		
		
		/* 수정 취소 시작 */
		$(this).next().next().next().click(function(){
			
			//등록, 취소 버튼 숨기고 수정, 삭제 버튼 보이기
			$(this).addClass("hide");
			$(this).prev().removeClass("hide");
			$(this).prev().prev().addClass("hide");
			$(this).prev().prev().prev().removeClass("hide");
			
			//수정 전 데이터로 넣고 readonly 속성 추가
			$(".addDetail").eq(editIndex).val(oldDetail);
			$(".addDetail").eq(editIndex).attr("readonly", true);
		});
		/* 수정 취소 끝 */
		
		/* 수정 등록 시작 */
		$(this).next().click(function(){
			var newDetail = $(".addDetail").eq(editIndex).val();
			$(".addDetail").eq(editIndex).attr("readonly", true);
			
			$.ajax({
				type: "GET",
				url: "/living/group/community/commenteditok.action",
				data: "seq=" + cmtSeq + "&detail=" + newDetail,
				dataType: "text",
				success: function(result){
				},
				error: function(a,b,c){
					console.log(a,b,c);
				}
			});
		});
		/* 수정 등록 끝 */
    });
    /* 댓글 수정 끝 */
    
     /* 댓글 삭제 시작 */
    $(".delBtn").click(function(){
    	var delIndex = $(this).parent().data("index");
    	var cmtSeq = $(this).parent().data("seq");
    	var cmSeq = $(this).parent().data("communityseq");

    	$.ajax({
    		type: "GET",
    		url: "/living/group/community/commentdelok.action",
    		data: "seq=" + cmtSeq,
    		dataType: "text",
    		success: function(result){
    			
    			location.href = "/living/group/community/view.action?seq=" + cmSeq + "&memberSeq=" + memberSeq + "&nowPage=" + nowPage;
    		},
    		error: function(a,b,c){
    			console.log(a,b,c);
    		}
    		
    	});
		
    });
    /* 댓글 삭제 끝 */

</script>