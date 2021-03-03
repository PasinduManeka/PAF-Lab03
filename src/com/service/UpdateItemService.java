package com.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import com.model.item;
import com.util.DatabaseConnection;

public class UpdateItemService {
	public static Connection con;
	private static PreparedStatement ps;
	private static Statement stmt;
	private String message;
	
	public void  updateItem(item i) {
		try {
			con=DatabaseConnection.getConnection();
			stmt=con.createStatement();
			
			ps=con.prepareStatement("update items set itemCode =?, itemName=?, itemPrice=?, itemDesc=? where itemID=?");
			
			ps.setString(1, i.getItemCode());
			ps.setString(2, i.getItemCode());
			ps.setFloat(3, i.getPrice());
			ps.setString(4, i.getDescription());
			ps.setInt(5, i.getItemID());
			ps.executeUpdate();
			con.setAutoCommit(false);
			con.commit();
			
			
			message = "<script>alert('Stock Update success.')</script>";
			
			
		}catch(SQLException e) {
			message="<Script>alert('Stock Update unsuccess.')</scrip>";
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
	
	public String getMessage() {
		return message;
	}
	
	
}
