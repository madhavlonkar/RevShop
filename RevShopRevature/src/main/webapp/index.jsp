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
-webkit-keyframes fadein {
	from {bottom: 0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@
keyframes fadein {
	from {bottom: 0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@
-webkit-keyframes fadeout {
	from {bottom: 30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}

}
@
keyframes fadeout {
	from {bottom: 30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}
}
</style>
<style>

/* Container that holds each product */
.product-container .thumbnail-container {
	width: 100%;
	height: 200px; /* Fixed height for consistency */
	overflow: hidden;
	display: flex;
	align-items: center;
	justify-content: center;
	border: 1px solid #ddd; /* Optional: Add a border for consistency */
	background-color: #f8f8f8;
	/* Optional: Add a background color if the image doesn't fill the container */
}

/* The actual image inside each product */
.product-container .thumbnail-container img {
	max-width: 80%;
	max-height: 100%;
	width: auto;
	height: auto;
	display: block;
	margin: 0 auto;
	/* Ensures the entire image fits within the container and is centered */
}

/* Ensure all product containers have consistent height */
.product-miniature {
	min-height: 350px; /* Adjust based on your design */
	margin-bottom: 20px;
}

.img-fluid {
	max-width: 50%;
}
</style>

</head>

<body id="product-sidebar-left" class="product-grid-sidebar-left">
	<div id="toast" class="toast"></div>
	<header>
		<%
		// Fetch the user object from the session
		HttpSession s = request.getSession();
		com.revshop.Entity.LoginEntity user = (com.revshop.Entity.LoginEntity) s.getAttribute("user");
		%>
		<!-- header left mobie -->
		<!-- header desktop -->
		<div class="header-top d-xs-none ">
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
								<li><a href="HomeServlet" class="parent">Home</a></li>
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
								<li><a href="FavriouteServletMain" class="parent">Favorites</a></li>
							</ul>
						</div>
					</div>

					<!-- search and acount -->
					<div
						class="col-sm-5 col-md-5 d-flex align-items-center justify-content-end"
						id="search_widget">
						<form method="get" action="#">

							<span role="status" aria-live="polite"
								class="ui-helper-hidden-accessible"></span> <input type="text"
								name="s" value="" placeholder="Search"
								class="ui-autocomplete-input" autocomplete="off">
							<button type="submit">
								<i class="fa fa-search"></i>
							</button>
						</form>

						<div id="block_myaccount_infos" class="hidden-sm-down dropdown">
							<div class="myaccount-title ">
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
											class="fa fa-cog"></i> <span>My Account</span>
										</a>
									</div>
									<div>
										<a class="login" href="user-login.html" rel="nofollow"
											title="Log in to your customer account"> <i
											class="fa fa-sign-in"></i> <span>Sign in</span>
										</a>
									</div>
									<div>
										<a class="register" href="user-register.html" rel="nofollow"
											title="Register Account"> <i class="fa fa-user"></i> <span>Register
												Account</span>
										</a>
									</div>
									<div>
										<a class="check-out" href="product-checkout.html"
											rel="nofollow" title="Checkout"> <i class="fa fa-check"
											aria-hidden="true"></i> <span>Checkout</span>
										</a>
									</div>
									<div class="link_wishlist">
										<a href="user-wishlist.html" title="My Wishlists"> <i
											class="fa fa-heart"></i> <span>My Wishlists</span>
										</a>
									</div>


								</div>
							</div>
						</div>
						<%
						if (user != null) {
							// Show add to cart button only if user is logged in
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
										<li><a href="#"> <span>Welcome</span>
										</a></li>
										<li><a href="#"> <span>Madhav Lonkar</span>
										</a></li>

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
													<span class="arrow collapsed collapse-icons"
														data-toggle="collapse" data-target="#livingroom"
														aria-expanded="false" role="status"> <i
														class="zmdi zmdi-minus"></i> <i class="zmdi zmdi-plus"></i>
													</span> <a class="cateItem" href="#">Electronics</a>
													<div class="subCategory collapse" id="livingroom"
														aria-expanded="true" role="status"></div>
												</div>
												<div class="cateTitle hasSubCategory open level1">
													<span class="arrow collapsed collapse-icons"
														data-toggle="collapse" data-target="#bathroom"
														aria-expanded="false" role="status"> <i
														class="zmdi zmdi-minus"></i> <i class="zmdi zmdi-plus"></i>
													</span> <a class="cateItem" href="#">Fashion</a>
												</div>
												<div class="cateTitle hasSubCategory open level1">
													<span class="arrow collapsed collapse-icons"
														data-toggle="collapse" data-target="#diningroom"
														aria-expanded="false" role="status"> <i
														class="zmdi zmdi-minus"></i> <i class="zmdi zmdi-plus"></i>
													</span> <a class="cateItem" href="#">Home Appliances</a>
												</div>
												<div class="cateTitle hasSubCategory open level1">
													<span class="arrow collapsed collapse-icons"
														data-toggle="collapse" data-target="#bedroom"
														aria-expanded="false" role="status"> <i
														class="zmdi zmdi-minus"></i> <i class="zmdi zmdi-plus"></i>
													</span> <a class="cateItem" href="#">Books</a>
												</div>
												<div class="cateTitle hasSubCategory open level1">
													<span class="arrow collapsed collapse-icons"
														data-toggle="collapse" data-target="#kitchen"
														aria-expanded="false" role="status"> <i
														class="zmdi zmdi-minus"></i> <i class="zmdi zmdi-plus"></i>
													</span> <a class="cateItem" href="#">Sports</a>
												</div>

											</div>
										</div>

										<!-- best seller -->


										<!-- product tag -->

									</div>

									<%
									// Retrieve the list of products from the request scope
									List<ProductEntity> products = (List<ProductEntity>) request.getAttribute("products");
									%>
									<div class="col-sm-8 col-lg-9 col-md-8 product-container">
										<h1>All Products</h1>
										<div class="js-product-list-top firt nav-top">
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
														<div class="products-sort-order dropdown">
															<select class="select-title">
																<option value="">Sort by</option>
																<option value="name-asc">Name, A to Z</option>
																<option value="name-desc">Name, Z to A</option>
																<option value="price-asc">Price, low to high</option>
																<option value="price-desc">Price, high to low</option>
															</select>
														</div>
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
																	<div class="rating">
																		<div class="star-content">
																			<div class="star">
																				<i class="fa fa-star" aria-hidden="true"></i>
																			</div>
																			<div class="star">
																				<i class="fa fa-star" aria-hidden="true"></i>
																			</div>
																			<div class="star">
																				<i class="fa fa-star" aria-hidden="true"></i>
																			</div>
																			<div class="star">
																				<i class="fa fa-star" aria-hidden="true"></i>
																			</div>
																			<div class="star">
																				<i class="fa fa-star" aria-hidden="true"></i>
																			</div>
																		</div>
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
																		// Show add to cart button only if user is logged in
																	%>
																	<!-- Update the form to use AJAX -->
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
																	// Show a login prompt or disable button if not logged in
																	%>
																	<a class="addToWishlist"
																		href="FavriouteAddServlet?productId=<%=product.getProductId()%>"
																		data-rel="<%=product.getProductId()%>"> <i
																		class="fa fa-heart" aria-hidden="true"></i>
																	</a>
																	<%
																	}
																	%>
																	<a href="ProductDetailsServlet?productId=<%=product.getProductId()%>""
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
																			<div class="rating">
																				<div class="star-content">
																					<div class="star">
																						<i class="fa fa-star" aria-hidden="true"></i>
																					</div>
																					<div class="star">
																						<i class="fa fa-star" aria-hidden="true"></i>
																					</div>
																					<div class="star">
																						<i class="fa fa-star" aria-hidden="true"></i>
																					</div>
																					<div class="star">
																						<i class="fa fa-star" aria-hidden="true"></i>
																					</div>
																					<div class="star">
																						<i class="fa fa-star" aria-hidden="true"></i>
																					</div>
																				</div>
																			</div>
																			<div class="product-group-price">
																				<div class="product-price-and-shipping">
																					<span class="price">RS <%=product.getProductPrice()%></span>
																				</div>
																			</div>
																			<div class="discription">
																				<%=product.getProductDescription()%>
																			</div>
																		</div>
																		<div class="product-buttons d-flex">
																			<%
																			if (user != null) {
																				// Show add to cart button only if user is logged in
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
																			<%
																			}
																			// Show a login prompt or disable button if not logged in
																			%>

																			<a class="addToWishlist"
																				href="wishlist.jsp?productId=<%=product.getProductId()%>"
																				data-rel="<%=product.getProductId()%>"> <i
																				class="fa fa-heart" aria-hidden="true"></i>
																			</a> <a
																				href="quick-view.jsp?id=<%=product.getProductId()%>"
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
											<div class="js-product-list-top ">
												<div class="d-flex justify-content-around row">
													<div class="showing col col-xs-12">
														<span>SHOWING 1-3 OF 3 ITEM(S)</span>
													</div>
													<div class="page-list col col-xs-12">
														<ul>
															<li><a rel="prev" href="#"
																class="previous disabled js-search-link"> Previous </a>
															</li>
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
