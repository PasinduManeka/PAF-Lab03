package com.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;

import com.model.item;


import com.util.DatabaseConnection;

public class addItemService {
	private static Connection con;
	private static PreparedStatement ps;
	private static Statement st;

	public void item(item i) {
		try {
			con = DatabaseConnection.getConnection();
			st = con.createStatement();
			
			ps = con.prepareStatement("insert into items (itemCode,itemName,itemPrice,itemDesc) values(?,?,?,?)");
			
			ps.setString(1, i.getItemCode());
			ps.setString(2, i.getItemName());
			ps.setFloat(3, i.getPrice());
			ps.setString(4,i.getDescription());
			ps.executeUpdate();
			con.setAutoCommit(false);
			con.commit();
			
			
			
		}catch(SQLException e){
			System.out.println("Databse did not connect."+e);
		}finally {
			if(con != null) {
				try{
					con.close();
				}catch(SQLException e) {
					
				}
			}
		}
	}

}
