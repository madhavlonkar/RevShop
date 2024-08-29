<%@ page import="java.util.List"%>
<%@ page import="com.revshop.Entity.CartEntity"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Add Product</title>
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
<style>
.logo {
	font-family: Arial, sans-serif; /* Or use a similar font */
	font-weight: 750; /* Extra bold */
	font-size: 24px; /* Adjust size as needed */
	color: #000000; /* Black color */
}
</style>
</head>

<body class="product-cart checkout-cart blog">
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
							<input type="hidden" name="category"> <input
								type="text" name="s" value="" placeholder="Search"
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
	<div class="main-content" id="cart">
		<!-- main -->
		<div id="wrapper-site">
			<!-- breadcrumb -->
			<nav class="breadcrumb-bg">
				<div class="container no-index">
					<div class="breadcrumb">
						<ol>
							<li><a href="#"> <span>Home</span></a></li>
							<li><a href="#"> <span>Cart</span></a></li>
							<!-- Display the selected category -->
						</ol>
					</div>
				</div>
			</nav>
			<div class="container">
				<div class="row">
					<div id="content-wrapper"
						class="col-xs-12 col-sm-12 col-md-12 col-lg-12 onecol">
						<section id="main">
							<div class="cart-grid row">
								<div class="col-md-9 col-xs-12 check-info">
									<h1 class="title-page">Shopping Cart</h1>
									<div class="cart-container">
										<div class="cart-overview js-cart">
											<ul class="cart-items">
												<%
												List<CartEntity> cartItems = (List<CartEntity>) request.getAttribute("cartItems");
												double grandTotal = 0;

												if (cartItems != null && !cartItems.isEmpty()) {
													for (CartEntity item : cartItems) {
														// Calculate the effective price after discount
														double priceAfterDiscount = item.getProductPrice() * (1 - item.getProductDiscount() / 100.0);
														// Calculate the total price for the current item
														double itemTotal = priceAfterDiscount * item.getQuantity();
														// Add to grand total
														grandTotal += itemTotal;
												%>
												<li class="cart-item">
													<div class="product-line-grid row justify-content-between">
														<!-- product left content: image -->
														<div class="product-line-grid-left col-md-2">
															<span class="product-image media-middle"> <a
																href="product-detail.html?productId=<%=item.getProductId()%>">
																	<img class="img-fluid" src="<%=item.getImgUrl()%>"
																	alt="<%=item.getProductName()%>">
															</a>
															</span>
														</div>
														<div class="product-line-grid-body col-md-6">
															<div class="product-line-info">
																<a class="label"
																	href="product-detail.html?productId=<%=item.getProductId()%>"
																	data-id_customization="0"> <%=item.getProductName()%>
																</a>
															</div>
															<div class="product-line-info product-price">
																<span class="value">RS <%=String.format("%.2f", item.getProductPrice())%></span>
															</div>
															<div class="product-line-info">
																<span class="label-atrr">Quantity:</span> <span
																	class="value"><%=item.getQuantity()%></span>
															</div>
															<div class="product-line-info">
																<span class="label-atrr">Discount:</span> <span
																	class="value"><%=item.getProductDiscount()%> %</span>
															</div>
														</div>
														<div
															class="product-line-grid-right text-center product-line-actions col-md-4">
															<div class="row">
																<div class="col-md-5 col qty">
																	<div class="label">Qty:</div>
																	<div class="quantity">
																		<form action="CartUpdateServlet" method="post">
																			<input type="hidden" name="productId"
																				value="<%=item.getProductId()%>" /> <input
																				type="hidden" name="userId"
																				value="<%=user.getUserId()%>" /> <input type="text"
																				name="qty" value="<%=item.getQuantity()%>"
																				class="input-group form-control" readonly> <span
																				class="input-group-btn-vertical">
																				<button
																					class="btn btn-touchspin js-touchspin bootstrap-touchspin-up"
																					type="submit" name="action" value="increase">
																					+</button>
																				<button
																					class="btn btn-touchspin js-touchspin bootstrap-touchspin-down"
																					type="submit" name="action" value="decrease">
																					-</button>
																			</span>
																		</form>
																	</div>
																</div>
																<div class="col-md-5 col price">
																	<div class="label">Total:</div>
																	<div class="product-price total">
																		Rs.<%=String.format("%.2f", itemTotal)%>
																	</div>
																</div>
																<div class="col-md-2 col text-xs-right align-self-end">
																	<div class="cart-line-product-actions">
																		<a class="remove-from-cart" rel="nofollow"
																			href="CartDeleteProductServlet?productId=<%=item.getProductId()%>&userId=<%=user.getUserId()%>"
																			data-link-action="delete-from-cart"> <i
																			class="fa fa-trash-o" aria-hidden="true"></i>
																		</a>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</li>
												<%
												}
												} else {
												%>
												<li class="cart-item">
													<div class="alert alert-warning">Your cart is empty.</div>
												</li>
												<%
												}
												%>
											</ul>
										</div>
									</div>
									<a href="CheckoutServlet"
										class="continue btn btn-primary pull-xs-right"> Continue </a>
								</div>
								<div class="cart-grid-right col-xs-12 col-lg-3">
									<div class="cart-summary">
										<div class="cart-detailed-totals">
											<div class="cart-summary-products">
												<div class="summary-label">
													There are
													<%=cartItems != null ? cartItems.size() : 0%>
													item(s) in your cart
												</div>
											</div>
											<div class="cart-summary-line" id="cart-subtotal-products">
												<span class="label js-subtotal">Total products:</span> <span
													class="value">RS. <%=String.format("%.2f", grandTotal)%></span>
											</div>
											<div class="cart-summary-line" id="cart-subtotal-shipping">
												<span class="label">Total Shipping:</span> <span
													class="value">Free</span>
												<div>
													<small class="value"></small>
												</div>
											</div>
											<div class="cart-summary-line cart-total">
												<span class="label">Total:</span> <span class="value">RS
													<%=String.format("%.2f", grandTotal)%> (tax incl.)
												</span>
											</div>
										</div>
									</div>
									<div id="block-reassurance">
										<ul>
											<li>
												<div class="block-reassurance-item">
													<img src="Static/img/product/check1.png"
														alt="Security policy (edit with Customer reassurance module)">
													<span>Security policy (edit with Customer
														reassurance module)</span>
												</div>
											</li>
											<li>
												<div class="block-reassurance-item">
													<img src="Static/img/product/check2.png"
														alt="Delivery policy (edit with Customer reassurance module)">
													<span>Delivery policy (edit with Customer
														reassurance module)</span>
												</div>
											</li>
											<li>
												<div class="block-reassurance-item">
													<img src="Static/img/product/check3.png"
														alt="Return policy (edit with Customer reassurance module)">
													<span>Return policy (edit with Customer reassurance
														module)</span>
												</div>
											</li>
										</ul>
									</div>
								</div>
							</div>
						</section>

					</div>
				</div>
			</div>
		</div>
	</div>

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
</body>
</html>