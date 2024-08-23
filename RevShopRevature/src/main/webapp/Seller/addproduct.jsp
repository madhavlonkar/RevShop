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
body {
	font-family: 'Montserrat', sans-serif;
	background-color: #fff;
	color: #333;
}

.container {
	display: flex;
	justify-content: space-between;
	max-width: 1200px;
	margin: 0 auto;
	padding: 20px;
}

.form-section {
	width: 60%;
}

h2 {
	font-weight: 600;
	margin-bottom: 10px;
	color: #d35f8d;
	font-size: 28px;
}

p {
	margin-bottom: 20px;
	color: #666;
}

.form-row {
	display: flex;
	justify-content: space-between;
}

.form-group {
	width: 48%;
	margin-bottom: 15px;
}

.form-group label {
	display: block;
	margin-bottom: 5px;
	font-weight: 600;
	color: #333;
	font-size: 16px;
}

.form-group input, .form-group select, .form-group textarea {
	width: 100%;
	padding: 12px;
	border: 1px solid #ddd;
	border-radius: 4px;
	font-size: 14px;
	background-color: #f9f9f9;
	transition: all 0.3s ease-in-out;
}

.form-group select {
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	background-image:
		url('data:image/svg+xml;charset=US-ASCII,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 4 5"><path fill="#666" d="M2 0L0 2h4zm0 5L0 3h4z"/></svg>');
	background-repeat: no-repeat;
	background-position: right 12px top 50%;
	background-size: 10px;
}

.form-group select:hover, .form-group input:focus, .form-group textarea:focus
	{
	border-color: #d35f8d;
	background-color: #fff;
	box-shadow: 0 0 5px rgba(211, 95, 141, 0.5);
}

.form-group select:focus {
	outline: none;
}

.form-group textarea {
	resize: vertical;
	height: 120px;
}

.checkout-btn {
	display: block;
	width: 100%;
	padding: 15px;
	background-color: #d35f8d;
	color: #fff;
	font-size: 18px;
	text-align: center;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	margin-top: 20px;
	transition: background-color 0.3s;
}

.checkout-btn:hover {
	background-color: #b54c6d;
}

.back-btn {
	display: inline-block;
	margin-top: 15px;
	color: #d35f8d;
	font-size: 16px;
	text-decoration: none;
}

.back-btn:hover {
	text-decoration: underline;
}

.cart-section {
	width: 35%;
	border-left: 1px solid #ddd;
	padding-left: 20px;
}

.payments h3 {
	font-weight: 600;
	margin-bottom: 15px;
	font-size: 22px;
	color: #d35f8d;
}

.payment-icons {
	margin: 15px 0;
	font-size: 24px;
	text-align: center;
	color: #aaa;
	position: relative;
}

#previewImage {
	width: 100%;
	height: auto;
	display: block;
	margin-top: 10px;
	border-radius: 8px;
	border: 2px solid #ddd;
	box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
	padding: 10px;
	background-color: #f9f9f9;
}

