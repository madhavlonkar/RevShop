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
																	src="<%=product.getProductImage()%>"
																	alt="Product Image" alt="<%=product.getProductName()%>">
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
																		<a class="edit-cart-item" rel="nofollow"
																			href="/RevShopRevature/ProductEditServlet?id=<%=product.getProductId()%>"
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
											            url: '<%=request.getContextPath()%>
												/ProductDeleteServlet',
																									type : 'POST',
																									data : {
																										productId : productId
																									},
																									success : function(
																											response) {
																										// Remove the product from the UI
																										console
																												.log("Product deleted successfully");
																										$(
																												'#product-'
																														+ productId)
																												.remove();
																									},
																									error : function(
																											xhr,
																											status,
																											error) {
																										console
																												.error("Failed to delete the product: "
																														+ error);
																										alert('Failed to delete the product. Please try again.');
																									}
																								});
																					});
																});
											</script>

											<script>
												$(document)
														.ready(
																function() {
																	// Handle increment button click
																	$(
																			'.bootstrap-touchspin-up')
																			.click(
																					function() {
																						var quantityInput = $(
																								this)
																								.closest(
																										'.quantity')
																								.find(
																										'input[name="qty"]');
																						var currentValue = parseInt(quantityInput
																								.val());

																						if (!isNaN(currentValue)) {
																							quantityInput
																									.val(currentValue + 1);
																						} else {
																							quantityInput
																									.val(1);
																						}
																					});

																	// Handle decrement button click
																	$(
																			'.bootstrap-touchspin-down')
																			.click(
																					function() {
																						var quantityInput = $(
																								this)
																								.closest(
																										'.quantity')
																								.find(
																										'input[name="qty"]');
																						var currentValue = parseInt(quantityInput
																								.val());

																						if (!isNaN(currentValue)
																								&& currentValue > 1) {
																							quantityInput
																									.val(currentValue - 1);
																						} else {
																							quantityInput
																									.val(1); // Ensure it doesn't go below 1
																						}
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
						<span> <a target="_blank" href="#">Rev Shop</a>
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