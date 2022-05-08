<!DOCTYPE html>
<html lang="en">
<head>
    
    <title>Bisani | Checkout</title>
    
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <!-- Bootstrap link -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <link rel="stylesheet" href="main.css">
	<script src="https://kit.fontawesome.com/72a36f73ea.js" crossorigin="anonymous"></script>
    
    <style>
        .nav-link:hover{
            background-color: #5cd65c;
        }
        
        .shopbtn2:before{
            background: #5cd65c;
        }
        
        h1 {
            padding-left: 50px;
            padding-top: 50px;
        }
        
        h3 {
            padding-left: 50px;
        }

        .smallsize {
            width: 200px;
            height: 140px;
            border-radius: 10px;
        }
        
        p {
            font-size: 18px;
        }
        
        .jumbotron {
            border-radius: 10px;
        }
        
        #checkoutbutton {
            padding: 10px;
            color: black;
            background-color: darkgrey;
            border-radius: 10px;
            transition: 0.3s ease-in-out;
        }
        
        #checkoutbutton:hover {
            background-color: #5cd65c;
            text-decoration: none;
        }
    </style>
    
</head>
    
<body>

    <nav class="navbar navbar-expand-lg navbar-light bg-light sticky-top shadow-lg bg-white rounded">
        <a class="navbar-brand" href="index.html"><i class="fa-solid fa-bag-shopping"></i> S U S T A I N I F Y</a>
    
        <button aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation"
            class="navbar-toggler" data-target="#navbarNavAltMarkup" data-toggle="collapse" type="button"><span
                class="navbar-toggler-icon"></span></button>
    
        <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
            <div class="navbar-nav">
                <a class="nav-link" href="index.html">Home </a> <a
                    class="nav-link" href="signup.html">Register</a>
                <a class="nav-link active" href="mycart.html">My Cart<span class="sr-only">(current)</span></a>
                <!-- move the shopping bag icon next to My Cart -->
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
            </div>
        </div>
    </nav>


<div class="container">
<h1>Checkout Page</h1>
    <h3>Summary of Cart</h3></div><br>
    
<div class="container">
    <div class="row">
        <div class="col-sm-12 col-md-8">
            <div class="jumbotron jumbotron-fluid">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col">
                            <h4>Men's Black Tee</h4>
                            <img src="images/shopmen.JPG" class="smallsize">
                        </div>
                        <div class="col justify-content-center">
                            <p class="checkout">Quantity: 1<br> Size: S <br>Price: ₹1299</p>
                        </div>
                    </div>
                </div>
            </div>
    
           <div class="jumbotron jumbotron-fluid">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col">
                            <h4>Men's White Tee</h4>
                            <img src="images/shopmen2.png" class="smallsize">
                        </div>
                        <div class="col justify-content-center">
                            <p class="checkout">Quantity: 3<br> Size: XL <br>Price: ₹3987</p>
                        </div>
                    </div>
                </div>
            </div>
    
           <div class="jumbotron jumbotron-fluid">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col">
                            <h4>Women's Black Tee</h4>
                            <img src="images/yellowblackgirl.png" class="smallsize">
                        </div>
                        <div class="col justify-content-center">
                            <p class="checkout">Quantity: 1<br> Size: M <br>Price: ₹1299</p>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        
        <div class="col-sm-12 col-md-4">
                  <div class="jumbotron jumbotron-fluid">
                <div class="container">
                    <div class="row align-items-center">
                    <h3>Summary</h3>
                    </div><br>
                    <h4>Subtotal: ₹6495</h4>
                    <h4>Shipping: FREE</h4><br>
                    <h4>Total: ₹6495</h4><br>
                    <a id="checkoutbutton" href="checkouthanks.html"><svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-cart" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm7 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2z"/>
</svg> Checkout</a>
                </div>
            </div>
        </div>    
    </div>
    </div>
 
    

	<!--footer-->
	<div class="container-fluid footer">
		<div class="row footerspace align-items-center">
			<p style="color: white; margin-bottom: -1%;">Created by Krishna, Sahithi, Brice & Kritin</p>
	</div>
<!-- Bootstrap link -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
    
</body>
</html>