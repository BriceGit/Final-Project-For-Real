<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<%@ page import="java.math.BigDecimal" %>
<%@ page import="java.util.*" %>
<%@ page import = "Util.*" %>

<%
String type = (String) request.getParameter("type");
System.out.println(type);
%>

<%
ArrayList<Item> results = (ArrayList<Item>) request.getAttribute("results");
%>

<%
String filter = (String) request.getParameter("filter");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Search</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
            href="https://fonts.googleapis.com/css2?family=Lobster&family=Roboto:wght@300&display=swap"
            rel="stylesheet">
    <link rel="stylesheet" href="index.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://kit.fontawesome.com/3204349982.js"
            crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/b8d24ea73f.js" crossorigin="anonymous"></script>
        <% boolean userLoggedIn = false; %>
        <%! String userName = ""; %>
        <%
        	Cookie[] cookies = request.getCookies();
        	if (cookies != null)
        	{
	        	for (Cookie c: cookies)
	        	{
		        		if (c.getName().equals("username"))
		        		{
		        			userLoggedIn = true;
		        			userName = c.getValue().replace("=", " ");
		        		}
	        	
	        	}
        	}
	        %>
        <style>
        	* 
        	{
        		font-family: 'Roboto', sans-serif;
        	}
        	#navbar a
        	{
        		float: right;
        		margin-right: 10px;
        		font-family: 'Roboto', sans-serif;
        		text-decoration-line: none;
        		font-size: 20px;
        		color: grey;
        	} 
        	#navbar #logo a
        	{
        		float: left;
        		font-family: 'Lobster', cursive;
        		color: red;
        		text-decoration-line: none;
        		font-size: 25px;
        		margin-bottom: 20px;
        	}
        	#navbar
        	{
        		margin-left: 0px;
        		margin-right: 0px;
        	}
        	img 
        	{
        		border-radius: 20px;
        	}
        	#banner
        	{
        		height: 60%;
        		width: 100%;
        		margin-top: 10px;
        	}
        	#search 
        	{
        		margin-top: 10px;

        	}
        	#search button
        	{
        		background-color: red;
        		height: 30px;
        		width: 40px;
        		border-radius: 5px;
        	}
        	#search-bar 
        	{
        		width: 60%;
        	}
        	
        	i
        	{
        		color: white;
        	}
        	#resultsss
        	{
        		margin-left: 20%;
        		margin-right: 20%;
        	}
        	
        	
        	hr
        	{
        		margin-top: 40px;
        		clear: both;
        	}
        	body 
        	{
        		margin: 0;
        	}
        	#menu-item
        	{
        		display: flex;
        		flex-direction: row;
        		justify-content: space-evenly;
        		width: 60%;
        		margin-top: 5%;
        		margin-bottom: 5%;
        	}
        	#menu-item div
        	{
        		left-margin: 20%;
        		width: 40%;
        		font-size: 12px;
        	}
        	#menu-item a
        	{
        		font-size: 30px;
        	}
        	#menu-item img 
        	{
        		border-radius: 2%;
        		height: 200px;
        		width: 200px;
        	}
        	
        	
        </style>
</head>
<body>
<!-- TODO -->
        <div id = "navbar">
        	<span id = "logo">
        		<a href = "index.jsp">SUS-tainify</a>
        	</span>
        	<span>
        		<% if (userLoggedIn) out.println("Hello, " + userName); %>
        	</span>
        	<span>
        		<a href = "auth.jsp"> <% if (!userLoggedIn) out.println("Login/Register"); %></a>
        		<a href = "Logout"> <% if (userLoggedIn) out.println("Logout"); %></a>
        	</span>
        	<span>
        		<a href = "index.jsp">Home</a>
        	</span>
			<hr>
        </div>
		<div id = "search">
			<form action = "Search" method = "get">
				<span>
					<input id = "search-bar" type = "text" placeholder = "Search term" name = "term"></input>
					<button type="submit"><i class = "fa-solid fa-magnifying-glass"></i></button>
				</span>
				<span id = "filters1">
					<input id = "price-filter" type = "radio" name = "filter" value = "name" checked/>
					<label for = "price-filter">Price</label>
				    <input id = "rating-filter" type = "radio" name = "filter" value = "tags"/> 
				    <label for = "rating-filter">Rating</label>
				</span>	
			</form>
		</div>
	<hr>
    <c:forEach var = "row" items = "${results}">
    	<div id = "menu-item">
	    	<div>
		    	<a href = "details.jsp?r_id=${row.getID()}"><c:out value = "${row.getName()}"/></a>
		    <!-- <h1>Price <c:out value = "${row.estimated_price}"></c:out></h1>
		    	<h1>Review Count: <c:out value = "${row.review_count}"></c:out></h1>
		    	<span>Rating:</span>
		    	<c:set var = "rt" value = "${row.rating}"></c:set>
		    	<%
		    		BigDecimal rating = (BigDecimal)pageContext.getAttribute("rt");
		    		for (int i = 0; i < rating.intValue(); i++)
		    		{
		    			out.write("<span class=\"fa fa-star checked\"></span>");
		    		}
		    	%> 
		    -->
		    </div>
	    </div>
	    <hr>
    </c:forEach>
    
</body>
</html>