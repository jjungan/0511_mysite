package com.sds.icto.mysite.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.sds.icto.mysite.vo.GuestBookVo;


public class GuestBookDao {
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	
	
	private Connection getConnection() throws ClassNotFoundException, SQLException{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String dbURL = "jdbc:oracle:thin:@localhost:1521:xe";
		conn = DriverManager.getConnection(dbURL, "webdb", "webdb");
		return conn;
	}
	
	public void insertGuestBook(GuestBookVo vo) throws ClassNotFoundException, SQLException{
		conn = getConnection();
		String sql = "insert into guestbook values(guestbook_seq.nextval,?,?,?,sysdate)";
		stmt = conn.prepareStatement(sql);
		stmt.setString(1, vo.getName());
		stmt.setString(2, vo.getPassword());
		stmt.setString(3, vo.getMessage());
		stmt.executeUpdate();
		
		if(stmt!=null)stmt.close();
		if(conn!=null)conn.close();
	}
	
	public void deleteGuestBook(GuestBookVo vo) throws ClassNotFoundException, SQLException{
		conn = getConnection();
		String sql = "delete from guestbook where no = ?";
		stmt = conn.prepareStatement(sql);
		stmt.setLong(1, vo.getNo());
		stmt.executeUpdate();
		
		if(stmt!=null)stmt.close();
		if(conn!=null)conn.close();
		
	}
	
	public GuestBookVo selectGuestBookByNo(Long no) throws ClassNotFoundException, SQLException{
		conn = getConnection();
		String sql = "select * from guestbook where no = ? order by no desc";
		stmt = conn.prepareStatement(sql);
		stmt.setLong(1, no);
		rs = stmt.executeQuery();
		GuestBookVo vo = new GuestBookVo();
		while(rs.next()){
			vo.setNo(rs.getLong(1));
			vo.setName(rs.getString(2));
			vo.setPassword(rs.getString(3));
			vo.setMessage(rs.getString(4));
			vo.setRegDate(rs.getDate(5));
		}
		if(rs!=null)rs.close();
		if(stmt!=null)stmt.close();
		if(conn!=null)conn.close();
		return vo;
	}
	
	public List<GuestBookVo> selectGuestBook() throws ClassNotFoundException, SQLException{
		conn = getConnection();
		String sql = "select * from guestbook order by no desc";
		stmt = conn.prepareStatement(sql);
		rs = stmt.executeQuery();
		List<GuestBookVo> list = new ArrayList<GuestBookVo>();
		while(rs.next()){
			GuestBookVo vo = new GuestBookVo();
			vo.setNo(rs.getLong(1));
			vo.setName(rs.getString(2));
			vo.setPassword(rs.getString(3));
			vo.setMessage(rs.getString(4));
			vo.setRegDate(rs.getDate(5));
			list.add(vo);
		}
		if(rs!=null)rs.close();
		if(stmt!=null)stmt.close();
		if(conn!=null)conn.close();
		return list;
	}
}
