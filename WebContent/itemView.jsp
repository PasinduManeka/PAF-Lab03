<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Item Table</title>
</head>
<body>	
	<%@page import="java.sql.DriverManager" %>
	<%@page import="java.sql.ResultSet" %>
	<%@page import="java.sql.Statement" %>
	<%@page import="java.sql.Connection" %>
	<%
	String url="jdbc:mysql://localhost:3306/paf";
	String user="root";
	String password="";
	Connection con;
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
	}catch(Exception e){
		System.out.print("Database connection failed.");
	}
	Statement statement;
	ResultSet resultSet;
	%>
	<table border=2>
		<thead>
			<tr>
				<th>Item ID</th>
				<th>Item Code</th>
				<th>Item Name</th>	
				<th>Item Price</th>
				<th>Item Description</th>
				<th>Action</th>
			</tr>
		</thead>
		<%
		try{
			con=DriverManager.getConnection(url,user,password);
			statement=con.createStatement();
			
			String sql="select* from items";
			
			resultSet=statement.executeQuery(sql);
			while(resultSet.next()){
		
		
	
		%>
		<tbody>
			<tr>
				<td><%=resultSet.getString("itemID") %></td>
				<td><%=resultSet.getString("itemCode") %></td>
				<td><%=resultSet.getString("itemName") %></td>
				<td><%=resultSet.getString("itemPrice") %></td>
				<td><%=resultSet.getString("itemDesc") %></td>
				<td><form action = "" method="POST" >
				<input type ='submit' value="Remove" name = "btnDelete"	>
				<input type="hidden" name="itemID" value="<%=resultSet.getString("itemID") %>">
				</form></td>
				<td><form action = "updateItem.jsp" method="POST" >
				<input type ='submit' value="Update" name = "btnUpdate"	>
				<input type="hidden" name="itemID" value="<%=resultSet.getString("itemID") %>">
				</form></td>
				
			</tr>
		
		</tbody>
		<%
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		%>
	</table>
	
	
	
</body>
</html>