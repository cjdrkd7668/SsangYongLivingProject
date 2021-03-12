<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쌍용리빙 :: 자취의 모든 것</title>

<tiles:insertAttribute name="recipeasset"></tiles:insertAttribute>

</head>
<body>
	
	<main>
		<tiles:insertAttribute name="header"></tiles:insertAttribute>
		<tiles:insertAttribute name="content"></tiles:insertAttribute>		
		<tiles:insertAttribute name="footer"></tiles:insertAttribute>		
	</main>
	
</body>
</html>