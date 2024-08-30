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
	<%
	HttpSession s = request.getSession(false); // Use false to prevent creating a new session if one doesn't exist
	com.revshop.Entity.LoginEntity user = (com.revshop.Entity.LoginEntity) (s != null ? s.getAttribute("user") : null);
	%>
	<jsp:include page="/includes/header.jsp" />

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
																href="ProductDetailsServlet?productId=<%=item.getProductId()%>">
																	<img class="img-fluid" src="<%=item.getImgUrl()%>"
																	alt="<%=item.getProductName()%>">
															</a>
															</span>
														</div>
														<div class="product-line-grid-body col-md-6">
															<div class="product-line-info">
																<a class="label"
																	href="ProductDetailsServlet?productId=<%=item.getProductId()%>"
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


	<!-- back to top -->
	<div class="back-to-top">
		<a href="#"> <i class="fa fa-long-arrow-up"></i></a>
	</div>
	<!-- Vendor JS -->
	<jsp:include page="/includes/footer.jsp" />
</body>
</html>