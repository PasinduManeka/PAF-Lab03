package com.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import com.model.item;
import com.util.DatabaseConnection;

public class removeItem {
	public static Connection con;
	private static PreparedStatement ps;
	private static Statement stmt;
	
	public void removeItem(item i) {
		try {
			con = DatabaseConnection.getConnection();
			stmt = con.createStatement();
			
			ps = con.prepareStatement("delete from items where itemID = ?");
			ps.setInt(1, i.getItemID());
			ps.executeUpdate();
			con.setAutoCommit(false);
			con.commit();
		}catch(SQLException e) {
			System.out.println(e);
		}finally {
			if(con != null) {
				try {
					con.close();
				}catch(SQLException e) {
					
				}
			}
		}
	}

}
