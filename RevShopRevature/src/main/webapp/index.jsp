<%@ page import="com.revshop.Entity.ProductEntity"%>
<%@ page import="java.util.List"%>
<%@ page import="jakarta.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Home Page</title>
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
.toast {
	visibility: hidden;
	min-width: 250px;
	margin-left: -125px;
	background-color: #333;
	color: #fff;
	text-align: center;
	border-radius: 2px;
	padding: 16px;
	position: fixed;
	z-index: 1;
	left: 50%;
	bottom: 30px;
	font-size: 17px;
}

.toast.show {
	visibility: visible;
	-webkit-animation: fadein 0.5s, fadeout 0.5s 2.5s;
	animation: fadein 0.5s, fadeout 0.5s 2.5s;
}

@
-webkit-keyframes fadein {from { bottom:0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@
keyframes fadein {from { bottom:0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@
-webkit-keyframes fadeout {from { bottom:30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}

}
@
keyframes fadeout {from { bottom:30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}

}

/* Container that holds each product */
.product-container .thumbnail-container {
	width: 100%;
	height: 200px;
	overflow: hidden;
	display: flex;
	align-items: center;
	justify-content: center;
	border: 1px solid #ddd;
	background-color: #f8f8f8;
}

/* The actual image inside each product */
.product-container .thumbnail-container img {
	max-width: 80%;
	max-height: 100%;
	width: auto;
	height: auto;
	display: block;
	margin: 0 auto;
}

/* Ensure all product containers have consistent height */
.product-miniature {
	min-height: 350px;
	margin-bottom: 20px;
}

.img-fluid {
	max-width: 50%;
}

.logo {
	font-family: Arial, sans-serif; /* Or use a similar font */
	font-weight: 750; /* Extra bold */
	font-size: 24px; /* Adjust size as needed */
	color: #000000; /* Black color */
}
</style>
</head>

<body id="product-sidebar-left" class="product-grid-sidebar-left">
	<div id="toast" class="toast"></div>
	<header>
		<%
		HttpSession s = request.getSession(false); // Use false to prevent creating a new session if one doesn't exist
		com.revshop.Entity.LoginEntity user = (com.revshop.Entity.LoginEntity) (s != null ? s.getAttribute("user") : null);
		String selectedCategory = (String) request.getAttribute("selectedCategory");
		if (selectedCategory == null || selectedCategory.isEmpty()) {
			selectedCategory = "Electronics"; // Default category
		}
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
												href="HomeServlet?category=HomeAppliances"
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
							<input type="hidden" name="category"
								value="<%=selectedCategory%>"> <input type="text"
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
										<a href="LoginAndRegistration/user-login.jsp" title="Log Out"> <i
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
		<div id="wrapper-site">
			<div id="content-wrapper" class="full-width">
				<div id="main">
					<div class="page-home">
						<!-- breadcrumb -->
						<nav class="breadcrumb-bg">
							<div class="container no-index">
								<div class="breadcrumb">
									<ol>
										<li><a href="#"> <span>Home</span></a></li>
										<li><a href="#"> <span><%=selectedCategory%></span></a></li>
										<!-- Display the selected category -->
									</ol>
								</div>
							</div>
						</nav>

						<div class="container">
							<div class="content">
								<div class="row">
									<div
										class="sidebar-3 sidebar-collection col-lg-3 col-md-4 col-sm-4">
										<!-- category menu -->
										<div class="sidebar-block">
											<div class="title-block">Categories</div>
											<div class="block-content">
												<div class="cateTitle hasSubCategory open level1">
													<a class="cateItem" href="HomeServlet?category=Electronics">Electronics</a>
												</div>
												<div class="cateTitle hasSubCategory open level1">
													<a class="cateItem" href="HomeServlet?category=Fashion">Fashion</a>
												</div>
												<div class="cateTitle hasSubCategory open level1">
													<a class="cateItem"
														href="HomeServlet?category=HomeAppliances">Home
														Appliances</a>
												</div>
												<div class="cateTitle hasSubCategory open level1">
													<a class="cateItem" href="HomeServlet?category=Books">Books</a>
												</div>
												<div class="cateTitle hasSubCategory open level1">
													<a class="cateItem" href="HomeServlet?category=Sports">Sports</a>
												</div>
											</div>
										</div>
									</div>

									<%
									List<ProductEntity> products = (List<ProductEntity>) request.getAttribute("products");
									%>
									<div class="col-sm-8 col-lg-9 col-md-8 product-container">
										<h1>All Products</h1>
										<div class="js-product-list-top first nav-top">
											<div class="d-flex justify-content-around row">
												<div class="col col-xs-12">
													<ul class="nav nav-tabs">
														<li><a href="#grid" data-toggle="tab"
															class="active show fa fa-th-large"></a></li>
														<li><a href="#list" data-toggle="tab"
															class="fa fa-list-ul"></a></li>
													</ul>
												</div>
												<div class="col col-xs-12">
													<div
														class="d-flex sort-by-row justify-content-lg-end justify-content-md-end">
														<div class="products-sort-order dropdown"></div>
													</div>
												</div>
											</div>
										</div>
										<div class="tab-content product-items">
											<div id="grid" class="related tab-pane fade in active show">
												<div class="row">
													<%
													for (ProductEntity product : products) {
													%>
													<div class="item text-center col-md-4">
														<div
															class="product-miniature js-product-miniature item-one first-item">
															<div class="thumbnail-container border">
																<a
																	href="ProductDetailsServlet?productId=<%=product.getProductId()%>">
																	<img class="img-fluid"
																	src="<%=product.getProductImage()%>"
																	alt="<%=product.getProductName()%>">
																</a>
															</div>
															<div class="product-description">
																<div class="product-groups">
																	<div class="product-title">
																		<a
																			href="ProductDetailsServlet?productId=<%=product.getProductId()%>"><%=product.getProductName()%></a>
																	</div>
																	<div class="product-group-price">
																		<div class="product-price-and-shipping">
																			<span class="price">RS <%=product.getProductPrice()%></span>
																		</div>
																	</div>
																</div>
																<div
																	class="product-buttons d-flex justify-content-center">
																	<%
																	if (user != null) {
																	%>
																	<form action="AddToCartServlet" method="post"
																		class="formAddToCart">
																		<input type="hidden" name="productId"
																			value="<%=product.getProductId()%>"> <input
																			type="hidden" name="userId"
																			value="<%=user.getUserId()%>">
																		<button class="add-to-cart" type="submit">
																			<i class="fa fa-shopping-cart" aria-hidden="true"></i>
																		</button>
																	</form>
																	<a class="addToWishlist"
																		href="FavriouteAddServlet?productId=<%=product.getProductId()%>&userId=<%=user.getUserId()%>"
																		data-rel="<%=product.getProductId()%>"> <i
																		class="fa fa-heart" aria-hidden="true"></i>
																	</a>
																	<%
																	} else {
																	%>
																	<a class="addToWishlist"
																		href="LoginAndRegistration/user-login.jsp"
																		data-rel="<%=product.getProductId()%>"> <i
																		class="fa fa-heart" aria-hidden="true"></i>
																	</a>
																	<%
																	}
																	%>
																	<a
																		href="ProductDetailsServlet?productId=<%=product.getProductId()%>"
																		class="quick-view hidden-sm-down"> <i
																		class="fa fa-eye" aria-hidden="true"></i>
																	</a>
																</div>
															</div>
														</div>
													</div>
													<%
													}
													%>
												</div>
											</div>
											<div id="list" class="related tab-pane fade">
												<div class="row">
													<%
													for (ProductEntity product : products) {
													%>
													<div class="item col-md-12">
														<div
															class="product-miniature js-product-miniature item-one first-item">
															<div class="row">
																<div class="col-md-4">
																	<div class="thumbnail-container border">
																		<a
																			href="ProductDetailsServlet?productId=<%=product.getProductId()%>">
																			<img class="img-fluid"
																			src="<%=product.getProductImage()%>"
																			alt="<%=product.getProductName()%>">
																		</a>
																	</div>
																</div>
																<div class="col-md-8">
																	<div class="product-description">
																		<div class="product-groups">
																			<div class="product-title">
																				<a
																					href="ProductDetailsServlet?productId=<%=product.getProductId()%>"><%=product.getProductName()%></a>
																				<span class="info-stock"> <i
																					class="fa fa-check-square-o" aria-hidden="true"></i>
																					In Stock
																				</span>
																			</div>
																			<div class="product-group-price">
																				<div class="product-price-and-shipping">
																					<span class="price">RS <%=product.getProductPrice()%></span>
																				</div>
																			</div>
																			<div class="description">
																				<%=product.getProductDescription()%>
																			</div>
																		</div>
																		<div class="product-buttons d-flex">
																			<%
																			if (user != null) {
																			%>
																			<form action="AddToCartServlet" method="post"
																				class="formAddToCart">
																				<input type="hidden" name="productId"
																					value="<%=product.getProductId()%>"> <input
																					type="hidden" name="userId"
																					value="<%=user.getUserId()%>">
																				<button class="add-to-cart" type="submit">
																					<i class="fa fa-shopping-cart" aria-hidden="true"></i>
																					Add to cart
																				</button>
																			</form>
																			<a class="addToWishlist"
																				href="FavriouteAddServlet?productId=<%=product.getProductId()%>&userId=<%=user.getUserId()%>"
																				data-rel="<%=product.getProductId()%>"> <i
																				class="fa fa-heart" aria-hidden="true"></i>
																			</a>
																			<%
																			} else {
																			%>
																			<a class="addToWishlist"
																				href="LoginAndRegistration/user-login.jsp"
																				data-rel="<%=product.getProductId()%>"> <i
																				class="fa fa-heart" aria-hidden="true"></i>
																			</a>
																			<%
																			}
																			%>
																			<a
																				href="ProductDetailsServlet?productId=<%=product.getProductId()%>"
																				class="quick-view hidden-sm-down"> <i
																				class="fa fa-eye" aria-hidden="true"></i>
																			</a>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
													<%
													}
													%>
												</div>
											</div>
										</div>

										<!-- pagination -->
										<div class="pagination">
											<div class="js-product-list-top">
												<div class="d-flex justify-content-around row">
													<div class="showing col col-xs-12">
														<span>SHOWING 1-3 OF 3 ITEM(S)</span>
													</div>
													<div class="page-list col col-xs-12">
														<ul>
															<li><a rel="prev" href="#"
																class="previous disabled js-search-link"> Previous </a></li>
															<li class="current active"><a rel="nofollow"
																href="#" class="disabled js-search-link"> 1 </a></li>
															<li><a rel="nofollow" href="#"
																class="disabled js-search-link"> 2 </a></li>
															<li><a rel="nofollow" href="#"
																class="disabled js-search-link"> 3 </a></li>
															<li><a rel="next" href="#"
																class="next disabled js-search-link"> Next </a></li>
														</ul>
													</div>
												</div>
											</div>
										</div>
									</div>
									<!-- end col-md-9-1 -->
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
		<a href="#"> <i class="fa fa-long-arrow-up"></i>
		</a>
	</div>

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
