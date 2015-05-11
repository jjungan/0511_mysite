<%@page import="com.sds.icto.mysite.vo.GuestBookVo"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
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
					<table>
						<tr>
							<td>이름</td><td><input type="text" name="name"></td>
							<td>비밀번호</td><td><input type="password" name="pass"></td>
						</tr>
						<tr>
							<td colspan=4><textarea name="content" id="content"></textarea></td>
						</tr>
						<tr>
							<td colspan=4 align=right><input type="submit" VALUE=" 확인 "></td>
						</tr>
					</table>
				</form>
				<ul>
					<li>
						<table>
						<%
						List<GuestBookVo> list = (List<GuestBookVo>)request.getAttribute("list");
						for(int i=0;i<list.size();i++){
							GuestBookVo gb = list.get(i);
						%>
							<tr>
								<td><%=gb.getNo() %></td>
								<td><%=gb.getName() %></td>
								<td><%=gb.getRegDate() %></td>
								<td><a href="">삭제</a></td>
							</tr>
							<tr>
								<td colspan=4><%=gb.getMessage() %></td>
							</tr>
						<%
						}
						%>
						</table>
						<br>
					</li>
				</ul>
			</div>
		</div>
		<div id="navigation">
			<jsp:include page="/views/include/navigation.jsp"/>
		</div>
		<div id="footer">
			<p>(c)opyright 2014 </p>
		</div>
	</div>
</body>
</html>