<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- container 시작 -->
<div class="container">

    <!-- 상단 알림 안내 창 시작 -->
    <div class="well softbg alarmwell">
        <table>
            <tr>
                <th class="col-md-2">
                    <img src="/living/resources/images/group/notice.png">
                </th>
                <th class="col-md-3">&nbsp;&nbsp;알림</th>
                <th class="col-md-7">${memberName }님<br>아직 읽지 않은 알림이 <b class="orange">${count }</b>&nbsp;개 있습니다.
                </th>
            </tr>
        </table>
    </div>
    <!-- 상단 알림 안내 창 끝 -->

    <!-- 알림/1:1문의내역 버튼 시작 -->
    <div class="mypageBtn">
        <button class="btn btn-default softbg">
            알림
        </button>
        <button class="btn btn-default greybg">
            1:1 문의내역
        </button>
    </div>
    <!-- 알림/1:1문의내역 버튼 끝 -->

    <!-- 공구 새 글 시작 -->
    <div class="page-header"><img src="/living/resources/images/group/post.png">&nbsp;공구 새 글 <small>New Post</small></div>
    <div class="divider"></div>
    <table class="table table-default">
        <tr class="softbg">
            <th class="col-md-1">번호</th>
            <th class="col-md-4">공구</th>
            <th class="col-md-4">내용</th>
            <th class="col-md-3">알림일</th>
        </tr>
        <c:forEach items="${nlist }" var="ndto">
        <tr onclick="location.href='/living/group/noticeok.action?seq=${ndto.seq}';">
            <c:if test="${ndto.readFlag == 0 }">
            <td class="orange">${ndto.seq }</td>
            <td class="orange">${ndto.psubject }</td>
            <td class="orange">${ndto.detail }</td>
            <td class="orange">${ndto.noticeDate}</td>
            </c:if>
            <c:if test="${ndto.readFlag == 1 }">
            <td>${ndto.seq }</td>
            <td>${ndto.psubject }</td>
            <td>${ndto.detail }</td>
            <td>${ndto.noticeDate}</td>
            </c:if>
            <c:if test="${ndto.readFlag == 2 }">
            <td class="grey">${ndto.seq }</td>
            <td class="grey">${ndto.psubject }</td>
            <td class="grey">${ndto.detail }</td>
            <td class="grey">${ndto.noticeDate}</td>
            </c:if>
        </tr>
        </c:forEach>
        
        <c:if test="${nlist.size() == 0 }">
        <tr>
        	<td colspan="4">새 공구 알림이 없습니다.</td>
        </tr>
        </c:if>

    </table>
    <!-- 공구 새 글 끝 -->

    <!-- 내 쿠폰 시작 -->
    <div class="page-header"><img src="/living/resources/images/group/coupon.png">&nbsp;내 쿠폰 <small>My Coupon</small></div>
    <div class="divider"></div>
    <table class="table table-default">
        <tr class="softbg">
            <th class="col-md-1">번호</th>
            <th class="col-md-3">보낸 업체</th>
            <th class="col-md-2">할인 금액</th>
            <th class="col-md-3">발급일</th>
            <th class="col-md-3">만료일</th>
        </tr>
        <c:forEach items="${clist }" var="cdto">
        <tr onclick="location.href='/living/group/couponok.action?seq=${cdto.seq}';">
        	<c:if test="${cdto.readFlag == 0 }">
            <td class="orange">${cdto.seq }</td>
            <td class="orange">${cdto.cname }</td>
            <td class="orange">${cdto.discount }원</td>
            <td class="orange">${cdto.issueDate }</td>
            <td class="orange">${cdto.endDate }</td>
            </c:if>
            <c:if test="${cdto.readFlag == 1 }">
            <td>${cdto.seq }</td>
            <td>${cdto.cname }</td>
            <td>${cdto.discount }원</td>
            <td>${cdto.issueDate }</td>
            <td>${cdto.endDate }</td>
            </c:if>
            <c:if test="${cdto.readFlag == 2 }">
            <td class="grey">${cdto.seq }</td>
            <td class="grey">${cdto.cname }</td>
            <td class="grey">${cdto.discount }원</td>
            <td class="grey">${cdto.issueDate }</td>
            <td class="grey">${cdto.endDate }</td>
            </c:if>
        </tr>
        </c:forEach>
        
        <c:if test="${clist.size() == 0 }">
        <tr>
        	<td colspan="5">새 쿠폰 알림이 없습니다.</td>
        </tr>
        </c:if>
    </table>
    <!-- 내 쿠폰 끝 -->


</div>
<!-- container 끝 -->

