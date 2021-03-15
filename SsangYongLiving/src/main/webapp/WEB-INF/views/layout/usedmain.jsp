<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쌍용리빙 :: 중고 거래</title>

<tiles:insertAttribute name="usedasset"></tiles:insertAttribute>

</head>
<body>
	
	<header>
		<tiles:insertAttribute name="header"></tiles:insertAttribute>
	</header>

	<div class="wapper">
		<tiles:insertAttribute name="sidebar"></tiles:insertAttribute>		
		<tiles:insertAttribute name="content"></tiles:insertAttribute>			
	</div>
	
	
	<footer>
		<tiles:insertAttribute name="footer"></tiles:insertAttribute>		
	</footer>	

</body>
</html>