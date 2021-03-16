<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- container 시작 -->
<div class="container">

    <div class="page-header">
        공구 이모저모
        <b class="orange" style="font-size: 1.2em;">&nbsp;[${dto.postSubject }]</b>
        <button class="btn backPostBtn">
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
            <td><button class="btn softbg">추천 <span class="red">${dto.recCount }</span></button></td>
        </tr>
    </table>
    <!-- 게시글 테이블 끝 -->


    <!-- 댓글 테이블 시작 -->
    <!-- 댓글 form 시작 -->
        <div class="well well-sm softbg commuAddCmt">
            <table>
                <tr>
                    <td colspan="2"><div>${memberName }님</div></td>
                </tr>
                <tr>
                    <td class="col-md-10">
                        <textarea class="form-control" placeholder="댓글을 남겨보세요." name="detail" id="detail"></textarea>
                    </td>
                    <td class="col-md-2">
                        <button class="form-control">등록</button>
                    </td>
                </tr>
            </table>
        </div>
    <!-- 댓글 form 끝 -->

    <!-- commuCmtTable 시작 -->
    <table class="table table-condensed commuCmtTable">

        <!-- 이미 작성한 댓글 시작 -->
        <c:forEach items="${clist }" var="cdto">
        <tr class="">
            <td class="col-md-2">${cdto.memberName }</td>
            <td class="col-md-3">${cdto.updateDate }&nbsp;&nbsp;<span class="badge"
                style="background-color: red;">N</span>
            </td>
            <td class="col-md-7 cmtBtns">
                <button class="editBtn">[&nbsp;<i class="fas fa-edit"></i>수정]</button>
                <button class="regBtn">[&nbsp;<i class="fas fa-check-circle"></i> 등록]</button>
                <!-- <button class="delBtn">[&nbsp;<i class="fas fa-trash-alt"></i>&nbsp;삭제]</button>
                <button class="cancelBtn">[&nbsp;<i class="fas fa-ban"></i>&nbsp;취소]</button> -->
            </td>
        </tr>
        <tr class="">
            <td colspan="2" class="">
                <textarea class="form-control addDetail" readonly>${cdto.detail }</textarea>
            </td>
            <td class="addReply"><button class="form-control">답글쓰기</button></td>
        </tr>
        <!-- 이미 작성한 댓글 끝 -->
        

        <!-- 대댓글 달기 시작 -->
        <tr class="replyCmt">
            <td class="col-md-2"><img src="/living/resources/images/group/reply.png">&nbsp;${memberName }</td>
            <td class="col-md-3">
            </td>
            <td class="col-md-7 cmtBtns">
                <!-- <button class="editBtn">[&nbsp;<i class="fas fa-edit"></i>수정]</button> -->
                <button class="regBtn">[&nbsp;<i class="fas fa-check-circle"></i> 등록]</button>
                <!-- <button class="delBtn">[&nbsp;<i class="fas fa-trash-alt"></i>&nbsp;삭제]</button> -->
                <button class="cancelBtn">[&nbsp;<i class="fas fa-ban"></i>&nbsp;취소]</button>
            </td>
        </tr>
        <tr class="replyCmt">
            <td colspan="3">
                <textarea class="form-control addDetail" placeholder="답글을 남겨보세요."></textarea>
            </td>
        </tr>
        <!-- 대댓글 달기 끝 -->
        </c:forEach>

        
    </table>
    <!-- commuCmtTable 끝 -->

    <!-- 목록보기 버튼 시작 -->
    <div class="listBtn">
        <button class="btn greybg" onclick="location.href='/living/group/community/list.action?postSeq=${dto.postSeq}&nowPage=${dto.nowPage }';">
            목록보기
        </button>
    </div>  
    <!-- 목록보기 버튼 끝 -->

    <div style="clear: both;"></div>

</div>
<!-- container 끝 -->


<script>
    window.onload = function() {
       $("#subject").focus();

        //답글 쓰는 칸 숨기기
       $(".replyCmt").toggle("hide");
    };

    //답글 쓰기 버튼 클릭 시
    $(".addReply").click(function() {
        $(this).toggle("hide");
        index = $(".addReply").index(this);
        $(".replyCmt").eq(index*2).toggle("hide");
        $(".replyCmt").eq(index*2+1).toggle("hide");
    });

    //답글 취소 버튼 클릭 시
    $(".cancelBtn").click(function() {
        index = $(".cancelBtn").index(this);
        $(".addReply").eq(index).toggle("hide");
        $(".replyCmt").eq(index*2).toggle("hide");
        $(".replyCmt").eq(index*2+1).toggle("hide");
    });

</script>