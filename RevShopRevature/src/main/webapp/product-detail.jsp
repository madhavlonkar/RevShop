<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Product Details</title>
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
</head>

<body id="product-detail">
	<header>
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


							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>

	<!-- main content -->
	<div class="main-content">
		<div id="wrapper-site">
			<div id="content-wrapper">
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
										class="sidebar-3 sidebar-collection col-lg-3 col-md-3 col-sm-4">

										<!-- category -->
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
									<div class="col-sm-8 col-lg-9 col-md-9">
										<div class="main-product-detail">
											<h2>${product.productName}</h2>
											<div class="product-single row">
												<div class="product-detail col-xs-12 col-md-5 col-sm-5">
													<div class="page-content" id="content">
														<div class="images-container">
															<div class="js-qv-mask mask tab-content border">
																<div id="item1" class="tab-pane fade active in show">
																	<img src="${product.productImage}" alt="Product Image">
																</div>
															</div>
														</div>
													</div>
												</div>
												<div class="product-info col-xs-12 col-md-7 col-sm-7">
													<div class="detail-description">
														<div class="price-del">
															<span class="price" style="color: black;"> RS
																${Math.floor(product.productPrice - (product.productPrice * product.productDiscount / 100))}
															</span> <span class="original-price"
																style="text-decoration: line-through; color: red; margin-left: 10px;">
																RS ${Math.floor(product.productPrice)} </span> <span
																class="discount-percentage"
																style="color: green; font-weight: bold; margin-left: 10px;">
																(${Math.floor(product.productDiscount)}% OFF) </span>
														</div>
														<p class="description">${product.productDescription}</p>

														<div class="has-border cart-area">
															<div class="product-quantity">
																<div class="qty">
																	<div class="input-group">
																		<span class="add"> <a class="addToWishlist"
																			href="#"> <i class="fa fa-heart"
																				aria-hidden="true"></i>
																		</a>
																			<button class="btn btn-primary add-to-cart add-item"
																				data-button-action="add-to-cart" type="submit">
																				<i class="fa fa-shopping-cart" aria-hidden="true"></i>
																				<span>Add to cart</span>
																			</button>
																		</span>
																	</div>
																</div>
															</div>
															<div class="clearfix"></div>
															<p class="product-minimal-quantity"></p>
														</div>
														<div class="d-flex2 has-border">
															<div class="btn-group">
																<a href="#" id="share-button"> <i
																	class="zmdi zmdi-share"></i> <span>Share</span>
																</a> <a href="#" id="print-button" class="print"> <i
																	class="zmdi zmdi-print"></i> <span>Print</span>
																</a>
																<div class="rating-comment d-flex">
																	<div class="review-description d-flex">
																		<span>REVIEW :</span>
																		<div class="rating">
																			<div class="star-content">
																				<div class="star"></div>
																				<div class="star"></div>
																				<div class="star"></div>
																				<div class="star"></div>
																				<div class="star"></div>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
														</div>

														<div class="d-flex2 has-border">
															<span class="float-left"> <span class="availb">&nbsp  Availability:</span>
																<span class="check"> <i
																	class="fa fa-check-square-o" aria-hidden="true"></i> <span
																	style="color: ${product.productStock > 0 ? 'green' : 'red'};">
																		${product.productStock > 0 ? 'IN STOCK' : 'OUT OF STOCK'}
																</span>
															</span>
															</span>
															<br>
														</div>

														<!-- Confirmation Message -->
														<p id="confirmation-message"
															style="color: green; display: none; margin-top: 10px;">Link
															copied to clipboard!</p>

														<!-- Toast Notification -->
														<div id="toast" class="toast">Link copied to
															clipboard</div>

														<div class="content">
															<p>
																Categories: <span class="content2">
																	${product.productCategory} </span>
															</p>
															<p>
																Tags: <span class="content2">
																	${product.productTags} </span>
															</p>
														</div>
													</div>
												</div>
											</div>

											<div class="review" id="review-section">
												<ul class="nav nav-tabs">
													<li class="active"><a data-toggle="tab" href="#review">Reviews
															(2)</a></li>
												</ul>

												<div class="tab-content">
													<div id="review" class="tab-pane fade active show">
														<div class="spr-form">
															<div class="user-comment">
																<div class="spr-review">
																	<div class="spr-review-header">
																		<span class="spr-review-header-byline"> <strong>Peter
																				Capidal</strong> - <span>Apr 14, 2018</span>
																		</span>
																		<div class="rating">
																			<div class="star-content">
																				<div class="star"></div>
																				<div class="star"></div>
																				<div class="star"></div>
																				<div class="star"></div>
																				<div class="star"></div>
																			</div>
																		</div>
																	</div>
																	<div class="spr-review-content">
																		<p class="spr-review-content-body">In feugiat
																			venenatis enim, non finibus metus bibendum eu. Proin
																			massa justo, eleifend fermentum varius quis, semper
																			gravida quam. Cras nec enim sed lacus viverra luctus.
																			Nunc quis accumsan mauris. Aliquam fermentum sit amet
																			est id scelerisque. Nam porta risus metus.</p>
																	</div>
																</div>
																<div class="spr-review preview2">
																	<div class="spr-review-header">
																		<span class="spr-review-header-byline"> <strong>David
																				James</strong> - <span>Apr 13, 2018</span>
																		</span>
																		<div class="rating">
																			<div class="star-content">
																				<div class="star"></div>
																				<div class="star"></div>
																				<div class="star"></div>
																				<div class="star"></div>
																				<div class="star"></div>
																			</div>
																		</div>
																	</div>
																	<div class="spr-review-content">
																		<p class="spr-review-content-body">In feugiat
																			venenatis enim, non finibus metus bibendum eu. Proin
																			massa justo, eleifend fermentum varius quis, semper
																			gravida quam. Cras nec enim sed lacus viverra luctus.
																			Nunc quis accumsan mauris. Aliquam fermentum sit amet
																			est id scelerisque. Nam porta risus metus.</p>
																	</div>
																</div>
															</div>
														</div>
														<form id="write-review-section" method="post" action="#"
															class="new-review-form">
															<input type="hidden" name="review[rating]" value="3">
															<input type="hidden" name="product_id">
															<h3 class="spr-form-title">Write a review</h3>
															<fieldset>
																<div class="spr-form-review-rating">
																	<label class="spr-form-label">Your Rating</label>
																	<fieldset class="ratings">
																		<input type="radio" id="star5" name="rating" value="5" />
																		<label class="full" for="star5"
																			title="Awesome - 5 stars"></label> <input
																			type="radio" id="star4half" name="rating"
																			value="4 and a half" /> <input type="radio"
																			id="star4" name="rating" value="4" /> <label
																			class="full" for="star4"
																			title="Pretty good - 4 stars"></label> <input
																			type="radio" id="star3half" name="rating"
																			value="3 and a half" /> <input type="radio"
																			id="star3" name="rating" value="3" /> <label
																			class="full" for="star3" title="Meh - 3 stars"></label>
																		<input type="radio" id="star2half" name="rating"
																			value="2 and a half" /> <input type="radio"
																			id="star2" name="rating" value="2" /> <label
																			class="full" for="star2" title="Kinda bad - 2 stars"></label>
																		<input type="radio" id="star1half" name="rating"
																			value="1 and a half" /> <input type="radio"
																			id="star1" name="rating" value="1" /> <label
																			class="full" for="star1"
																			title="Sucks big time - 1 star"></label> <input
																			type="radio" id="starhalf" name="rating" value="half" />
																	</fieldset>
																</div>
															</fieldset>
															<fieldset class="spr-form-contact">
																<div class="spr-form-contact-name">
																	<input
																		class="spr-form-input spr-form-input-text form-control"
																		placeholder="Enter your name">
																</div>
																<div class="spr-form-contact-email">
																	<input
																		class="spr-form-input spr-form-input-email form-control"
																		placeholder="Enter your email">
																</div>
															</fieldset>
															<fieldset>
																<div class="spr-form-review-body">
																	<div class="spr-form-input">
																		<textarea class="spr-form-input-textarea" rows="10"
																			placeholder="Write your comments here"></textarea>
																	</div>
																</div>
															</fieldset>
															<div class="submit">
																<input type="submit" name="addComment"
																	id="submitComment" class="btn btn-default"
																	value="Submit Review">
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

	<script>
		document
				.getElementById('share-button')
				.addEventListener(
						'click',
						function(event) {
							event.preventDefault();

							// Copy the current URL to the clipboard
							navigator.clipboard
									.writeText(window.location.href)
									.then(
											function() {
												// Show the confirmation message
												var confirmationMessage = document
														.getElementById('confirmation-message');
												confirmationMessage.style.display = 'block';

												// Hide the message after a few seconds
												setTimeout(
														function() {
															confirmationMessage.style.display = 'none';
														}, 1000);
											},
											function(err) {
												console
														.error(
																'Could not copy text: ',
																err);
											});
						});

		document.getElementById('print-button').addEventListener('click',
				function(event) {
					event.preventDefault();
					// Trigger the print dialog
					window.print();
				});
	</script>
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