<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- container 시작 -->
<div class="container">

    <div class="page-header">
     	QnA
     	<img src="/living/resources/images/group/minilogo.png" style="width: 50px;">
        <button class="btn backPostBtn" onclick="location.href='/living/group/view.action?seq=${dto.seq }&nowPage=1';">
            	공구 글로 돌아가기
        </button>
        <br>
        <small>공동구매 QnA입니다.&nbsp;궁금한 점이 있으면 무엇이든 물어봐주세요.</small>
        
    </div>
    <div class="divider"></div>

    <!-- form 시작 -->
    <form method="POST" action="/living/group/addok.action" enctype="multipart/form-data">

    <!-- 테이블 시작 -->
    <table class="table addTable">
        <tr>
            <th class="col-md-3">제목</th>
            <td class="col-md-9"><input type="text" name="subject" id="subject" class="form-control" placeholder="제목을 입력하세요." required></td>
        </tr>
        <tr>
            <th>내용</th>
            <td>
                <textarea name="detail" id="detail" class="form-control" placeholder="내용을 입력하세요" required></textarea>
            </td>
        </tr>
        <tr>
        	<th>파일 첨부</th>
        	<td><input type="file" class="form-control" id="fileName" name="fileName"></td>
        </tr>
        <tr>
        	<th></th>
        	<td style="float:right;">
        		<input type="radio" id="openflag1" class="openFlag" name="openFlag" value="1">
                <label for="openflag1" class="grey" style="margin-right: 20px;">공개</label>
                        
                <input type="radio" id="openflag2" class="openFlag" name="openFlag" value="0" checked style="border:0;">
                <label for="openflag2" class="orange">비공개</label>
        	
        	</td>
        </tr>
    </table>
    <!-- 테이블 끝 -->
    <div class="divider" style="margin-top:33px;"></div>
    <input type="hidden" name="postSeq" value="${dto.postSeq }">
    <input type="hidden" name="nowPage" value="${dto.nowPage }">
    <div class="addBtn">
        <button type="button" class="btn greybg" onclick="location.href='/living/group/view.action?seq=${dto.postSeq }&nowPage=${dto.nowPage }';">
            	돌아가기
        </button>
        
        <button type="submit" class="btn orangebg">
            	등록하기
        </button>   
    </div>  
    </form>
    <!-- form 끝 -->

    <div style="clear: both;"></div>

</div>
<!-- container 끝 -->


<script>
    window.onload = function() {
       $("#subject").focus();
    };
</script>