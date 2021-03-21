<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 공구 버튼 시작 -->
<div class="headerBtn">
    <div id="btn1">
        <button class="btn btn-default">
            공구 둘러보기
        </button>
        
        <button class="btn btn-default">
            공구 올리기
        </button>   
    </div>  
    <!-- 공구 버튼 끝 -->

    <!-- 로그인 버튼 시작 -->
    <div id="btn2">
        <button class="btn orangebg" id="memberNotice" onclick="location.href='/living/group/notice.action?memberSeq=${seq}';">
            <i class="fas fa-bell"></i>&nbsp;${memberName }님
        </button>
        <script>
		<c:if test="${count > 0}">
			var flag = false;
			setInterval(function() {
				if (flag){
					$("#memberNotice").css("opacity", "1");
				} else {
					$("#memberNotice").css("opacity", ".1");
				}
				
				flag = !flag;
			}, 500);
		</c:if>
</script>
    </div>
    <!-- 로그인 버튼 끝 -->
</div>

