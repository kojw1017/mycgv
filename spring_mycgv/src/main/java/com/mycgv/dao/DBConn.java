package com.mycgv.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;

public class DBConn {
	//Field
	String driver ="oracle.jdbc.driver.OracleDriver";
	String url="jdbc:oracle:thin:@localhost:1521";
	String user="scott";
	String pass="tiger";
	Connection conn;
	Statement stmt;
	PreparedStatement pstmt;
	
	//Constructor : 1,2 단계
	public DBConn() {
		try {
			//1. 드라이버 로딩
			Class.forName(driver);
			//System.out.println("1단계 성공~");

			//2. Connection 객체 생성
			conn = DriverManager.getConnection(url,user,pass);
			//System.out.println("2단계 Connection 객체 생성~");
	
		}catch(Exception e) {
			e.printStackTrace();
		}	
	}//constructor
	
	//Method
	public void getStatement() {
		try {
			stmt = conn.createStatement();
		}catch(Exception e) { e.printStackTrace();}
	}
	
	
	public void getPreparedStatement(String sql) {
		try {
			pstmt = conn.prepareStatement(sql);
		}catch(Exception e) {e.printStackTrace();}
	}

}













