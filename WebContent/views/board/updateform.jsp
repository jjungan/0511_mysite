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
		$("#deleteBtn").click(function(){
			location.href = '/mysite/board?a=delete&no='+${board.no};
		});
	});
</script>
</head>
<body>
	<div id="container">
		<div id="header">
			<jsp:include page="/views/include/header.jsp" flush="false" />
		</div>
		<div id="content">
		<form action="/mysite/board" method="post">
			<input type="hidden" name="a" value="update">
			<input type="hidden" name="no" value="${board.no }">
			<table id="insertTable">
				<tr>
					<th>title</th>
					<td colspan="23" id="titleTd"><input type="text" id="title" name="title" value="${board.title }"></td>
				</tr>
				<tr>
					<th>name</th>
					<td id="nameTd"><input type="text" name="name" id="name" value="${board.memberName }" readonly="readonly"></td>
					<th>hit</th>
					<td id="viewCntTd"><input type="text" id="viewCnt" name="viewCnt" value="${board.viewCnt }" readonly="readonly"></td>
				</tr>
				<tr>
					<td colspan="4" id=textareaTd>
						<textarea id="textarea" name="content">${board.content }</textarea>
					</td>
				</tr>
				<tr>
					<td colspan="4" id="submitTd">
						<input type="submit" id="updateBtn" value="수정" >
						<input type="button" id="deleteBtn" value="삭제" >
					</td>
				</tr>
			</table>
		</form>
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