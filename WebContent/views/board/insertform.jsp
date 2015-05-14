<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/mysite/assets/css/board.css" rel="stylesheet" type="text/css">
<title>Insert title here</title>
</head>
<body>
	<div id="container">
		<div id="header">
			<jsp:include page="/views/include/header.jsp" flush="false" />
		</div>
		<div id="content">
			<table id="insertTable">
				<tr>
					<th>title</th>
					<td colspan="23" id="titleTd"><input type="text" id="title" name="title"></td>
				</tr>
				<tr>
					<th>name</th>
					<td id="nameTd"><input type="text" id="name" value="이정안" readonly="readonly"></td>
					<th>hit</th>
					<td id="viewCntTd"><input type="text" id="viewCnt" name="viewCnt" value="10" readonly="readonly"></td>
				</tr>
				<tr>
					<td colspan="4" id=textareaTd>
						<textarea id="textarea" name="content">
						</textarea>
					</td>
				</tr>
				<tr>
					<td colspan="4" id="submitTd">
						<input type="submit" id="submitBtn" value="확인" >
					</td>
				</tr>
			</table>
		</div>
		<div id="navigation">
			<c:import url="/views/include/navigation.jsp">
				<c:param name="type" value="guestbook"></c:param>
			</c:import>
		</div>
		<div id="footer">
			<jsp:include page="/views/include/footer.jsp" />
		</div>
	</div>


</body>
</html>