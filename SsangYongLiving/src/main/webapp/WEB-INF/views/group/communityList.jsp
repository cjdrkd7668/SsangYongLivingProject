<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- container 시작 -->
<div class="container">

    <div class="page-header">
        공구 이모저모
        
        <b class="orange" style="font-size: 1.2em;">&nbsp;[하우스딸기 500g 특가]</b>
        <button class="btn backPostBtn" onclick="location.href='/living/group/view.action';">
            공구 글로 돌아가기
        </button>
        <br>
        <small>[식료품마켓 - 하우스딸기 500g 특가] 커뮤니티입니다.&nbsp;관련 없는 글은 무통보 삭제될 수 있습니다.</small>
        
    </div>
    <div class="divider"></div>

    <!-- 테이블 시작 -->
    <div class="tables">
        <!-- 많이 본 글 테이블 시작 -->
        <table class="table table-condensed readTable">
            <tr>
                <th><img src="/living/resources/images/group/eye.png">&nbsp;많이 본 글</th>
            </tr>
            <tr>
                <td>1. 이 업체 처음인데...(13)</td>
            </tr>
            <tr>
                <td>2. 이 업체 처음인데...(13)</td>
            </tr>
            <tr>
                <td>3. 이 업체 처음인데...(13)</td>
            </tr>
            <tr>
                <td>4. 이 업체 처음인데...(13)</td>
            </tr>
            <tr>
                <td>5. 이 업체 처음인데...(13)</td>
            </tr>
        </table>
        <!-- 많이 본 글 테이블 끝 -->

        <!-- 추천 글 테이블 시작 -->
        <table class="table table-condensed recTable">
            <tr>
                <th><img src="/living/resources/images/group/heart.png">&nbsp;추천 글</th>
            </tr>
            <tr>
                <td>1. 이 업체 처음인데...(18)</td>
            </tr>
            <tr>
                <td>2. 여기 맛있는 게...(10)</td>
            </tr>
            <tr>
                <td>3. 이 업체 처음인데...(13)</td>
            </tr>
            <tr>
                <td>4. 이 업체 처음인데...(13)</td>
            </tr>
            <tr>
                <td>5. 이 업체 처음인데...(13)</td>
            </tr>
        </table>
        <!-- 추천 글 테이블 끝 -->

        <!-- 댓글 많은 글 테이블 시작 -->
        <table class="table table-condensed comTable">
            <tr>
                <th><img src="/living/resources/images/group/cmt.png">&nbsp;댓글 많은 글</th>
            </tr>
            <tr>
                <td>1. 이 업체 처음인데...(28)</td>
            </tr>
            <tr>
                <td>2. 여기 맛있는 게...(20)</td>
            </tr>
            <tr>
                <td>3. 이 업체 처음인데...(13)</td>
            </tr>
            <tr>
                <td>4. 이 업체 처음인데...(13)</td>
            </tr>
            <tr>
                <td>5. 이 업체 처음인데...(13)</td>
            </tr>
        </table>
        <!-- 댓글 많은 글 테이블 끝 -->
            
    </div>
    <!-- 테이블 끝 -->

    <hr class="greybg">

    <!-- 오늘 새 글/전체 글 버튼 시작 -->
    <div class="mypageBtn">
        <button class="btn btn-default">
            <b>오늘 새 글</b>
        </button>
        <button class="btn btn-default">
            <b>전체 글</b>
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
        <tr onclick="location.href='/living/group/community/view.action?seq=${dto.seq}';">
            <td>${dto.seq }</td>
            <td>${dto.subject }</td>
            <td>${dto.memberName }</td>
            <td>${dto.regDate }</td>
            <td>${dto.recCount }</td>
            <td>${dto.readCount }</td>
        </tr>
        </c:forEach>
         
    </table>
    <!-- 커뮤니티 테이블 끝 -->

    <button class="btn writeBtn" onclick="location.href='/living/group/community/write.action';">글쓰기</button>

    <div style="clear: both;"></div>

</div>
<!-- container 끝 -->