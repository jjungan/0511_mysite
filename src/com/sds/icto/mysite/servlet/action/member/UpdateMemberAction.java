package com.sds.icto.mysite.servlet.action.member;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sds.icto.mysite.dao.MemberDao;
import com.sds.icto.mysite.vo.MemberVo;
import com.sds.icto.web.Action;

public class UpdateMemberAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ClassNotFoundException, ServletException,
			IOException {
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String gender = request.getParameter("gender");
		HttpSession session = request.getSession();
		MemberVo authMember = (MemberVo)session.getAttribute("authMember");
		System.out.println("authMember : "+authMember);
		if(authMember == null){
			response.sendRedirect("/mysite/member?a=loginform");
			return;
		}
		MemberVo vo = new MemberVo();
		vo.setEmail(authMember.getEmail());
		vo.setName(name);
		vo.setPassword(password);
		vo.setGender(gender);
		System.out.println(vo);
		
		MemberDao dao = new MemberDao();
		dao.update(vo);
		//session에 있는 authMember도 업데이트.
		MemberVo authMember2 = dao.getMember(vo);
		session.removeAttribute("authMember");
		session.setAttribute("authMember", authMember2);
		
		response.sendRedirect("/mysite/");

	}

}
