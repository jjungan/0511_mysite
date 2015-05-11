<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<ul>
		<c:choose>
		<c:when test="${param.type == 'guestbook' }">
			<li>${sessionScope.authMember.name }</li>
			<li class="selected"><a href="/mysite/guestbook?a=guestbooklist">방명록</a></li>
			<li><a href="">게시판</a></li>		
		</c:when>
		<c:when test="${param.type == 'board' }">
			<li>${sessionScope.authMember.name }</li>
			<li><a href="/mysite/guestbook?a=guestbooklist">방명록</a></li>
			<li class="selected"><a href="">게시판</a></li>		
		</c:when>
		<c:otherwise>
			<li class="selected">${sessionScope.authMember.name }</li>
			<li><a href="/mysite/guestbook?a=guestbooklist">방명록</a></li>
			<li><a href="">게시판</a></li>				
		</c:otherwise>
	</c:choose>
</ul>