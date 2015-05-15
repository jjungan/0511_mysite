<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%pageContext.setAttribute("newLineChar","\n"); %>
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
			<jsp:include page="/views/include/header.jsp" flush="false"/>
		</div>
		<div id="content">
			<div id="guestbook">
				<form action="/mysite/guestbook" method="post">
					<input type="hidden" name="a" value="insert">
					<table id="insertTable">
						<tr>
							<th>이름</th><td><input type="text" name="name" required="required"></td>
							<th>비밀번호</th><td><input type="password" name="pass" required="required"></td>
						</tr>
						<tr>
							<td colspan=4 id="textareaTd"><textarea name="content" id="content" required="required"></textarea></td>
						</tr>
					</table>
					<div id="submitBtn">
						<input type="submit" VALUE=" 저장하기 ">
					</div>
				</form>
				<ul>
					<li>
						<table id="listTable">
						<c:forEach items="${list }" var="vo" varStatus="status">
							<tr>
								<td class="indexTd">${status.count }</td>
								<td>${vo.name }</td>
								<td>${vo.regDate }</td>
								<td class="deleteTd">
									<a href="/mysite/guestbook?a=deleteform&no=${vo.no }">
										<img alt="deleteimg" src="/mysite/assets/images/delete.png">
									</a>
								</td>
							</tr>
							<tr>
								<td colspan=4 class="messageTd">${fn:replace(vo.message,newLineChar,"<br>")}</td>
							</tr>
						</c:forEach>
						</table>
						<br>
					</li>
				</ul>
			</div>
		</div>
		<div id="navigation">
			<c:import url="/views/include/navigation.jsp">
				<c:param name="type" value="guestbook"></c:param>
			</c:import>
		</div>
		<div id="footer">
			<jsp:include page="/views/include/footer.jsp"/>
		</div>
	</div>
</body>
</html>