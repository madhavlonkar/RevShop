<%@ page import="java.util.List"%>
<%@ page import="com.revshop.Entity.CartEntity"%>
<%@ page import="com.revshop.Entity.UserEntity"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%
UserEntity userDetails = (UserEntity) request.getAttribute("userDetails");
List<CartEntity> cartItems = (List<CartEntity>) request.getAttribute("cartItems");

double totalAmount = 0;
for (CartEntity item : cartItems) {
	double priceAfterDiscount = item.getProductPrice() * (1 - item.getProductDiscount() / 100.0);
	double itemTotal = priceAfterDiscount * item.getQuantity();
	totalAmount += itemTotal;
}
%>
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

.product-summary {
	margin: 20px 0;
	padding: 10px;
	border: 1px solid #ddd;
	border-radius: 5px;
}

.product-summary h4 {
	font-weight: bold;
	margin-bottom: 10px;
}

.product-item {
	display: flex;
	justify-content: space-between;
	margin-bottom: 10px;
}

.product-item span {
	display: inline-block;
	margin-right: 10px;
}

.product-total {
	font-weight: bold;
}

.checkout-container {
	display: flex;
	justify-content: space-between;
}

.checkout-form {
	flex: 0 0 65%; /* Adjusts the width of the details section */
	margin-right: 20px;
}

.order-summary {
	flex: 0 0 30%; /* Adjusts the width of the order summary */
}

.checkout-form form {
	text-align: left;
}

.checkout-form .form-group {
	text-align: left;
	margin-bottom: 15px;
}

.checkout-form .form-control {
	width: 100%;
	text-align: left;
	margin: 0;
	padding: 10px;
	box-sizing: border-box;
}

.checkout-form .btn-primary {
	width: 100%;
	padding: 10px;
	font-size: 16px;
	font-weight: bold;
}

.product-item {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 10px;
}

.product-item span {
	flex: 1; /* Makes each span take up an equal amount of space */
	text-align: left; /* Aligns text to the left */
}

.product-item span:nth-child(2) {
	text-align: center; /* Centers the quantity */
	flex: 0 0 50px; /* Fixed width for quantity */
}

.product-item span:nth-child(3) {
	text-align: right; /* Aligns the total price to the right */
	flex: 0 0 100px; /* Fixed width for total price */
}
.logo {
	font-family: Arial, sans-serif; /* Or use a similar font */
	font-weight: 750; /* Extra bold */
	font-size: 24px; /* Adjust size as needed */
	color: #000000; /* Black color */
}
</style>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Checkout</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;600&display=swap"
	rel="stylesheet">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="keywords" content="Furniture, Decor, Interior">
