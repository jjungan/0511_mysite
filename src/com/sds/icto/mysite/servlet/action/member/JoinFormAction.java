package com.sds.icto.mysite.servlet.action.member;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sds.icto.mysite.vo.MemberVo;
import com.sds.icto.web.Action;
import com.sds.icto.web.WebUtil;

public class JoinFormAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ClassNotFoundException, ServletException,
			IOException {
		HttpSession session = request.getSession();
		MemberVo authMember = (MemberVo)session.getAttribute("authMember");
		if(authMember == null){
			response.sendRedirect("/mysite/member?a=loginform");
			return;
		}
		WebUtil.forward("/views/member/joinform.jsp", request, response);
	}

}
