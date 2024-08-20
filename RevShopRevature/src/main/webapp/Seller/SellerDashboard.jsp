<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.revshop.Entity.ProductEntity"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Add New Product</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;600&display=swap"
	rel="stylesheet">
<!-- Basic Page Needs -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Rev Shop Ecommerce Site</title>

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

<body class="product-cart checkout-cart blog">
	<header>


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
								<li><a href="#" class="parent">Home</a></li>
								<li><a href="#" class="parent">Blog</a></li>
								<li class="nav-link"><a href="#" class="parent">Page</a></li>
								<li><a href="contact.html" class="parent">Contact US</a></li>
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
						<div class="desktop_cart">
							<div class="blockcart block-cart cart-preview tiva-toggle">
								<div class="header-cart tiva-toggle-btn">
									<span class="cart-products-count">1</span> <i
										class="fa fa-shopping-cart" aria-hidden="true"></i>
								</div>
								<div class="dropdown-content">
									<div class="cart-content">
										<table>
											<tbody>
												<tr>
													<td class="product-image"><a
														href="product-detail.html"> <img
															src="Static/img/product/5.jpg" alt="Product">
													</a></td>
													<td>
														<div class="product-name">
															<a href="product-detail.html">Organic Strawberry
																Fruits</a>
														</div>
														<div>
															2 x <span class="product-price">£28.98</span>
														</div>
													</td>
													<td class="action"><a class="remove" href="#"> <i
															class="fa fa-trash-o" aria-hidden="true"></i>
													</a></td>
												</tr>
												<tr class="total">
													<td colspan="2">Total:</td>
													<td>£92.96</td>
												</tr>

												<tr>
													<td colspan="3" class="d-flex justify-content-center">
														<div class="cart-button">
															<a href="product-cart.html" title="View Cart">View
																Cart</a> <a href="product-checkout.html" title="Checkout">Checkout</a>
														</div>
													</td>
												</tr>
											</tbody>
										</table>
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
	<div class="main-content" id="cart">
		<!-- main -->
		<div id="wrapper-site">
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
				<div class="row">
					<!-- Sidebar -->
					<div
						class="sidebar-3 sidebar-collection col-lg-3 col-md-4 col-sm-4">
						<!-- Category Menu -->
						<br> <br> <br>
						<div class="sidebar-block">
							<div class="title-block">Categories</div>
							<div class="block-content">
								<div class="cateTitle hasSubCategory open level1">
									<span class="arrow collapsed collapse-icons"
										data-toggle="collapse" data-target="#livingroom"
										aria-expanded="false" role="status"> <i
										class="zmdi zmdi-minus"></i> <i class="zmdi zmdi-plus"></i>
									</span> <a class="cateItem" href="#">Mobile Phones</a>
									<div class="subCategory collapse" id="livingroom"
										aria-expanded="true" role="status"></div>
								</div>
								<div class="cateTitle hasSubCategory open level1">
									<span class="arrow collapsed collapse-icons"
										data-toggle="collapse" data-target="#bathroom"
										aria-expanded="false" role="status"> <i
										class="zmdi zmdi-minus"></i> <i class="zmdi zmdi-plus"></i>
									</span> <a class="cateItem" href="#">Laptops</a>
								</div>
								<div class="cateTitle hasSubCategory open level1">
									<span class="arrow collapsed collapse-icons"
										data-toggle="collapse" data-target="#diningroom"
										aria-expanded="false" role="status"> <i
										class="zmdi zmdi-minus"></i> <i class="zmdi zmdi-plus"></i>
									</span> <a class="cateItem" href="#">Cameras</a>
								</div>
								<div class="cateTitle hasSubCategory open level1">
									<span class="arrow collapsed collapse-icons"
										data-toggle="collapse" data-target="#bedroom"
										aria-expanded="false" role="status"> <i
										class="zmdi zmdi-minus"></i> <i class="zmdi zmdi-plus"></i>
									</span> <a class="cateItem" href="#">Furniture</a>
								</div>
								<div class="cateTitle hasSubCategory open level1">
									<span class="arrow collapsed collapse-icons"
										data-toggle="collapse" data-target="#kitchen"
										aria-expanded="false" role="status"> <i
										class="zmdi zmdi-minus"></i> <i class="zmdi zmdi-plus"></i>
									</span> <a class="cateItem" href="#">Kitchen Appliances</a>
								</div>
								<div class="cateTitle hasSubCategory open level1">
									<span class="arrow collapsed collapse-icons"
										data-toggle="collapse" data-target="#kitchen"
										aria-expanded="false" role="status"> <i
										class="zmdi zmdi-minus"></i> <i class="zmdi zmdi-plus"></i>
									</span> <a class="cateItem" href="#">Footwear</a>
								</div>
							</div>
						</div>
					</div>
					<!-- Main Content -->
					<div id="content-wrapper" class="col-lg-9 col-md-8 col-sm-8">
						<section id="main">
							<div class="cart-grid row">
								<div class="col-md-12 col-xs-12 check-info">
									<h1 class="title-page">Product List</h1>
									<div class="cart-container">
										<div class="cart-overview js-cart">
											<ul class="cart-items">
												<%
												List<ProductEntity> products = (List<ProductEntity>) request.getAttribute("products");
												if (products != null) {
													for (ProductEntity product : products) {
												%>
												<li class="cart-item"
													id="product-<%=product.getProductId()%>">
													<div class="product-line-grid row justify-content-between">
														<!-- Product left content: image -->
														<div class="product-line-grid-left col-md-2">
															<span class="product-image media-middle"> <a
																href="product-detail.html"> <img class="img-fluid"
																	src="<%=product.getProductImageUrl()%>"
																	alt="<%=product.getProductName()%>">
															</a>
															</span>
														</div>
														<div class="product-line-grid-body col-md-6">
															<div class="product-line-info">
																<a class="label" href="product-detail.html"
																	data-id_customization="0"> <%=product.getProductName()%>
																</a>
															</div>
															<div class="product-line-info product-price">
																<span class="value">₹<%=product.getProductPrice()%></span>
															</div>
															<div class="product-line-info">
																<span class="label-atrr">Brand:</span> <span
																	class="value"><%=product.getProductBrand()%></span>
															</div>
															<div class="product-line-info">
																<span class="label-atrr">Discount:</span> <span
																	class="value"><%=product.getProductDiscount()%>
																	%</span>
															</div>
														</div>
														<div
															class="product-line-grid-right text-center product-line-actions col-md-4">
															<div class="row">
																<div class="col-md-5 col qty">
																	<div class="label">Qty:</div>
																	<div class="quantity">
																		<input type="text" name="qty"
																			value="<%=product.getProductStock()%>"
																			class="input-group form-control"> <span
																			class="input-group-btn-vertical">
																			<button
																				class="btn btn-touchspin js-touchspin bootstrap-touchspin-up"
																				type="button">+</button>
																			<button
																				class="btn btn-touchspin js-touchspin bootstrap-touchspin-down"
																				type="button">-</button>
																		</span>
																	</div>
																</div>
																<div class="col-md-5 col price">
																	<div class="label">Edit:</div>
																	<div class="product-price total">
																		<a class="edit-cart-item" rel="nofollow" href="#"
																			data-link-action="edit-cart-item"
																			data-id-product="<%=product.getProductId()%>"> <i
																			class="fa fa-pencil" aria-hidden="true"></i>
																		</a>
																	</div>
																</div>
																<div class="col-md-2 col text-xs-right align-self-end">
																	<div class="cart-line-product-actions">
																		<button class="btn btn-link remove-from-cart"
																			rel="nofollow"
																			data-product-id="<%=product.getProductId()%>">
																			<i class="fa fa-trash-o" aria-hidden="true"></i>
																		</button>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</li>
												<%
												}
												}
												%>
											</ul>
											<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
											

											<script>
											$(document).ready(function() {
											    $('.remove-from-cart').click(function(event) {
											        event.preventDefault(); // Prevent the default form submission

											        var productId = $(this).data('product-id');
											        console.log("Delete button clicked for product ID: " + productId);

											        $.ajax({
											            url: '<%=request.getContextPath()%>/ProductDeleteServlet',
											            type: 'POST',
											            data: { productId: productId },
											            success: function(response) {
											                // Remove the product from the UI
											                console.log("Product deleted successfully");
											                $('#product-' + productId).remove();
											            },
											            error: function(xhr, status, error) {
											                console.error("Failed to delete the product: " + error);
											                alert('Failed to delete the product. Please try again.');
											            }
											        });
											    });
											});
											</script>




										</div>
									</div>
									<a href="product-checkout.html"
										class="continue btn btn-primary pull-xs-right">Continue</a>
								</div>
							</div>
						</section>
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
					<div class=" row">
						<div class="nov-html col-lg-4 col-sm-12 col-xs-12">
							<div class="block">
								<div class="block-content">
									<p class="logo-footer">
										<img src="img/home/logo.png" alt="img">
									</p>
									<p class="content-logo">Lorem ipsum dolor sit amet,
										consectetur adipiscing elit sed do eiusmod tempor incididunt
										ut labore et dolore magna aliqua. Ut enim ad minim</p>
								</div>
							</div>
							<div class="block">
								<div class="block-content">
									<ul>
										<li><a href="#">About Us</a></li>
										<li><a href="#">Reasons to shop</a></li>
										<li><a href="#">What our customers say</a></li>
										<li><a href="#">Meet the teaml</a></li>
										<li><a href="#">Contact our buyers</a></li>
									</ul>
								</div>
							</div>
							<div class="block">
								<div class="block-content">
									<p class="img-payment ">
										<img class="img-fluid" src="img/home/payment-footer.png"
											alt="img">
									</p>
								</div>
							</div>
						</div>
						<div class="nov-html col-lg-4 col-sm-6">
							<div class="block m-top">
								<div class="title-block">Contact Us</div>
								<div class="block-content">
									<div class="contact-us">
										<div class="title-content">
											<i class="fa fa-home" aria-hidden="true"></i> <span>Address
												:</span>
										</div>
										<div class="content-contact address-contact">
											<p>123 Suspendis matti, Visaosang Building VST District
												NY Accums, North American</p>
										</div>
									</div>
									<div class="contact-us">
										<div class="title-content">
											<i class="fa fa-envelope" aria-hidden="true"></i> <span>Email
												:</span>
										</div>
										<div class="content-contact mail-contact">
											<p>support@domain.com</p>
										</div>
									</div>
									<div class="contact-us">
										<div class="title-content">
											<i class="fa fa-phone" aria-hidden="true"></i> <span>Hotline
												:</span>
										</div>
										<div class="content-contact phone-contact">
											<p>+0012-345-67890</p>
										</div>
									</div>
									<div class="contact-us">
										<div class="title-content">
											<i class="fa fa-clock-o" aria-hidden="true"></i> <span>Opening
												Hours :</span>
										</div>
										<div class="content-contact hours-contact">
											<p>Monday - Sunday / 08.00AM- 19.00</p>
											<span>(Except Holidays)</span>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="tiva-modules col-lg-4 col-md-6">
							<div class="block m-top">
								<div class="block-content">
									<div class="title-block">Newsletter</div>
									<div class="sub-title">Sign up to our newsletter to get
										the latest articles, lookbooks voucher codes direct to your
										inbox</div>
									<div class="block-newsletter">
										<form action="#" method="post">
											<div class="input-group">
												<input type="text" class="form-control" name="email"
													value="" placeholder="Enter Your Email"> <span
													class="input-group-btn">
													<button class="effect-btn btn btn-secondary "
														name="submitNewsletter" type="submit">
														<span>subscribe</span>
													</button>
												</span>
											</div>
											<input type="hidden" name="action" value="0">
										</form>
									</div>
								</div>
							</div>
							<div class="block m-top1">
								<div class="block-content">
									<div class="social-content">
										<div class="title-block">Follow us on</div>
										<div id="social-block">
											<div class="social">
												<ul class="list-inline mb-0 justify-content-end">
													<li class="list-inline-item mb-0"><a href="#"
														target="_blank"> <i class="fa fa-facebook"></i>
													</a></li>
													<li class="list-inline-item mb-0"><a href="#"
														target="_blank"> <i class="fa fa-twitter"></i>
													</a></li>
													<li class="list-inline-item mb-0"><a href="#"
														target="_blank"> <i class="fa fa-google"></i>
													</a></li>
													<li class="list-inline-item mb-0"><a href="#"
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
											<img class="img-fluid" src="img/home/payment.png" alt="img">
										</div>
									</div>
									<!-- Popup newsletter -->
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
					<div class="text-center col-lg-12 ">
						<span> <a target="_blank"
							href="https://www.templateshub.net">Templates Hub</a>
						</span>
					</div>
				</div>
			</div>
		</div>
	</footer>

	<!-- back top top -->
	<div class="back-to-top">
		<a href="#"> <i class="fa fa-long-arrow-up"></i>
		</a>
	</div>

	<!-- menu mobie left -->
	<div class="mobile-top-menu d-md-none">
		<button type="button" class="close" aria-label="Close">
			<i class="zmdi zmdi-close"></i>
		</button>
		<div class="tiva-verticalmenu block" data-count_showmore="17">
			<div class="box-content block-content">
				<div class="verticalmenu" role="navigation">
					<ul class="menu level1">
						<li class="item  parent"><a href="#" class="hasicon"
							title="SIDE TABLE"> <img src="img/home/table-lamp.png"
								alt="img">SIDE TABLE
						</a> <span class="arrow collapsed" data-toggle="collapse"
							data-target="#SIDE-TABLE" aria-expanded="false" role="status">
								<i class="zmdi zmdi-minus"></i> <i class="zmdi zmdi-plus"></i>
						</span>
							<div class="subCategory collapse" id="SIDE-TABLE"
								aria-expanded="true" role="status">
								<ul>
									<li class="item"><a href="#" title="Aliquam lobortis">Aliquam
											lobortis</a></li>
									<li class="item  parent-submenu"><a href="#"
										title="Duis Reprehenderit">Duis Reprehenderit</a> <span
										class="arrow collapsed" data-toggle="collapse"
										data-target="#sub-Category" aria-expanded="false"
										role="status"> <i class="zmdi zmdi-minus"></i> <i
											class="zmdi zmdi-plus"></i>
									</span>
										<div class="subCategory collapse" id="sub-Category"
											aria-expanded="true" role="status">
											<ul>
												<li class="item"><a href="#" title="Aliquam lobortis">Aliquam
														lobortis</a></li>
												<li class="item"><a href="#" title="Duis Reprehenderit">Duis
														Reprehenderit</a></li>
												<li class="item"><a href="#" title="Voluptate">Voluptate</a>
												</li>
												<li class="item"><a href="#" title="Tongue Est">Tongue
														Est</a></li>
												<li class="item"><a href="#" title="Venison Andouille">Venison
														Andouille</a></li>
											</ul>
										</div></li>
									<li class="item"><a href="#" title="Voluptate">Voluptate</a>
									</li>
									<li class="item"><a href="#" title="Tongue Est">Tongue
											Est</a></li>
									<li class="item"><a href="#" title="Venison Andouille">Venison
											Andouille</a></li>
								</ul>
							</div></li>
						<li class="item  parent group"><a href="#" class="hasicon"
							title="FI"> <img src="img/home/fireplace.png" alt="img">FIREPLACE
						</a> <span class="arrow collapsed" data-toggle="collapse"
							data-target="#fi" aria-expanded="false" role="status"> <i
								class="zmdi zmdi-minus"></i> <i class="zmdi zmdi-plus"></i>
						</span>
							<div class="subCategory collapse" id="fi" aria-expanded="true"
								role="status">
								<div class="item">
									<div class="menu-content">
										<div class="tags d-flex d-xs-flex-inherit">
											<div class="title">
												<b>DINNING ROOM</b>
											</div>
											<ul class="list-inline">
												<li class="list-inline-item"><a href="#">Toshiba</a></li>
												<li class="list-inline-item"><a href="#">Samsung</a></li>
												<li class="list-inline-item"><a href="#">LG</a></li>
												<li class="list-inline-item"><a href="#">Sharp</a></li>
												<li class="list-inline-item"><a href="#">Electrolux</a>
												</li>
												<li class="list-inline-item"><a href="#">Hitachi</a></li>
												<li class="list-inline-item"><a href="#">Panasonic</a>
												</li>
												<li class="list-inline-item"><a href="#">Mitsubishi
														Electric</a></li>
												<li class="list-inline-item"><a href="#">Daikin</a></li>
												<li class="list-inline-item"><a href="#">Haier</a></li>
											</ul>
										</div>
										<div class="tags d-flex d-xs-flex-inherit">
											<div class="title">
												<b>BATHROOM</b>
											</div>
											<ul class="list-inline">
												<li class="list-inline-item"><a href="#">Toshiba</a></li>
												<li class="list-inline-item"><a href="#">Samsung</a></li>
												<li class="list-inline-item"><a href="#">LG</a></li>
												<li class="list-inline-item"><a href="#">Sharp</a></li>
												<li class="list-inline-item"><a href="#">Electrolux</a>
												</li>
												<li class="list-inline-item"><a href="#">Hitachi</a></li>
												<li class="list-inline-item"><a href="#">Panasonic</a>
												</li>
												<li class="list-inline-item"><a href="#">Mitsubishi
														Electric</a></li>
												<li class="list-inline-item"><a href="#">Daikin</a></li>
												<li class="list-inline-item"><a href="#">Haier
														Media</a></li>
												<li class="list-inline-item"><a href="#">Gee</a></li>
												<li class="list-inline-item"><a href="#">Digimart</a></li>
												<li class="list-inline-item"><a href="#">Vitivaa</a></li>
												<li class="list-inline-item"><a href="#">Sanaky</a></li>
												<li class="list-inline-item"><a href="#">Sunshine</a></li>
											</ul>
										</div>
										<div class="tags d-flex d-xs-flex-inherit">
											<div class="title">
												<b>LIVING ROOM</b>
											</div>
											<ul class="list-inline">
												<li class="list-inline-item"><a href="#">Media</a></li>
												<li class="list-inline-item"><a href="#">Gee</a></li>
												<li class="list-inline-item"><a href="#">Digimart</a></li>
												<li class="list-inline-item"><a href="#">Vitivaa</a></li>
												<li class="list-inline-item"><a href="#">Sanaky</a></li>
												<li class="list-inline-item"><a href="#">Sunshine</a></li>
												<li class="list-inline-item"><a href="#">Toshiba</a></li>
												<li class="list-inline-item"><a href="#">Samsung</a></li>
												<li class="list-inline-item"><a href="#">LG</a></li>
												<li class="list-inline-item"><a href="#">Sharp</a></li>
												<li class="list-inline-item"><a href="#">Electrolux</a>
												</li>
												<li class="list-inline-item"><a href="#">Hitachi</a></li>
												<li class="list-inline-item"><a href="#">Panasonic</a>
												</li>
												<li class="list-inline-item"><a href="#">Mitsubishi
														Electric</a></li>
												<li class="list-inline-item"><a href="#">Daikin</a></li>
												<li class="list-inline-item"><a href="#">Haier</a></li>
											</ul>
										</div>
										<div class="tags d-flex d-xs-flex-inherit">
											<div class="title">
												<b>BEDROOM</b>
											</div>
											<ul class="list-inline">
												<li class="list-inline-item"><a href="#">LG</a></li>
												<li class="list-inline-item"><a href="#">Sharp</a></li>
												<li class="list-inline-item"><a href="#">Electrolux</a>
												</li>
												<li class="list-inline-item"><a href="#">Hitachi</a></li>
												<li class="list-inline-item"><a href="#">Panasonic</a>
												</li>
												<li class="list-inline-item"><a href="#">Mitsubishi
														Electric</a></li>
												<li class="list-inline-item"><a href="#">Daikin</a></li>
												<li class="list-inline-item"><a href="#">Haier</a></li>
											</ul>
										</div>
										<div class="tags d-flex d-xs-flex-inherit">
											<div class="title">
												<b>KITCHEN</b>
											</div>
											<ul class="list-inline">
												<li class="list-inline-item"><a href="#">LG</a></li>
												<li class="list-inline-item"><a href="#">Sharp</a></li>
												<li class="list-inline-item"><a href="#">Electrolux</a>
												</li>
												<li class="list-inline-item"><a href="#">Hitachi</a></li>
												<li class="list-inline-item"><a href="#">Panasonic</a>
												</li>
												<li class="list-inline-item"><a href="#">Mitsubishi
														Electric</a></li>
												<li class="list-inline-item"><a href="#">Daikin</a></li>
												<li class="list-inline-item"><a href="#">Haier</a></li>
											</ul>
										</div>
										<div class="tags d-flex d-xs-flex-inherit">
											<div class="title">
												<b>Blender</b>
											</div>
											<ul class="list-inline">
												<li class="list-inline-item"><a href="#">LG</a></li>
												<li class="list-inline-item"><a href="#">Sharp</a></li>
												<li class="list-inline-item"><a href="#">Electrolux</a>
												</li>
												<li class="list-inline-item"><a href="#">Hitachi</a></li>
												<li class="list-inline-item"><a href="#">Panasonic</a>
												</li>
												<li class="list-inline-item"><a href="#">Mitsubishi
														Electric</a></li>
												<li class="list-inline-item"><a href="#">Daikin</a></li>
												<li class="list-inline-item"><a href="#">Haier</a></li>
											</ul>
										</div>
									</div>
								</div>
							</div></li>
						<li class="item group-category-img parent group"><a href="#"
							class="hasicon" title="TABLE LAMP"> <img
								src="img/home/table-lamp.png" alt="img">TABLE LAMP
						</a> <span class="arrow collapsed" data-toggle="collapse"
							data-target="#table-lamp" aria-expanded="false" role="status">
								<i class="zmdi zmdi-minus"></i> <i class="zmdi zmdi-plus"></i>
						</span>
							<div class="subCategory collapse" id="table-lamp"
								aria-expanded="true" role="status">
								<div class="item">
									<div class="menu-content">
										<div class="col-xs-12">
											<span class="menu-title">Coventry dining</span>
											<ul>
												<li><a href="#">Accessories</a></li>
												<li><a href="#">Activewear</a></li>
												<li><a href="#">ASOS Basic Tops</a></li>
												<li><a href="#">Bags &amp; Purses</a></li>
												<li><a href="#">Beauty</a></li>
												<li><a href="#">Coats &amp; Jackets</a></li>
												<li><a href="#">Curve &amp; Plus Size</a></li>
											</ul>
										</div>
										<div class="col-xs-12">
											<span class="menu-title">Amara stools</span>
											<ul>
												<li><a href="#">Accessories</a></li>
												<li><a href="#">Activewear</a></li>
												<li><a href="#">ASOS Basic Tops</a></li>
												<li><a href="#">Bags &amp; Purses</a></li>
												<li><a href="#">Beauty</a></li>
												<li><a href="#">Coats &amp; Jackets</a></li>
												<li><a href="#">Curve &amp; Plus Size</a></li>
											</ul>
										</div>
										<div class="col-xs-12">
											<span class="menu-title">Kingston dining</span>
											<ul>
												<li><a href="#">Accessories</a></li>
												<li><a href="#">Activewear</a></li>
												<li><a href="#">ASOS Basic Tops</a></li>
												<li><a href="#">Bags &amp; Purses</a></li>
												<li><a href="#">Beauty</a></li>
												<li><a href="#">Coats &amp; Jackets</a></li>
												<li><a href="#">Curve &amp; Plus Size</a></li>
											</ul>
										</div>
										<div class="col-xs-12">
											<span class="menu-title">Ellinger dining</span>
											<ul>
												<li><a href="#">Accessories</a></li>
												<li><a href="#">Activewear</a></li>
												<li><a href="#">ASOS Basic Tops</a></li>
												<li><a href="#">Bags &amp; Purses</a></li>
												<li><a href="#">Beauty</a></li>
												<li><a href="#">Coats &amp; Jackets</a></li>
												<li><a href="#">Curve &amp; Plus Size</a></li>
											</ul>
										</div>
									</div>
								</div>
							</div></li>
						<li class="item"><a href="#" class="hasicon" title="OTTOMAN">
								<img src="img/home/ottoman.png" alt="img">OTTOMAN
						</a></li>
						<li class="item"><a href="#" class="hasicon" title="ARMCHAIR">
								<img src="img/home/armchair.png" alt="img">ARMCHAIR
						</a></li>
						<li class="item"><a href="#" class="hasicon" title="CUSHION">
								<img src="img/home/cushion.png" alt="img">CUSHION
						</a></li>
						<li class="item"><a href="#" class="hasicon"
							title="COFFEE TABLE"> <img src="img/home/coffee_table.png"
								alt="img">COFFEE TABLE
						</a></li>
						<li class="item"><a href="#" class="hasicon" title="SHELF">
								<img src="img/home/shelf.png" alt="img">SHELF
						</a></li>
						<li class="item"><a href="#" class="hasicon" title="SOFA">
								<img src="img/home/sofa.png" alt="img">SOFA
						</a></li>
						<li class="item"><a href="#" class="hasicon"
							title="DRESSING TABLE"> <img src="img/home/dressing.png"
								alt="img">DRESSING TABLE
						</a></li>
						<li class="item"><a href="#" class="hasicon"
							title="WINDOWN CURTAIN"> <img src="img/home/windown.png"
								alt="img">WINDOWN CURTAIN
						</a></li>
						<li class="item"><a href="#" class="hasicon"
							title="CHANDELIER"> <img src="img/home/chandelier.png"
								alt="img">CHANDELIER
						</a></li>
						<li class="item"><a href="#" class="hasicon"
							title="CEILING FAN"> <img src="img/home/ceiling_fan.png"
								alt="img">CEILING FAN
						</a></li>
						<li class="item"><a href="#" class="hasicon" title="WARDROBE">
								<img src="img/home/wardrobe.png" alt="img">WARDROBE
						</a></li>
						<li class="item"><a href="#" class="hasicon"
							title="FLOOR LAMP"> <img src="img/home/floor_lamp.png"
								alt="img">FLOOR LAMP
						</a></li>
						<li class="item"><a href="#" class="hasicon"
							title="VASE-FLOWER "> <img src="img/home/vase-flower.png"
								alt="img">VASE-FLOWER
						</a></li>
						<li class="item"><a href="#" class="hasicon" title="BED">
								<img src="img/home/bed.png" alt="img">BED
						</a></li>
						<li class="item"><a href="#" class="hasicon" title="BED GIRL">
								<img src="img/home/bed.png" alt="img">BED GIRL
						</a></li>
						<li class="item"><a href="#" class="hasicon" title="BED BOY">
								<img src="img/home/bed.png" alt="img">BED BOY
						</a></li>
					</ul>
				</div>
			</div>
		</div>

	</div>

	<!-- menu mobie right -->
	<div id="mobile-pagemenu"
		class="mobile-boxpage d-flex hidden-md-up active d-md-none">
		<div class="content-boxpage col">
			<div
				class="box-header d-flex justify-content-between align-items-center">
				<div class="title-box">Menu</div>
				<div class="close-box">Close</div>
			</div>
			<div class="box-content">
				<nav>
					<!-- Brand and toggle get grouped for better mobile display -->
					<div id="megamenu" class="nov-megamenu clearfix">
						<ul class="menu level1">
							<li class="item home-page has-sub"><span
								class="arrow collapsed" data-toggle="collapse"
								data-target="#home1" aria-expanded="true" role="status">
									<i class="zmdi zmdi-minus"></i> <i class="zmdi zmdi-plus"></i>
							</span> <a href="index-2.html" title="Home"> <i class="fa fa-home"
									aria-hidden="true"></i>Home
							</a>
								<div class="subCategory collapse" id="home1"
									aria-expanded="true" role="status">
									<ul>
										<li class="item"><a href="index-2.html"
											title="Home Page 1">Home Page 1</a></li>
										<li class="item"><a href="home2.html" title="Home Page 2">Home
												Page 2</a></li>
										<li class="item"><a href="home3.html" title="Home Page 3">Home
												Page 3</a></li>
										<li class="item"><a href="home4.html" title="Home Page 4">Home
												Page 4</a></li>
										<li class="item"><a href="home5.html" title="Home Page 5">Home
												Page 5</a></li>
									</ul>
								</div></li>
							<li class="item has-sub"><span class="arrow collapsed"
								data-toggle="collapse" data-target="#blog" aria-expanded="false"
								role="status"> <i class="zmdi zmdi-minus"></i> <i
									class="zmdi zmdi-plus"></i>
							</span> <a href="#" title="Blog"> <i class="fa fa-address-book"
									aria-hidden="true"></i>Blog
							</a>

								<div class="subCategory collapse" id="blog" aria-expanded="true"
									role="status">
									<ul>
										<li class="item"><a href="blog-list-sidebar-left.html"
											title="Blog List (Sidebar Left)">Blog List (Sidebar Left)</a>
										</li>
										<li class="item"><a href="blog-list-sidebar-left2.html"
											title="Blog List (Sidebar Left) 2">Blog List (Sidebar
												Left) 2</a></li>
										<li class="item"><a href="blog-list-sidebar-right.html"
											title="Category Blog (Right column)">Blog List (Sidebar
												Right)</a></li>
										<li class="item"><a href="blog-list-no-sidebar.html"
											title="Blog List (No Sidebar)">Blog List (No Sidebar)</a></li>
										<li class="item"><a href="blog-grid-no-sidebar.html"
											title="Blog Grid (No Sidebar)">Blog Grid (No Sidebar)</a></li>
										<li class="item"><a href="blog-detail.html"
											title="Blog Detail">Blog Detail</a></li>
									</ul>
								</div></li>
							<li class="item group has-sub"><span class="arrow collapsed"
								data-toggle="collapse" data-target="#page" aria-expanded="false"
								role="status"> <i class="zmdi zmdi-minus"></i> <i
									class="zmdi zmdi-plus"></i>
							</span> <a href="#" title="Page"> <i class="fa fa-file-text-o"
									aria-hidden="true"></i>page
							</a>
								<div class="subCategory collapse" id="page" aria-expanded="true"
									role="status">
									<ul class="group-page">
										<li class="item container group">
											<div>
												<ul>
													<li class="item col-md-4 "><span class="menu-title">Category
															Style</span>
														<div class="menu-content">
															<ul class="col">
																<li><a href="product-grid-sidebar-left.html">Product
																		Grid (Sidebar Left)</a></li>
																<li><a href="product-grid-sidebar-right.html">Product
																		Grid (Sidebar Right)</a></li>
																<li><a href="product-list-sidebar-left.html">Product
																		List (Sidebar Left) </a></li>
															</ul>
														</div></li>
													<li class="item col-md-4 html"><span
														class="menu-title">Product Detail Style</span>
														<div class="menu-content">
															<ul>
																<li><a href="product-detail.html">Product
																		Detail (Sidebar Left)</a></li>
																<li><a href="#">Product Detail (Sidebar Right)</a>
																</li>
															</ul>
														</div></li>
													<li class="item col-md-4 html"><span
														class="menu-title">Bonus Page</span>
														<div class="menu-content">
															<ul>
																<li><a href="404.html">404 Page</a></li>
																<li><a href="about-us.html">About Us Page</a></li>
															</ul>
														</div></li>
												</ul>
											</div>
										</li>
									</ul>
								</div></li>
							<li class="item has-sub"><a href="contact.html"
								title="Contact us"> <i class="fa fa-map-marker"
									aria-hidden="true"></i>Contact us
							</a></li>
						</ul>
					</div>
				</nav>
			</div>
		</div>
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
	<script src="Static/libs/slick-slider/js/slick.min.js"></script>

	<!-- Template JS -->
	<script src="Static/js/theme.js"></script>
</body>


<!-- product-cart07:12-->
</html>