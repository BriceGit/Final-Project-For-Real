<!DOCTYPE html>
<html lang="en">
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

<head>
	<title>Sustainify</title>
	<meta content="width=device-width, initial-scale=1, shrink-to-fit=no" name="viewport">
	<!-- Bootstrap link -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<link href="main.css" rel="stylesheet">
	<script src="https://kit.fontawesome.com/72a36f73ea.js" crossorigin="anonymous"></script>
	<style>
		.intro {
			background-color: rgba(255, 255, 255, 0.9);
			position: absolute;
			bottom: 300px;
			text-align: center;
			padding: 25px;
			z-index: 1;
			border-radius: 10px;
			left: 10px;
		}

		.barSize{
			width: 50%;
			margin: auto auto;
		}

		@media only screen and (min-width: 01px) {
			.intro {
				display: none;
			}


		}

		@media only screen and (min-width:577px) {
			.intro {
				bottom: 540px;
				padding: 20px;
				left: 20px;
				display: block;
			}
		}

		@media only screen and (min-width:768px) {
			.intro {
				bottom: 420px;
				left: 20px;
				padding: 25px;
			}
		}


		@media only screen and (min-width:992px) {
			.intro {
				bottom: 340px;
				padding: 30px;
				left: 20px;
			}
		}

		@media only screen and (min-width:1200px) {
			.intro {
				bottom: 150px;
				left: 20px;
				padding: 30px;
			}
		}

		#shopbtn {
			text-decoration: none;
			background-color: transparent;
			border: 1px solid black;
			padding: 10px;
			border-radius: 10px;
			color: black;
			margin: 5px 0px;
		}

		#shopbtn:hover {
			background-color: black;
			transition-duration: 0.3s;
			color: white;

		}

		#slogan {
			font-size: 18px;
		}


		.shopimage {
			margin: 50px;
			transition-duration: 0.3s;
			width: 80%;
			height: auto;
		}

		.shopimage:hover {
			transform: scale(1.03);
		}

		.shopbtn2 {
			position: absolute;
			left: 100px;
			margin: 15px;
			font-size: 18px;
		}


		#introtext {
			width: 86%;
			margin-left: auto;
			margin-top: 20px;
			margin-right: auto;
		}

		.submitbtn
		{
			background-color: black; 
			border: 0px;
		}

		.submitbtn:hover {
			transition-duration: 0.3s;
			color: white;
		}

		.nav-link:hover {
			background-color: skyblue;
		}

		.footer {
			position: relative;
			bottom: 0px;
		}
	</style>
</head>

