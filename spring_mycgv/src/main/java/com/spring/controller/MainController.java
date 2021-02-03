package com.spring.controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {
	
	
	@RequestMapping(value="/review2.do", method=RequestMethod.GET)
	public String review2() {
		return "review2";
	}
	
	
	@RequestMapping(value="/dbtest.do", method=RequestMethod.GET)
	public String dbtest() {
		try {
			//0 --> 드라이버 준비
			//1
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url="jdbc:oracle:thin:@localhost:1521";
			String user="scott";
			String pass="tiger";
			Connection conn = DriverManager.getConnection(url,user,pass);
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select empno,ename from emp");
			while(rs.next()) {
				System.out.print("empno : " + rs.getString(1) + "\t");
				System.out.println("ename : " + rs.getString(2));
			}
			
			rs.close();
			stmt.close();
			conn.close();
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return "index";
	}

	/**
	 * index.do --> index.jsp
	 */
	@RequestMapping(value="/index.do", method=RequestMethod.GET)
	public String index(String cat) {
		return "index";
	}
}
