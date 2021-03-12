<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- container 시작 -->
<div class="container">

    <div class="page-header">
        공구 이모저모
        <b class="orange" style="font-size: 1.2em;">&nbsp;[하우스딸기 500g 특가]</b>
        <button class="btn backPostBtn">
            공구 글로 돌아가기
        </button>
        <br>
        <small>[식료품마켓 - 하우스딸기 500g 특가] 커뮤니티입니다.&nbsp;관련 없는 글은 무통보 삭제될 수 있습니다.</small>
        
    </div>
    <div class="divider"></div>

    <!-- 테이블 시작 -->
    <table class="table addTable">
        <tr>
            <th class="col-md-3">제목</th>
            <td class="col-md-9"><input type="text" name="subject" id="subject" class="form-control" placeholder="제목을 입력하세요."></td>
        </tr>
        <tr>
            <th>내용</th>
            <td>
                <textarea name="content" class="form-control" placeholder="내용을 입력하세요"></textarea>
            </td>
        </tr>
    </table>
    <!-- 테이블 끝 -->

    <div class="addBtn">
        <button class="btn greybg" onclick="location.href='/living/group/community/list.action';">
            돌아가기
        </button>
        
        <button class="btn orangebg">
            등록하기
        </button>   
    </div>  

    <div style="clear: both;"></div>

</div>
<!-- container 끝 -->


<script>
    window.onload = function() {
       $("#subject").focus();
    };
</script>