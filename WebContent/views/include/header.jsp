<%@page import="com.sds.icto.mysite.vo.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	MemberVo authMember =  (MemberVo)session.getAttribute("authMember");
	
%>
	<h1>MySite</h1>
	<ul>
	<%
		if(authMember == null){
	%>
			<li><a href="/mysite/member?a=loginform">로그인</a><li>
			<li><a href="/mysite/member?a=joinform">회원가입</a><li>
	<%
		}else{
	%>
			<li><a href="/mysite/member?a=myinfo">회원정보수정</a><li>
			<li><a href="/mysite/member?a=logout">로그아웃</a><li>
			<li><%=authMember.getName() %>님 안녕하세요 ^^;</li>
	<%
		}
	%>
	</ul>