<%@ page import="com.revshop.Entity.LoginEntity"%>
<!DOCTYPE html>
<html lang="en">
<head>
<style>
.section-divider {
	margin: 20px 0;
	font-weight: bold;
	text-align: center;
	color: #333;
}
</style>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Register</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;600&display=swap"
	rel="stylesheet">
<!-- Basic Page Needs -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="keywords" content="Furniture, Decor, Interior">
<meta name="description"
	content="Furnitica - Minimalist Furniture HTML Template">
<meta name="author" content="tivatheme">
<!-- Mobile Meta -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Poppins:400,500,600,700"
	rel="stylesheet">
<!-- Vendor CSS -->
<base href="${pageContext.request.contextPath}/">
<link rel="stylesheet"
	href="Static/libs/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="Static/libs/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet"
	href="Static/libs/nivo-slider/css/nivo-slider.css">
<link rel="stylesheet" href="Static/libs/nivo-slider/css/animate.css">
<link rel="stylesheet" href="Static/libs/nivo-slider/css/style.css">
<link rel="stylesheet"
	href="Static/libs/font-material/css/material-design-iconic-font.min.css">
<link rel="stylesheet" href="Static/libs/slider-range/css/jslider.css">
<link rel="stylesheet"
	href="Static/libs/owl-carousel/assets/owl.carousel.min.css">
