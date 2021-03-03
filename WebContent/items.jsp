<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Items Management</title>
</head>
<body>
	
		<h1>Items Managements</h1>
		<form action="item" method="post">
			Item code:<input name="itemCode" type="text"><br>
			Item name:<input name="itemName" type="text"><br>
			Item Price:<input name="itemPrice" type="text"><br>
			Item description:<input name="itemDescription" type="text"><br>	
			<input type="submit" name="btnSave" value="Save">
		</form>
		
</body>
</html>