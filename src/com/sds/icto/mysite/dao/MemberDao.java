package com.sds.icto.mysite.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.sds.icto.mysite.vo.MemberVo;

public class MemberDao {
	private Connection getConnection() throws ClassNotFoundException, SQLException{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String dbURL = "jdbc:oracle:thin:@localhost:1521:xe";
		Connection conn = DriverManager.getConnection(dbURL, "webdb", "webdb");
		return conn;
	}
	
	public void update(MemberVo vo) throws ClassNotFoundException, SQLException{
		Connection conn = getConnection();
		
		String sql =  "update member set name=?, password=?, gender=? where email = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, vo.getName());
		stmt.setString(2, vo.getPassword());
		stmt.setString(3, vo.getGender());
		stmt.setString(4, vo.getEmail());
		stmt.executeUpdate();
		
		if (stmt != null)stmt.close(); 
		if (conn != null)conn.close(); 
	}
	public void insert(MemberVo vo) throws ClassNotFoundException, SQLException{
		Connection conn = getConnection();
		
		String sql =  " insert into member values(member_no_seq.nextval, ?, ?, ?, ?)";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, vo.getName());
		stmt.setString(2, vo.getEmail());
		stmt.setString(3, vo.getPassword());
		stmt.setString(4, vo.getGender());
		stmt.executeUpdate();
					
		if (stmt != null)stmt.close(); 
		if (conn != null)conn.close(); 
	}
	public MemberVo getMember(MemberVo vo) throws ClassNotFoundException, SQLException{
		Connection conn = getConnection();
		
		String sql =  "  select * from member where email = ? and password = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, vo.getEmail());
		stmt.setString(2, vo.getPassword());
		ResultSet rs = stmt.executeQuery();
		
		MemberVo member = null;
		if(rs.next()){
			member = new MemberVo(); 
			member.setNo(rs.getLong(1));
			member.setName(rs.getString(2));
			member.setEmail(rs.getString(3));
			//member.setPassword(rs.getString(4)); => 보안때문에
			member.setGender(rs.getString(5));
		}
		
		if (rs != null)stmt.close(); 
		if (stmt != null)stmt.close(); 
		if (conn != null)conn.close(); 
		
		return member;
	}
}
