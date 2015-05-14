package com.sds.icto.mysite.test;

import java.sql.SQLException;
import java.util.List;

import com.sds.icto.mysite.dao.BoardDao;
import com.sds.icto.mysite.vo.BoardVo;

public class BoardTest {
	public static void main(String[] args) {
		try {
			
			BoardVo vo = new BoardVo();
			vo.setTitle("안녕하세요?");
			vo.setContent("만나서 반갑습니다. 앞으로 잘 부탁 드려요!ㅎㅎ");
			vo.setMemberNo(1);
			vo.setMemberName("jungan");
			vo.setViewCnt(0);
			
			BoardDao dao = new BoardDao();
			//dao.insertBoard(vo);
			
			List<BoardVo> list = dao.selectBoard();
			for (BoardVo b : list) {
				System.out.println(b);
			}
			System.out.println("----------------------------------------");
			BoardVo vo2= dao.selectBoardByNo(1L);
			vo2.setTitle("hi!");
			System.out.println(vo2);
			dao.updateBoard(vo2);

			List<BoardVo> list2 = dao.selectBoard();
			for (BoardVo b : list2) {
				System.out.println(b);
			}
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		
	}

}
