package com.sds.icto.mysite.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.sds.icto.mysite.vo.BoardVo;

public class BoardDao {
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	
	
	private Connection getConnection() throws ClassNotFoundException, SQLException{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String dbURL = "jdbc:oracle:thin:@localhost:1521:xe";
		conn = DriverManager.getConnection(dbURL, "webdb", "webdb");
		return conn;
	}
	
	public void insertBoard(BoardVo vo) throws ClassNotFoundException, SQLException{
		conn = getConnection();
		String sql = "insert into Board values(board_no_seq.nextval,?,?,?,?,0,sysdate)";
		stmt = conn.prepareStatement(sql);
		stmt.setString(1, vo.getTitle());
		stmt.setString(2, vo.getContent());
		stmt.setLong(3, vo.getMemberNo());
		stmt.setString(4, vo.getMemberName());
		stmt.executeUpdate();
		
		if(stmt!=null)stmt.close();
		if(conn!=null)conn.close();
	}
	
	public void deleteBoard(BoardVo vo) throws ClassNotFoundException, SQLException{
		conn = getConnection();
		String sql = "delete from Board where no = ?";
		stmt = conn.prepareStatement(sql);
		stmt.setLong(1, vo.getNo());
		stmt.executeUpdate();
		
		if(stmt!=null)stmt.close();
		if(conn!=null)conn.close();
		
	}
	public void updateBoard(BoardVo vo) throws ClassNotFoundException, SQLException{
		conn = getConnection();
		String sql = "update Board set title=?, content=? where no = ?";
		stmt = conn.prepareStatement(sql);
		stmt.setString(1, vo.getTitle());
		stmt.setString(2, vo.getContent());
		stmt.setLong(3, vo.getNo());
		stmt.executeUpdate();
		
		if(stmt!=null)stmt.close();
		if(conn!=null)conn.close();
		
	}
	public void updateBoardViewCnt(BoardVo vo) throws ClassNotFoundException, SQLException{
		conn = getConnection();
		String sql = "update Board set view_cnt= view_cnt+1 where no = ?";
		stmt = conn.prepareStatement(sql);
		stmt.setLong(1, vo.getNo());
		stmt.executeUpdate();
		
		if(stmt!=null)stmt.close();
		if(conn!=null)conn.close();
		
	}
	
	public BoardVo selectBoardByNo(Long no) throws ClassNotFoundException, SQLException{
		conn = getConnection();
		String sql = "select * from Board where no = ? order by no desc";
		stmt = conn.prepareStatement(sql);
		stmt.setLong(1, no);
		rs = stmt.executeQuery();
		BoardVo vo = new BoardVo();
		while(rs.next()){
			vo.setNo(rs.getLong(1));
			vo.setTitle(rs.getString(2));
			vo.setContent(rs.getString(3));
			vo.setMemberNo(rs.getLong(4));
			vo.setMemberName(rs.getString(5));
			vo.setViewCnt(rs.getLong(6));
			vo.setRegDate(rs.getDate(7));
		}
		if(rs!=null)rs.close();
		if(stmt!=null)stmt.close();
		if(conn!=null)conn.close();
		return vo;
	}
	
	public List<BoardVo> selectBoard() throws ClassNotFoundException, SQLException{
		conn = getConnection();
		String sql = "select * from Board order by no desc";
		stmt = conn.prepareStatement(sql);
		rs = stmt.executeQuery();
		List<BoardVo> list = new ArrayList<BoardVo>();
		while(rs.next()){
			BoardVo vo = new BoardVo();
			vo.setNo(rs.getLong(1));
			vo.setTitle(rs.getString(2));
			vo.setContent(rs.getString(3));
			vo.setMemberNo(rs.getLong(4));
			vo.setMemberName(rs.getString(5));
			vo.setViewCnt(rs.getLong(6));
			vo.setRegDate(rs.getDate(7));
			list.add(vo);
		}
		if(rs!=null)rs.close();
		if(stmt!=null)stmt.close();
		if(conn!=null)conn.close();
		return list;
	}
	public List<BoardVo> selectBoardByKeyword(String word) throws ClassNotFoundException, SQLException{
		conn = getConnection();
		String sql = "select * from Board where title like ? order by no desc";
		stmt = conn.prepareStatement(sql);
		stmt.setString(1, "%"+word+"%");
		rs = stmt.executeQuery();
		List<BoardVo> list = new ArrayList<BoardVo>();
		while(rs.next()){
			BoardVo vo = new BoardVo();
			vo.setNo(rs.getLong(1));
			vo.setTitle(rs.getString(2));
			vo.setContent(rs.getString(3));
			vo.setMemberNo(rs.getLong(4));
			vo.setMemberName(rs.getString(5));
			vo.setViewCnt(rs.getLong(6));
			vo.setRegDate(rs.getDate(7));
			list.add(vo);
		}
		if(rs!=null)rs.close();
		if(stmt!=null)stmt.close();
		if(conn!=null)conn.close();
		return list;
	}
}