#removeImage {
	position: absolute;
	top: 5px;
	right: 10px;
	background-color: rgba(255, 255, 255, 0.7);
	border: none;
	font-size: 18px;
	cursor: pointer;
	display: none;
	border-radius: 50%;
	padding: 2px 6px;
	color: #d35f8d;
}
</style>
</head>
<body id="product-sidebar-left" class="product-grid-sidebar-left">

	<header>
		<!-- header left mobie -->
	

		<!-- header desktop -->
		<div class="header-top d-xs-none ">
			<div class="container">
				<div class="row">
					<!-- logo -->
					<div class="col-sm-2 col-md-2 d-flex align-items-center">
						<div id="logo">
							<a href="index-2.html"> <img
								src="Static/img/home/logo.png" alt="logo" class="img-fluid">
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
                                            <li class="item">
                                                <a href="index-2.html" title="Electronics">Electronics</a>
                                            </li>
                                            <li class="item">
                                                <a href="home2.html" title="Fashion">Fashion</a>
                                            </li>
                                            <li class="item">
                                                <a href="home3.html" title="Home Appliances">Home Appliances</a>
                                            </li>
                                            <li class="item">
                                                <a href="home4.html" title="Books">Books</a>
                                            </li>
                                            <li class="item">
                                                <a href="home5.html" title="Sports">Sports</a>
                                            </li>
                                        </ul>
                                    </div></li>
                           <li><a href="order-history.html" class="parent">Order History</a></li>
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
							<div class="form-section">
								<h2>Add New Product</h2>
								<p>Fill in the details to add a new product to the system</p>
								<form action="/RevShopRevature/ProductAddServlet" method="POST"
									enctype="multipart/form-data">
									<div class="form-row">
										<div class="form-group">
											<label for="productName">Product Name *</label> <input
												type="text" id="productName" name="product_name" required>
										</div>
										<div class="form-group">
											<label for="productCategory">Category *</label> <select
												id="productCategory" name="product_category" required>
												<option value="" disabled selected>Select Type</option>
												<option value="electronics">Electronics</option>
												<option value="fashion">Fashion</option>
												<option value="HomeAppliances">Home Appliances</option>
												<option value="Books">Books</option>
												<option value="Sports">Sports</option>
												<!-- Add more categories as needed -->
											</select>
										</div>
									</div>
									<div class="form-row">
										<div class="form-group">
											<label for="productPrice">Price *</label> <input
												type="number" id="productPrice" name="product_price"
												step="0.01" required>
										</div>
										<div class="form-group">
											<label for="productDiscount">Discount</label> <input
												type="number" id="productDiscount" name="product_discount"
												step="0.01">
										</div>
									</div>
									<div class="form-row">
										<div class="form-group">
											<label for="productStock">Stock Quantity *</label> <input
												type="number" id="productStock" name="product_stock"
												required>
										</div>
										<div class="form-group">
											<label for="productBrand">Brand *</label> <input type="text"
												id="productBrand" name="product_brand" required>
										</div>
									</div>
									<div class="form-group">
										<label for="productDescription">Product Description *</label>
										<textarea id="productDescription" name="product_description"
											required></textarea>
									</div>
									<div class="form-row">
										<div class="form-group">
											<label for="productStatus">Status *</label> <select
												id="productStatus" name="product_status" required>
												<option value="In_Stock">In Stock</option>
												<option value="out_of_stock">Out of Stock</option>
											</select>
										</div>
										<div class="form-group">
											<label for="productTags">Tags</label> <input type="text"
												id="productTags" name="product_tags"
												placeholder="e.g., sale, new, bestseller">
										</div>
									</div>
									<div class="form-group">
										<label for="productImage">Product Image *</label> <input
											type="file" id="productImage" name="product_image"
											accept="image/*" required>
									</div>
									<button class="checkout-btn" type="submit">Add Product</button>
								</form>
								<a href="#" class="back-btn">← Back to Dashboard</a>
							</div>

							<div class="cart-section">
								<div class="payments">
									<h3>PREVIEW IMAGE</h3>
									<div class="payment-icons">
										<img id="previewImage" src="" alt="No image uploaded"
											style="width: 100%;">
										<button id="removeImage" style="display: none;">X</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
		const productImageInput = document.getElementById('productImage');
		const previewImage = document.getElementById('previewImage');
		const removeImageButton = document.getElementById('removeImage');

		productImageInput.addEventListener('change', function(e) {
			const file = e.target.files[0];
			const reader = new FileReader();
			reader.onload = function() {
				previewImage.src = reader.result;
				previewImage.alt = "Product Image";
				removeImageButton.style.display = 'block';
			};
			if (file) {
				reader.readAsDataURL(file);
			}
		});

		removeImageButton.addEventListener('click', function() {
			previewImage.src = "";
			previewImage.alt = "No image uploaded";
			removeImageButton.style.display = 'none';
			productImageInput.value = ""; // Reset the file input
		});
	</script>

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
                                 ut labore et dolore magna aliqua. Ut enim ad minim
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
                                    <i class="fa fa-home" aria-hidden="true"></i> <span>Address:</span>
                                 </div>
                                 <div class="content-contact address-contact">
                                    <p>123 Suspendis matti, Visaosang Building VST District
                                       NY Accums, North American
                                    </p>
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