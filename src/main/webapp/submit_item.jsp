<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action = "SubmitItem" method = "POST" enctype='multipart/form-data'>
	<input name = "name" type = "text">
	<input name = "tag1" type = "text">
	<input name = "tag2" type = "text">
	<input name = "tag3" type = "text">
	<input name = "username" type = "text">
	<input name = "description" type = "text">
	<input name = "price" type = "text">
	<input type="file" name="image">
	<input type = "submit">
</form>

</body>
</html>