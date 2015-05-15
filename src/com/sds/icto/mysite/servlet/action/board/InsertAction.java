package com.sds.icto.mysite.servlet.action.board;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sds.icto.mysite.dao.BoardDao;
import com.sds.icto.mysite.dao.MemberDao;
import com.sds.icto.mysite.vo.BoardVo;
import com.sds.icto.mysite.vo.MemberVo;
import com.sds.icto.web.Action;
import com.sds.icto.web.WebUtil;

public class InsertAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ClassNotFoundException, ServletException,
			IOException {
		
		String title = request.getParameter("title");
		String password= request.getParameter("password");
		String content = request.getParameter("content");

		HttpSession session = request.getSession();
		MemberVo authMember = (MemberVo)session.getAttribute("authMember");
		if(authMember == null){
			response.sendRedirect("/mysite/member?a=loginform");
			return;
		}
		MemberVo vo = new MemberVo();
		vo.setEmail(authMember.getEmail());
		vo.setPassword(password);
		
		MemberDao dao = new MemberDao();
		MemberVo member = dao.getMember(vo);
		if(member == null){
		// 비밀번호가 맞지않음
			WebUtil.forward("/views/board/inserterror.jsp", request, response);
			return;
		}else{
		// 비밀번호가 맞음
		
		BoardVo v = new BoardVo();
		v.setTitle(title);
		v.setContent(content);
		v.setMemberNo(member.getNo());
		v.setMemberName(member.getName());
		
		BoardDao bdao = new BoardDao();
		bdao.insertBoard(v);
		
		response.sendRedirect("/mysite/board?a=boardlist");

		}

	}
}
