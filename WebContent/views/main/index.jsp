<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html>
<head>
<title>mysite</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="/mysite/assets/css/main.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div id="container">
		<div id="header">
			<jsp:include page="/views/include/header.jsp" flush="false"/>
		</div>
		<div id="wrapper">
			<div id="content">
				<div id="site-introduction">
					<img id="profile" src="/mysite/assets/images/gude.PNG" width="200px">
					<h2>안녕하세요.<br>  여러분을 환영합니다♡</h2>
					<p>
						이 사이트는  웹 프로그램밍 실습과제 예제 사이트입니다.<br>
						메뉴는 방명록, 게시판이 있습니다. 오셔서 많은 게시글 남겨주세요 : )<br><br>
						
						<a href="/mysite/guestbook?a=guestbooklist">방명록</a>에 글 남기기<br>
					</p>
				</div>
			</div>
		</div>
		<div id="navigation">
			<jsp:include page="/views/include/navigation.jsp"/>
		</div>
		<div id="footer">
			<jsp:include page="/views/include/footer.jsp"/>
		</div>
	</div>
</body>
</html>