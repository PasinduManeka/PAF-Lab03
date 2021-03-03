<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%@page import="java.sql.*"  %>
	<%@page import="java.io.*"  %>
	<%@page import="java.sql.DriverManager" %>
	<%@page import="java.sql.ResultSet"  %>
	<%@page import="java.sql.Statement"  %>
	<%@page import="java.sql.Connection"  %>
	
	<%
	int id = Integer.parseInt(request.getParameter("itemID")); 
	String url="jdbc:mysql://localhost:3306/paf";
	String user="root";
	String password="";
	Connection con;
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
	}catch(Exception e){
		System.out.println("Data base connection failed"+e);
	}
	Statement statement;
	ResultSet resultSet;
	try{
		con=DriverManager.getConnection(url,user,password);
		statement=con.createStatement();
		
		String sql="select itemCode,itemName,itemPrice,itemDesc from items where itemID='"+id+"'";
		
		resultSet=statement.executeQuery(sql);
		while(resultSet.next()){
	%>
	<form action = "uiItem" method="post">
		<input name="itemID" type="hidden" value=<%=resultSet.getString("itemID")%>><br>
		Item Code:<input name="itemCode" type="text" value=<%=resultSet.getString("itemCode")%>><br>
		Item Name:<input name="itemNamw" type="text" value=<%=resultSet.getString("itemName")%>><br>
		Item Price:<input name="itemPrice" type="text" value=<%=resultSet.getString("itemPrice") %>><br>
		Item Code:<input name="itemDescription" type="text" value=<%=resultSet.getString("itemDesc") %>><br>
		<input type="submit" name="btnSubmit" value="Submit">
		<%
		}
	}catch(Exception e){
		e.printStackTrace();
	}
	%>
	</form>
	
</body>
</html>