<body>
  <div id = 'errorbar'>
  	<%
  		if (request.getAttribute("error") != null)
  		{
	  		if (request.getAttribute("error").equals("nullemail"))
	  		{
	  			out.println("Email missing from registration form. Please try again.");
	  		}
	  		else if (request.getAttribute("error").equals("nullname"))
	  		{
	  			out.println("Name missing from registration form. Please try again");
	  		}
	  		else if (request.getAttribute("error").equals("nullpassword"))
	  		{
	  			out.println("Password missing from registration form. Please try again.");
	  		}
	        else if (request.getAttribute("error").equals("nullconfirmation"))
	  		{
	  			out.println("Password confirmation missing from registration form. Please try again");
	  		}
	        else if (request.getAttribute("error").equals("passwordMismatch"))
	        {
	        	out.println("Inputted passwords on registration form do not match. Please try again.");
	        }
	        else if (request.getAttribute("error").equals("badEmail"))
	  		{
	  			out.println("Inputted email on registration form is poorly formatted. Please try again");
	  		}
	        else if (request.getAttribute("error").equals("lbadEmail"))
	  		{
	  			out.println("Inputted email on login form is poorly formatted. Please try again");
	  		}
	        else if (request.getAttribute("error").equals("usernotfound"))
	        {
	        	out.println("Invalid login email or password. Please try again");
	        }
	  		else if (request.getAttribute("error").equals("lnullpassword"))
	  		{
	  			out.println("Password missing from login form. Please try again.");
	  		}
	  		else if (request.getAttribute("error").equals("lnullemail"))
	  		{
	  			out.println("Email missing from login form. Please try again.");
	  		}
	  		else if (request.getAttribute("error").equals("emailInUse"))
	  		{
	  			out.println("Registration email already in use. Please try a different email");
	  		}
	  		

  		}
  	%>
  </div>
	<nav class="navbar navbar-expand-lg navbar-light bg-light sticky-top shadow-lg bg-white rounded">
		<a class="navbar-brand" href="index.jsp"><i class="fa-solid fa-bag-shopping"></i> S U S T A I N I F Y</a>

		<button aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation"
			class="navbar-toggler" data-target="#navbarNavAltMarkup" data-toggle="collapse" type="button"><span
				class="navbar-toggler-icon"></span></button>

		<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
			<div class="navbar-nav">
				<a class="nav-link active" href="index.jsp">Home <span class="sr-only">(current)</span></a>
				<a class="nav-link active" href="signup.jsp"><% if (!userLoggedIn) out.println("Register"); %></a>
        		<a class="nav-link" href = "Logout"> <% if (userLoggedIn) out.println("Logout"); %></a> 
				<!--
				<a class="nav-link" href="myprofile.html">
					My Profile
				</a>
				<a class="nav-link" href="checkout.html">
					<svg width="1em" height="1em" viewBox="0 0 12 20" class="bi bi-bag" fill="currentColor"
						xmlns="http://www.w3.org/2000/svg">
						<path fill-rule="evenodd"
							d="M8 1a2.5 2.5 0 0 0-2.5 2.5V4h5v-.5A2.5 2.5 0 0 0 8 1zm3.5 3v-.5a3.5 3.5 0 1 0-7 0V4H1v10a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V4h-3.5zM2 5v9a1 1 0 0 0 1 1h10a1 1 0 0 0 1-1V5H2z" />
					</svg>
					My Items
				</a>
				-->
			</div>
		</div>
	</nav>

	<img alt="tshirt" class="img-fluid" src="images/landingimage.png">

	<div class="intro">
		<h3>Welcome to <strong>S U S T A I N I F Y</strong></h3>
		<p id="slogan">Made for the Concious Consumer.</p><a href="#theshop" id="shopbtn">Shop Now</a>
	</div>
	<div id="introtext">
		<p>Welcome to Sustainify, your one stop shop to buy anything sustainble. When you register </p>
	</div>

	<div class="container-fluid" id="theshop">
		<div class="row" id="thumbnails">
			<div class="col-12 col-md-6">
				<div class="barSize">
					<h4 style="text-decoration: underline;">Search</h4>
					<div class="input-group rounded">
						<input type="search" class="form-control rounded" placeholder="Search" aria-label="Search"
							aria-describedby="search-addon"/>
						<span class="input-group-text border-0" id="search-addon">
							<i class="fas fa-search"></i>
						</span>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios1" value="option1" checked>
						<label class="form-check-label" for="exampleRadios1">
							Name
						</label>
					  </div>
					  <div class="form-check">
						<input class="form-check-input" type="radio" name="exampleRadios" id="exampleRadios2" value="option2">
						<label class="form-check-label" for="exampleRadios2">
						  Tags
						</label>
					  </div>
				</div>
			</div>

			<div class="col-12 col-md-6">
				<form action = "Login" method = "get">
					
					<div class="barSize">
					<h4 style="text-decoration: underline;">Login</h4>
					<div class="form-group">
						<label for="exampleInputEmail1">Email: </label>
						<input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp"
							placeholder="Enter email" name = "login-email">
						<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone
							else.</small>
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">Password: </label>
						<input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" name = "login-password">
					</div>
					<!-- Need to implement  -->
					<input type = "submit" class="btn btn-primary submitbtn">
					<p style="margin-top: 5%;">Not a user?<a href="signup.html"> Register Now. </a></p>
					</div>
				</form>
			</div>
		</div>
	</div>

	<!--footer-->
	<div class="container-fluid footer">
		<div class="row footerspace align-items-center">
			<p style="color: white; margin-bottom: -1%;">Created by Krishna, Sahithi, Brice & Kritin</p>
	</div>
	<!-- Bootstrap link -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js">
	</script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js">
	</script>
</body>

</html>