<!-- Template CSS -->
<link rel="stylesheet" type="text/css" href="Static/css/style.css">
<link rel="stylesheet" type="text/css" href="Static/css/reponsive.css">
</head>
<body class="user-login blog">
	<header>
		<div class="header-top d-xs-none">
			<div class="container">
				<div class="row">
					<!-- logo -->
					<div class="col-sm-2 col-md-2 d-flex align-items-center">
						<div id="logo">
							<a href="index-2.html"> <img src="Static/img/home/logo.png"
								alt="logo" class="img-fluid">
							</a>
						</div>
					</div>
					<!-- menu -->
					<div
						class="col-sm-5 col-md-5 align-items-center justify-content-center navbar-expand-md main-menu">
						<div class="menu navbar collapse navbar-collapse">
							<ul class="menu-top navbar-nav">
								<li><a href="index.html" class="parent">Home</a></li>
								<li><a href="categories.html" class="parent">Categories</a>
									<div class="dropdown-menu">
										<ul>
											<li class="item"><a href="index-2.html"
												title="Electronics">Electronics</a></li>
											<li class="item"><a href="home2.html" title="Fashion">Fashion</a>
											</li>
											<li class="item"><a href="home3.html"
												title="Home Appliances">Home Appliances</a></li>
											<li class="item"><a href="home4.html" title="Books">Books</a>
											</li>
											<li class="item"><a href="home5.html" title="Sports">Sports</a>
											</li>
										</ul>
									</div></li>
								<li><a href="order-history.html" class="parent">Order
										History</a></li>
								<li><a href="favorites.html" class="parent">Favorites</a></li>
							</ul>
						</div>
					</div>
					<!-- search and account -->
					<div
						class="col-sm-5 col-md-5 d-flex align-items-center justify-content-end"
						id="search_widget">
						<div id="block_myaccount_infos" class="hidden-sm-down dropdown">
							<div class="myaccount-title">
								<a href="#acount" data-toggle="collapse" class="acount"> <i
									class="fa fa-user" aria-hidden="true"></i> <span>Account</span>
									<i class="fa fa-angle-down" aria-hidden="true"></i>
								</a>
							</div>
							<div id="acount" class="collapse">
								<div class="account-list-content">
									<div>
										<a class="login" href="user-acount.html" rel="nofollow"
											title="Log in to your customer account"> <i
											class="fa fa-cog"></i> <span>My Account</span></a>
									</div>
									<div>
										<a class="login" href="user-login.html" rel="nofollow"
											title="Log in to your customer account"> <i
											class="fa fa-sign-in"></i> <span>Sign in</span></a>
									</div>
									<div>
										<a class="register" href="user-register.html" rel="nofollow"
											title="Register Account"> <i class="fa fa-user"></i> <span>Register
												Account</span></a>
									</div>
									<div>
										<a class="check-out" href="product-checkout.html"
											rel="nofollow" title="Checkout"> <i class="fa fa-check"
											aria-hidden="true"></i> <span>Checkout</span></a>
									</div>
									<div class="link_wishlist">
										<a href="user-wishlist.html" title="My Wishlists"> <i
											class="fa fa-heart"></i> <span>My Wishlists</span></a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>
	<!-- main content -->
	<div class="main-content">
		<div class="wrap-banner">
			<!-- breadcrumb -->
			<nav class="breadcrumb-bg">
				<div class="container no-index">
					<div class="breadcrumb">
						<ol>
							<li><span>Home</span></li>
							<li><span>Register</span></li>
						</ol>
					</div>
				</div>
			</nav>
		</div>
		<!-- main -->
		<div id="wrapper-site">
			<div class="container">
				<div class="row">
					<div id="content-wrapper"
						class="col-xs-12 col-sm-12 col-md-12 col-lg-12 onecol">
						<div id="main">
							<div id="content" class="page-content">
								<div class="register-form text-center">
									<h1 class="text-center title-page">Details Registration</h1>
									<div id="error-message"
										style="color: red; font-weight: bold; text-align: center;">
										<%
										if (request.getAttribute("RegistererrorMessage") != null) {
										%>
										<%=request.getAttribute("RegistererrorMessage")%>
										<%
										}
										%>
									</div>
									<br>
									<form id="customer-form"
										action="/RevShopRevature/DetailRegistrationServlet"
										method="POST">
										<!-- Personal Details Section -->
										<div class="section-divider">------------------------Personal
											Details-------------------------</div>
										<div class="row">
											<div class="form-group col-md-6">
												<input class="form-control" name="firstName" type="text"
													placeholder="First Name">
											</div>
											<div class="form-group col-md-6">
												<input class="form-control" name="lastName" type="text"
													placeholder="Last Name">
											</div>
										</div>
										<div class="row">
											<div class="form-group col-md-6">
												<select class="form-control" name="gender">
													<option value="" disabled selected>Select Gender</option>
													<option value="male">Male</option>
													<option value="female">Female</option>
													<option value="other">Other</option>
												</select>
											</div>
											<div class="form-group col-md-6">
												<input class="form-control" name="mobile" type="text"
													placeholder="Mobile">
											</div>
										</div>
										<div class="row">
											<div class="form-group col-md-6">
												<input class="form-control" name="pincode" type="text"
													placeholder="Pincode">
											</div>
											<div class="form-group col-md-12">
												<textarea class="form-control" name="billingAddress"
													rows="4" placeholder="Billing Address"
													style="height: 100px;"></textarea>
											</div>
										</div>

										<%
										// Retrieve the LoginEntity object from the session
										LoginEntity user = (LoginEntity) session.getAttribute("user");

										// Add a hidden field to pass the userId or email for updating the user
										if (user != null) {
										%>
										<input type="hidden" name="userId"
											value="<%=user.getUserId()%>"> <input type="hidden"
											name="email" value="<%=user.getEmail()%>">
										<%
										}

										// Check if the user object is not null and if the role is "seller"
										if (user != null && "seller".equals(user.getRole())) {
										%>
										<!-- Company Details Section -->
										<div class="section-divider">------------------------Company
											Details------------------------</div>
										<div class="row">
											<div class="form-group col-md-6">
												<input class="form-control" name="companyName" type="text"
													placeholder="Company Name">
											</div>
											<div class="form-group col-md-6">
												<input class="form-control" name="gstNumber" type="text"
													placeholder="GST Number">
											</div>
										</div>
										<div class="row">
											<div class="form-group col-md-6">
												<input class="form-control" name="websiteUrl" type="text"
													placeholder="Website URL">
											</div>
											<div class="form-group col-md-6">
												<input class="form-control" name="panNumber" type="text"
													placeholder="PAN Number">
											</div>
										</div>

										<!-- Banking Details Section -->
										<div class="section-divider">------------------------Banking
											Details-------------------------</div>
										<div class="row">
											<div class="form-group col-md-6">
												<input class="form-control" name="bankAccountNo" type="text"
													placeholder="Bank Account Number">
											</div>
											<div class="form-group col-md-6">
												<input class="form-control" name="ifsc" type="text"
													placeholder="IFSC Code">
											</div>
										</div>
										<%
										}
										%>

										<div class="clearfix text-center">
											<button class="btn btn-primary" data-link-action="sign-in"
												type="submit">Submit Information</button>
										</div>
									</form>
									<!-- Optional CSS for better visual separation -->
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- footer -->
	<footer class="footer-one">
		<div class="inner-footer">
			<div class="container">
				<div class="footer-top col-lg-12 col-xs-12">
					<div class="row">
						<div class="nov-html col-lg-4 col-sm-12 col-xs-12">
							<div class="block">
								<div class="block-content">
									<p class="logo-footer">
										<img src="Static/img/home/logo.png" alt="img">
									</p>
									<p class="content-logo">Lorem ipsum dolor sit amet,
										consectetur adipiscing elit sed do eiusmod tempor incididunt
										ut labore et dolore magna aliqua. Ut enim ad minim</p>
								</div>
							</div>
						</div>
						<div class="nov-html col-lg-4 col-sm-6">
							<div class="block m-top">
								<div class="title-block">Contact Us</div>
								<div class="block-content">
									<div class="contact-us">
										<div class="title-content">
											<i class="fa fa-home" aria-hidden="true"></i> <span>Address:</span>
										</div>
										<div class="content-contact address-contact">
											<p>123 Suspendis matti, Visaosang Building VST District
												NY Accums, North American</p>
										</div>
									</div>
									<div class="contact-us">
										<div class="title-content">
											<i class="fa fa-envelope" aria-hidden="true"></i> <span>Email:</span>
										</div>
										<div class="content-contact mail-contact">
											<p>madhavlonkar2@gmail.com</p>
										</div>
									</div>
									<div class="contact-us">
										<div class="title-content">
											<i class="fa fa-phone" aria-hidden="true"></i> <span>Phone:</span>
										</div>
										<div class="content-contact phone-contact">
											<p>+919370548600</p>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="tiva-modules col-lg-4 col-md-6">
							<div class="block m-top1">
								<div class="block-content">
									<div class="social-content">
										<div class="title-block">Follow us on</div>
										<div id="social-block">
											<div class="social">
												<ul class="list-inline mb-0 justify-content-end">
													<li class="list-inline-item mb-0"><a href="#"
														target="_blank"> <i class="fa fa-facebook"></i></a></li>
													<li class="list-inline-item mb-0"><a href="#"
														target="_blank"> <i class="fa fa-twitter"></i></a></li>
													<li class="list-inline-item mb-0"><a href="#"
														target="_blank"> <i class="fa fa-google"></i></a></li>
													<li class="list-inline-item mb-0"><a href="#"
														target="_blank"> <i class="fa fa-instagram"></i></a></li>
												</ul>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="block m-top1">
								<div class="block-content">
									<div class="payment-content">
										<div class="title-block">Payment accept</div>
										<div class="payment-image">
											<img class="img-fluid" src="Static/img/home/payment.png"
												alt="img">
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="tiva-copyright">
			<div class="container">
				<div class="row">
					<div class="text-center col-lg-12">
						<span>Rev Shop</span>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- back to top -->
	<div class="back-to-top">
		<a href="#"> <i class="fa fa-long-arrow-up"></i></a>
	</div>
	<!-- Vendor JS -->
	<script src="Static/libs/jquery/jquery.min.js"></script>
	<script src="Static/libs/popper/popper.min.js"></script>
	<script src="Static/libs/bootstrap/js/bootstrap.min.js"></script>
	<script src="Static/libs/nivo-slider/js/jquery.nivo.slider.js"></script>
	<script src="Static/libs/owl-carousel/owl.carousel.min.js"></script>
	<script src="Static/libs/slider-range/js/tmpl.js"></script>
	<script src="Static/libs/slider-range/js/jquery.dependClass-0.1.js"></script>
	<script src="Static/libs/slider-range/js/draggable-0.1.js"></script>
	<script src="Static/libs/slider-range/js/jquery.slider.js"></script>
	<!-- Template JS -->
	<script src="Static/js/theme.js"></script>
</body>
</html>