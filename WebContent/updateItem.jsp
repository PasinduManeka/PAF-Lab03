<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Item</title>
</head>
<body>
<%@page import="java.sql.*" %>
<%@page import="java.io.*" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.Connection" %>

<%
int id = Integer.parseInt(request.getParameter("itemID"));
String url="jdbc:mysql://localhost:3306/paf";
String user="root";
String pass="";
Connection con;

try{
	Class.forName("com.mysql.jdbc.Driver");
}catch(Exception e){
	System.out.println("Database doesn't connect."+e);
}

Statement stmt;
ResultSet rs;

try{
	con=DriverManager.getConnection(url,user,pass);
	stmt = con.createStatement();
	
	String sql="select* from items where itemID='"+id+"'";
	rs=stmt.executeQuery(sql);
	while(rs.next()){
		%>
		<form action="upItem" method="post">
			<input type="hidden" name="pid" value=<%=rs.getString("itemID")%>><br>
			Item Code:<input type="text" name="itemCode" value=<%=rs.getString("itemCode")%>><br>
			Item Name:<input type="text" name="itemName" value=<%=rs.getString("itemName")%>><br>
			Item Price:<input type="text" name="itemPrice" value=<%=rs.getString("itemPrice")%>><br>
			Item Description:<input type="text" name="itemDesc" value=<%=rs.getString("itemDesc")%>><br>
			<input type="submit" name="btnSubmit" value="Update Data">
			
		</form>
		<%
	}
}catch(Exception e){
	e.printStackTrace();
}


%>

</body>
</html>