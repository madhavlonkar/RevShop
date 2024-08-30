<%@ page import="java.util.List"%>
<%@ page import="com.revshop.Entity.ReviewEntity"%>
<%@ page import="com.revshop.Entity.ProductEntity"%>
<%@ page import="java.text.SimpleDateFormat"%>
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
.logo {
	font-family: Arial, sans-serif; /* Or use a similar font */
	font-weight: 750; /* Extra bold */
	font-size: 24px; /* Adjust size as needed */
	color: #000000; /* Black color */
}
</style>


</head>

<body id="product-detail">
		<%
		HttpSession s = request.getSession(false); // Use false to prevent creating a new session if one doesn't exist
		com.revshop.Entity.LoginEntity user = (com.revshop.Entity.LoginEntity) (s != null ? s.getAttribute("user") : null);
		%>
		<jsp:include page="/includes/header.jsp" />

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
										<li><a href="#"> <span>Home</span></a></li>
										<li><a href="#"> <span>Product Details</span></a></li>
										<!-- Display the selected category -->
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
													<a class="cateItem" href="HomeServlet?category=Electronics">Electronics</a>
												</div>
												<div class="cateTitle hasSubCategory open level1">
													<a class="cateItem" href="HomeServlet?category=Fashion">Fashion</a>
												</div>
												<div class="cateTitle hasSubCategory open level1">
													<a class="cateItem"
														href="HomeServlet?category=Home Appliances">Home
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
																		<span class="add"> <%
 if (user != null) {
 %> <!-- User is logged in --> <a class="addToWishlist"
																			href="FavriouteAddServlet?productId=${product.productId}&userId=${user.userId}">
																				<i class="fa fa-heart" aria-hidden="true"></i>
																		</a>
																			<form action="AddToCartServlet" method="post"
																				style="display: inline;">
																				<input type="hidden" name="productId"
																					value="${product.productId}"> <input
																					type="hidden" name="userId"
																					value="<%=user.getUserId()%>">
																				<button class="btn btn-primary add-to-cart add-item"
																					data-button-action="add-to-cart" type="submit">
																					<i class="fa fa-shopping-cart" aria-hidden="true"></i>
																					<span>Add to cart</span>
																				</button>
																			</form> <%
 } else {
 %> <!-- User is not logged in --> <a class="addToWishlist"
																			href="LoginAndRegistration/user-login.jsp"> <i
																				class="fa fa-heart" aria-hidden="true"></i>
																		</a>
																			<form action="LoginAndRegistration/user-login.jsp"
																				method="post" style="display: inline;">
																				<input type="hidden" name="productId"
																					value="${product.productId}">
																				<button class="btn btn-primary add-to-cart add-item"
																					data-button-action="add-to-cart" type="submit">
																					<i class="fa fa-shopping-cart" aria-hidden="true"></i>
																					<span>Add to cart</span>
																				</button>
																			</form> <%
 }
 %>
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
															<span class="float-left"> <span class="availb">&nbsp
																	Availability:</span> <span class="check"> <i
																	class="fa fa-check-square-o" aria-hidden="true"></i> <span
																	style="color: ${product.productStock > 0 ? 'green' : 'red'};">
																		${product.productStock > 0 ? 'IN STOCK' : 'OUT OF STOCK'}
																</span>
															</span>
															</span> <br>
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
															</a></li>
												</ul>

												<div class="tab-content">
													<div id="review" class="tab-pane fade active show">
														<div class="spr-form">
															<div class="user-comment">
																<%
																List<ReviewEntity> reviews = (List<ReviewEntity>) request.getAttribute("reviews");
																if (reviews != null && !reviews.isEmpty()) {
																	for (ReviewEntity review : reviews) {
																		int stars = review.getStars(); // Get the correct number of stars
																%>
																<div class="spr-review">
																	<div class="spr-review-header">
																		<span class="spr-review-header-byline"> <strong><%=review.getCustomerName()%></strong>
																			- <span><%=review.getReviewDate()%></span>
																		</span>
																		<div class="rating">
																			<div class="star-content">
																				<%
																				for (int i = 1; i <= 5; i++) {
																					if (i <= stars) {
																				%>
																				<div class="star filled"></div>
																				<%
																				} else {
																				%>
																				<div class="star"></div>
																				<%
																				}
																				}
																				%>
																			</div>
																		</div>
																	</div>
																	<div class="spr-review-content">
																		<p class="spr-review-content-body"><%=review.getReview()%></p>
																	</div>
																</div>
																<%
																}
																} else {
																%>
																<p>No reviews yet. Be the first to write a review!</p>
																<%
																}
																%>
															</div>
														</div>
														<form id="write-review-section" method="post"
															action="ReviewAddServlet" class="new-review-form">
															<input type="hidden" name="product_id"
																value="${product.productId}">
															<!-- Assuming user info is in session -->
															<h3 class="spr-form-title">Write a review</h3>
															<fieldset>
																<div class="spr-form-review-rating">
																	<label class="spr-form-label">Your Rating</label>
																	<fieldset class="ratings">
																		<input type="radio" id="star5" name="rating" value="5" />
																		<label class="full" for="star5"
																			title="Awesome - 5 stars"></label> <input
																			type="radio" id="star4" name="rating" value="4" /> <label
																			class="full" for="star4"
																			title="Pretty good - 4 stars"></label> <input
																			type="radio" id="star3" name="rating" value="3" /> <label
																			class="full" for="star3" title="Meh - 3 stars"></label>
																		<input type="radio" id="star2" name="rating" value="2" />
																		<label class="full" for="star2"
																			title="Kinda bad - 2 stars"></label> <input
																			type="radio" id="star1" name="rating" value="1" /> <label
																			class="full" for="star1"
																			title="Sucks big time - 1 star"></label>
																	</fieldset>
																</div>
															</fieldset>
															<fieldset class="spr-form-contact">
																<div class="spr-form-contact-name">
																	<input name="name"
																		class="spr-form-input spr-form-input-text form-control"
																		placeholder="Enter your name">
																</div>
																<div class="spr-form-contact-email">
																	<input name="email"
																		class="spr-form-input spr-form-input-email form-control"
																		placeholder="Enter your email">
																</div>
															</fieldset>
															<fieldset>
																<div class="spr-form-review-body">
																	<div class="spr-form-input">
																		<textarea name="review"
																			class="spr-form-input-textarea" rows="10"
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
	<jsp:include page="/includes/footer.jsp" />
</body>
</html>