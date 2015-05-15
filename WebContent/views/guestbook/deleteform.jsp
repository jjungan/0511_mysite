<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html>
<head>
<title>mysite</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="/mysite/assets/css/guestbook.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div id="container">
		<div id="header">
			<jsp:include page = "/views/include/header.jsp" flush="false"/>
		</div>
		<div id="content">
			<div id="guestbook" class="delete-form">
				<form method="post" action="/mysite/guestbook">
					<input type="hidden" name="a" value="delete">
					<input type='hidden' name="no" value="${no }">
					<div id="deleteform">
						<label>비밀번호</label>
						<input type="password" name="password">
						<input  TYPE="IMAGE" src="/mysite/assets/images/check.png" name="Submit" value="Submit" >
						<span style="color: blue">${msg }</span>
					</div>
				</form>
				<a href="/mysite/guestbook?a=guestbooklist">방명록 리스트로</a>
			</div>
		</div>
		<div id="navigation">
			<c:import url="/views/include/navigation.jsp">
				<c:param name="type" value="guestbook"></c:param>
			</c:import>
		</div>
		<div id="footer">
			<jsp:include page = "/views/include/footer.jsp" flush = "false"/>
		</div>
	</div>
</body>
</html>