<meta name="description"
	content="Furnitica - Minimalist Furniture HTML Template">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
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
<link rel="stylesheet" type="text/css" href="Static/css/style.css">
<link rel="stylesheet" type="text/css" href="Static/css/reponsive.css">
</head>
<body class="user-login blog">
	<header>
		<%
		HttpSession s = request.getSession(false); // Use false to prevent creating a new session if one doesn't exist
		com.revshop.Entity.LoginEntity user = (com.revshop.Entity.LoginEntity) (s != null ? s.getAttribute("user") : null);
		%>
		<div class="header-top d-xs-none">
			<div class="container">
				<div class="row">
					<!-- logo -->
					<div class="col-sm-2 col-md-2 d-flex align-items-center">
						<div id="logo">
							<a href="HomeServlet?category=Electronics"> <span
								class="logo"> RevShop </span>
							</a>
						</div>
					</div>
					<!-- menu -->
					<div
						class="col-sm-5 col-md-5 align-items-center justify-content-center navbar-expand-md main-menu">
						<div class="menu navbar collapse navbar-collapse">
							<ul class="menu-top navbar-nav">
								<li><a href="HomeServlet?category=Electronics"
									class="parent">Home</a></li>
								<li><a href="HomeServlet?category=Electronics"
									class="parent">Categories</a>
									<div class="dropdown-menu">
										<ul>
											<li class="item"><a
												href="HomeServlet?category=Electronics" title="Electronics">Electronics</a></li>
											<li class="item"><a href="HomeServlet?category=Fashion"
												title="Fashion">Fashion</a></li>
											<li class="item"><a
												href="HomeServlet?category=Home Appliances"
												title="Home Appliances">Home Appliances</a></li>
											<li class="item"><a href="HomeServlet?category=Books"
												title="Books">Books</a></li>
											<li class="item"><a href="HomeServlet?category=Sports"
												title="Sports">Sports</a></li>
										</ul>
									</div></li>
								<li><a href="OrderServletMain" class="parent">Order
										History</a></li>
								<li><a href="FavriouteServletMain" class="parent">Favorites</a></li>
							</ul>
						</div>
					</div>
					<!-- search and account -->
					<div
						class="col-sm-5 col-md-5 d-flex align-items-center justify-content-end"
						id="search_widget">
						<form method="get" action="HomeServlet">
							<input type="hidden" name="category"> <input type="text"
								name="s" value="" placeholder="Search"
								class="ui-autocomplete-input" autocomplete="off">
							<button type="submit">
								<i class="fa fa-search"></i>
							</button>
						</form>
						<div id="block_myaccount_infos" class="hidden-sm-down dropdown">
							<div class="myaccount-title">
								<a href="#acount" data-toggle="collapse" class="acount"> <i
									class="fa fa-user" aria-hidden="true"></i> <span>Account</span>
									<i class="fa fa-angle-down" aria-hidden="true"></i>
								</a>
							</div>
							<div id="acount" class="collapse">
								<div class="account-list-content">
									<%
									if (user != null) {
									%>
									<!-- Check if the user is logged in -->
									<!-- My Account Link -->
									<div>
										<a class="login" href="UserAccountServlet" rel="nofollow"
											title="Log in to your customer account"> <i
											class="fa fa-cog"></i> <span>My Account</span>
										</a>
									</div>
									<!-- Checkout Link -->
									<div>
										<a class="check-out" href="CheckoutServlet" rel="nofollow"
											title="Checkout"> <i class="fa fa-check"
											aria-hidden="true"></i> <span>Checkout</span>
										</a>
									</div>
									<!-- Seller Dashboard Link (only for sellers) -->
									<%
									if ("seller".equals(user.getRole())) {
									%>
									<!-- Check if the user role is 'seller' -->
									<div>
										<a class="seller-dashboard" href="ProductMaintenanceServlet"
											rel="nofollow" title="Seller Dashboard"> <i
											class="fa fa-tachometer-alt"></i> <span>Seller
												Dashboard</span>
										</a>
									</div>
									<%
									}
									%>
									<!-- Log Out Link -->
									<div class="link_wishlist">
										<a href="LogoutServlet" title="Log Out"> <i
											class="fa fa-heart"></i> <span>Log Out</span>
										</a>
									</div>
									<%
									} else {
									%>
									<!-- If the user is not logged in -->
									<!-- Sign In Link -->
									<div>
										<a class="login" href="LoginAndRegistration/user-login.jsp"
											rel="nofollow" title="Log in to your customer account"> <i
											class="fa fa-sign-in"></i> <span>Sign in</span>
										</a>
									</div>
									<!-- Register Link -->
									<div>
										<a class="register"
											href="LoginAndRegistration/user-register.jsp" rel="nofollow"
											title="Register Account"> <i class="fa fa-user"></i> <span>Register
												Account</span>
										</a>
									</div>
									<%
									}
									%>
								</div>
							</div>
						</div>
						<%
						if (user != null) {
						%>
						<div class="desktop_cart">
							<div class="blockcart block-cart cart-preview tiva-toggle">
								<div class="header-cart tiva-toggle-btn">
									<span class="cart-products-count">1</span> <a
										href="CartServlet?userId=<%=user.getUserId()%>"> <i
										class="fa fa-shopping-cart" aria-hidden="true"></i>
									</a>
								</div>
							</div>
						</div>
						<%
						} else {
						%>
						<div class="desktop_cart">
							<div class="blockcart block-cart cart-preview tiva-toggle">
								<div class="header-cart tiva-toggle-btn">
									<span class="cart-products-count">1</span> <a
										href="LoginAndRegistration/user-login.jsp"> <i
										class="fa fa-shopping-cart" aria-hidden="true"></i>
									</a>
								</div>
							</div>
						</div>
						<%
						}
						%>
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
							<li><a href="#"> <span>Home</span></a></li>
							<li><a href="#"> <span>Checkout</span></a></li>
							<!-- Display the selected category -->
						</ol>
					</div>
				</div>
			</nav>
		</div>
		<!-- main -->
		<div id="wrapper-site">
			<div>
				<div class="row">
					<div id="content-wrapper">
						<div id="main">
							<div id="content" class="page-content">
								<div class="checkout-form">
									<h1 class="text-center title-page">Checkout</h1>
									<div id="error-message"
										style="color: red; font-weight: bold; text-align: center;">
										<!-- Error messages will appear here -->
									</div>
									<br>
									<div class="order-summary">
										<div class="section-divider">Order Summary</div>
										<div class="product-summary">
											<h4>Products</h4>
											<%
											for (CartEntity item : cartItems) {
												double priceAfterDiscount = item.getProductPrice() * (1 - item.getProductDiscount() / 100.0);
												double itemTotal = priceAfterDiscount * item.getQuantity();
											%>
											<div class="product-item">
												<span><%=item.getProductName()%></span> <span>X <%=item.getQuantity()%></span>
												<span class="product-total">Rs. <%=String.format("%.2f", itemTotal)%></span>
											</div>
											<%
											}
											%>
											<div class="product-item">
												<strong>Total Amount:</strong> <strong class="product-total">Rs.
													<%=String.format("%.2f", totalAmount)%></strong>
											</div>
										</div>
									</div>
									<form id="checkout-form" action="CheckoutServlet" method="POST">
										<!-- Personal Details Section -->
										<div class="section-divider">Personal Details</div>
										<div class="row">
											<div class="form-group col-md-6">
												<input class="form-control" name="firstName" type="text"
													placeholder="First Name"
													value="<%=userDetails.getFirstName()%>" readonly>
											</div>
											<div class="form-group col-md-6">
												<input class="form-control" name="lastName" type="text"
													placeholder="Last Name"
													value="<%=userDetails.getLastName()%>" readonly>
											</div>
										</div>
										<div class="row">
											<div class="form-group col-md-6">
												<input class="form-control" name="gender" type="text"
													placeholder="Gender" value="<%=userDetails.getGender()%>"
													readonly>
											</div>
											<div class="form-group col-md-6">
												<input class="form-control" name="mobile" type="text"
													placeholder="Mobile" value="<%=userDetails.getMobile()%>"
													readonly>
											</div>
										</div>
										<div class="row">
											<div class="form-group col-md-12">
												<input class="form-control" name="email" type="email"
													placeholder="Email" value="<%=userDetails.getEmail()%>"
													readonly>
											</div>
										</div>

										<!-- Shipping Address Section -->
										<div class="section-divider">Shipping Address</div>
										<div class="row">
											<div class="form-group col-md-6">
												<input class="form-control" name="address" type="text"
													placeholder="Address">
											</div>
											<div class="form-group col-md-6">
												<input class="form-control" name="city" type="text"
													placeholder="City">
											</div>
										</div>
										<div class="row">
											<div class="form-group col-md-6">
												<input class="form-control" name="state" type="text"
													placeholder="State">
											</div>
											<div class="form-group col-md-6">
												<input class="form-control" name="zip" type="text"
													placeholder="Zip Code">
											</div>
										</div>

										<!-- Razorpay integration -->
										<input type="hidden" name="payment_id" id="payment_id"
											value="">
										<div class="clearfix text-center">
											<button type="button" class="btn btn-primary"
												onclick="payNow()">Pay Now</button>
										</div>
									</form>
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
									<p class="logo-footer"
										style="font-size: 32px; font-weight: bold; color: #000;">
										RevShop</p>
									<p class="content-logo">RevShop is an e-commerce platform
										developed under the Revature training program. The project is
										built using JDBC, Servlets, and JSP to deliver a robust and
										scalable shopping experience. Our goal is to provide a
										user-friendly interface and a seamless shopping journey.</p>
									<p class="content-logo">This project showcases the
										practical application of Java EE technologies, focusing on
										building a dynamic, database-driven website.</p>
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
											<p>A.p: Korhale Bk, Tal-Baramati, Dist-Pune, 412103</p>
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
											<p>+91 9370548600</p>
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
													<li class="list-inline-item mb-0"><a
														href="https://www.instagram.com/maddy_8600/"
														target="_blank"> <i class="fa fa-facebook"></i>
													</a></li>
													<li class="list-inline-item mb-0"><a
														href="https://www.instagram.com/maddy_8600/"
														target="_blank"> <i class="fa fa-twitter"></i>
													</a></li>
													<li class="list-inline-item mb-0"><a
														href="https://www.instagram.com/maddy_8600/"
														target="_blank"> <i class="fa fa-google"></i>
													</a></li>
													<li class="list-inline-item mb-0"><a
														href="https://www.instagram.com/maddy_8600/"
														target="_blank"> <i class="fa fa-instagram"></i>
													</a></li>
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

	<!-- Razorpay integration -->
	<script src="https://checkout.razorpay.com/v1/checkout.js"></script>
	<script>
        function payNow() {
        	var amountInPaise = Math.round(<%=totalAmount * 100%>);
            var options = {
                "key": "rzp_test_wquKp1Dkyy2Nck", // Enter the Key ID generated from the Dashboard
                "amount": amountInPaise, // Amount is in paise (multiply by 100)
                "currency": "INR",
                "name": "Rev Shop",
                "description": "Test Transaction",
                "image": "https://example.com/your_logo",
                "handler": function (response) {
                    alert("Payment successful!");
                    var payment_id = response.razorpay_payment_id;

                    // Submit the payment ID to the backend to confirm the payment and save the order
                    document.getElementById('payment_id').value = payment_id;
                    document.getElementById('checkout-form').submit();
                },
                "prefill": {
                    "name": "<%=userDetails.getFirstName() + ' ' + userDetails.getLastName()%>",
                    "email": "<%=userDetails.getEmail()%>",
                    "contact": "<%=userDetails.getMobile()%>"
                },
                "notes": {
                    "address": "<%=userDetails.getShippingAddress()%>
		"
				},
				"theme" : {
					"color" : "#3399cc"
				}
			};

			var rzp1 = new Razorpay(options);
			rzp1.open();
		}
	</script>
</body>
</html>
