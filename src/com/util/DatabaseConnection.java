package com.util;

import java.sql.Connection;
import java.sql.DriverManager;


public class DatabaseConnection {
	private static String url="jdbc:mysql://localhost:3306/paf";
	private static String user="root";
	private static String password="";
	private static Connection con;
	
	public static Connection getConnection() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con=(Connection) DriverManager.getConnection(url,user,password);
		}catch(Exception e) {
			System.out.println("Database Connection failed"+e);
		}
		
		return con;
	}
}
