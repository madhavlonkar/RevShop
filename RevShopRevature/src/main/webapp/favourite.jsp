<%@ page import="java.util.List"%>
<%@ page import="com.revshop.Entity.FavoriteProductsEntity"%>
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
<style>.logo {
	font-family: Arial, sans-serif; /* Or use a similar font */
	font-weight: 750; /* Extra bold */
	font-size: 24px; /* Adjust size as needed */
	color: #000000; /* Black color */
}</style>
</head>

<body class="product-cart checkout-cart blog">
	
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
							<li><a href="#"> <span>Favourite</span></a></li>
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
									<h1 class="title-page">Favorite Products</h1>
									<div class="cart-container">
										<div class="cart-overview js-cart">
											<ul class="cart-items">
												<%
												List<FavoriteProductsEntity> favoriteItems = (List<FavoriteProductsEntity>) request.getAttribute("favoriteItems");

												if (favoriteItems != null && !favoriteItems.isEmpty()) {
													for (FavoriteProductsEntity item : favoriteItems) {
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
																<span class="label-atrr">Discount:</span> <span
																	class="value"><%=item.getProductDiscount()%> %</span>
															</div>
														</div>
														<div
															class="product-line-grid-right text-center product-line-actions col-md-4">
															<div class="row">
																<div class="col-md-5 col price">
																	<div class="label">Total Price</div>
																	<div class="product-price total">

																		<%=String.format("%.2f", item.getProductPrice() * (1 - item.getProductDiscount() / 100.0))%>
																	</div>
																</div>
																<div class="col-md-2 col text-xs-right align-self-end">
																	<div class="cart-line-product-actions">
																		<a class="remove-from-cart" rel="nofollow"
																			href="FavriouteDeleteServlet?favoriteId=<%=item.getFav_id()%>"
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
													<div class="alert alert-warning">You have no favorite
														products.</div>
												</li>
												<%
												}
												%>
											</ul>
										</div>
									</div>
									<a href="categories.html"
										class="continue btn btn-primary pull-xs-right"> Continue
										Shopping </a>
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