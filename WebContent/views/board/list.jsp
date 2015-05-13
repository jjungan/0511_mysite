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
			<div id="board">
				<table>
					<tr>
						<th>no</th>
						<th>title</th>
						<th>date</th>
						<th>writer</th>
						<th>hit</th>
					</tr>
					<tr>
						<td>1</td>
						<td>안녕하세요?</td>
						<td>2015.5.13</td>
						<td>이정안</td>
						<td>50</td>
					</tr>
				</table>
			</div>
			<div id="write">
				<input type="button" id="writebtn" value="write">
			</div>
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