<!DOCTYPE html>
<html lang="en">

<head>

    <title>My Profile</title>

    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap link -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
        integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <link rel="stylesheet" href="main.css">
    <script src="https://kit.fontawesome.com/72a36f73ea.js" crossorigin="anonymous"></script>

    <style>
        .nav-link:hover {
            background-color: #e9caff;
        }

        .shopbtn2:before {
            background: #5cd65c;
        }

        h1 {
            padding-top: 50px;
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

        .submitbtn {
            background-color: black;
            border: 0px;
        }

        .submitbtn:hover {
            transition-duration: 0.3s;
            background-color: #e9caff;
            color: black;
        }

        .createNew {
            float: right;
            margin-right: 20%;
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
                <a class="nav-link" href="index.html">Home </a> <a class="nav-link" href="signup.html">Register</a>
                <a class="nav-link" href="mycart.html">My Cart</a>
                <!-- move the shopping bag icon next to My Cart -->
                <a class="nav-link active" href="myprofile.html">
                    My Profile<span class="sr-only">(current)</span>
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

    <div>
        <div class="container">
            <div class="row">
                <div class="col-md-8">
                    <h1>Your Profile</h1>
                    <h3>Your postings:</h3>
                </div>
                <div class="col-md-4 align-self-center justify-content-center">
                    <button type="submit" class="btn btn-primary submitbtn">Create New</button>
                </div>
            </div>
        </div><br>
    </div>


    <div class="container">
        <div class="row">
            <div class="col-sm-12 col-md-10">
                <div class="jumbotron jumbotron-fluid">
                    <div class="container">
                        <div class="row align-items-center">
                            <div class="col">
                                <h4>Men's Black Tee</h4>
                                <img src="images/shopmen.JPG" class="smallsize">
                            </div>
                            <div class="col justify-content-center">
                                <p class="checkout">Placeholder for item description</p>
                            </div>
                            <div class="col">
                                <p>Placeholder for item's tag</p>
                                <p>Placeholder for item's price</p>
                            </div>
                            <div class="col">
                                <button type="submit" class="btn btn-primary submitbtn">Edit</button>
                                <button type="submit" class="btn btn-primary submitbtn">Remove</button>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="jumbotron jumbotron-fluid">
                    <div class="container">
                        <div class="row align-items-center">
                            <div class="col">
                                <h4>Men's Black Tee</h4>
                                <img src="images/shopmen.JPG" class="smallsize">
                            </div>
                            <div class="col justify-content-center">
                                <p class="checkout">Placeholder for item description</p>
                            </div>
                            <div class="col">
                                <p>Placeholder for item's tag</p>
                                <p>Placeholder for item's price</p>
                            </div>
                            <div class="col">
                                <button type="submit" class="btn btn-primary submitbtn">Edit</button>
                                <button type="submit" class="btn btn-primary submitbtn">Remove</button>
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
                                <p class="checkout">Placeholder for item description</p>
                            </div>
                            <div class="col">
                                <p>Placeholder for item's tag</p>
                                <p>Placeholder for item's price</p>
                            </div>
                            <div class="col">
                                <button type="submit" class="btn btn-primary submitbtn">Edit</button>
                                <button type="submit" class="btn btn-primary submitbtn">Remove</button>
                            </div>
                        </div>
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
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
            integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
            crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
            crossorigin="anonymous"></script>

</body>

</html>