<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h1>로그인</h1>
<p>session에 저장되는 속성은 seq, id, access(0=회원, 1=고용인, 2=공동구매업체)입니다.</p>

<div><a href="/living/auth/auth.action?id=jackc94a777&seq=1&access=0">seq가 1이고 id가 jackc94a777인 회원(박신윤), access=0</a></div>
<div><a href="/living/auth/auth.action?id=theg90in&seq=11&access=1">seq가 11이고 id가 theg90in인 고용인(이종태), access=1</a></div>
<div><a href="/living/auth/auth.action?id=grocery&seq=1&access=2">seq가 1이고 id가 grocery인 공동구매업체, access=2</a></div>
















