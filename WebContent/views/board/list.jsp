<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/mysite/assets/css/board.css" rel="stylesheet" type="text/css">
<title>Insert title here</title>
<script type="text/javascript" src="/mysite/jquery/jquery-1.9.0.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#writeBtn").click(function(){
			location.href = '/mysite/board?a=insertform';
		});
		$("#board #listTable tr").click(function(){
			var no =$(this).children().first().text();
			location.href='/mysite/board?a=view&no='+no;
		});
		$("#board #listTable tr").mouseover(function(){
			$(this).css({"backgroundColor":"#ddd"});
		});
		$("#board #listTable tr").mouseout(function(){
			$(this).css({"backgroundColor":"#f5f5f5"});
		});
		$(".noTd").hide();
		
		
	});
</script>
</head>
<body>
	<div id="container">
		<div id="header">
			<jsp:include page="/views/include/header.jsp" flush="false" />
		</div>
		<div id="content">
			<div id="board">
				<form action="/mysite/board" method="post">
				<input type="hidden" name="a" value="search">
				<table id="searchTable">
					<tr>
						<td>
							<input type="text" name="search" id="search">
							<input type="submit" value="search" id="searchBtn">
						</td>
					</tr>
				</table>
				</form>
				<table id="listTable">
					<tr>
						<th>no</th>
						<th>title</th>
						<th>writer</th>
						<th>date</th>
						<th>hit</th>
					</tr>
					<c:forEach items="${list }" var="vo" varStatus="status">
						<tr>
							<td class=noTd>${vo.no }</td>
							<td class=indexTd>${status.count }</td>
							<td>${vo.title }</td>
							<td>${vo.memberName }</td>
							<td class=regDateTd>${vo.regDate }</td>
							<td class=hitTd>${vo.viewCnt }</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div id="write">
				<input type="button" id="writeBtn" value="write">
			</div>
		</div>
		<div id="navigation">
			<c:import url="/views/include/navigation.jsp">
				<c:param name="type" value="board"></c:param>
			</c:import>
		</div>
		<div id="footer">
			<jsp:include page="/views/include/footer.jsp" />
		</div>
	</div>


</body>
</html>