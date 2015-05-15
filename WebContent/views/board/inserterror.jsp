<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/mysite/assets/css/board.css" rel="stylesheet" type="text/css">
<title>error</title>
<script type="text/javascript" src="/mysite/jquery/jquery-1.9.0.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#gobackBtn").click(function(){
			window.history.go(-1);
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
			<div id="wrongPassword">비밀번호가 틀렸습니다. </div>
			<form action="/mysite/board" method="post">
				<input type="hidden" name="a" value="insert">
				<table id="insertTable">
					<tr>
						<th>title</th>
						<td colspan="3" id="titleTd"><input type="text" id="title" name="title" value="${param.title }"></td>
					</tr>
					<tr>
						<th>name</th>
						<td id="nameTd"><input type="text" id="name" value="${sessionScope.authMember.name }" readonly="readonly"></td>
						<th>password</th>
						<td id="passwordTd"><input type="password" id="password" name="password"></td>
					</tr>
					<tr>
						<td colspan="4" id=textareaTd>
							<textarea id="textarea" name="content">${param.content }</textarea>
						</td>
					</tr>
					<tr>
						<td colspan="4" id="submitTd">
							<input type="submit" id="submitBtn" value="확인" >
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