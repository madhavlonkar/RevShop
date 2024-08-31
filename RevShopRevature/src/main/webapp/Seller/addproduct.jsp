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
<style>
.logo {
	font-family: Arial, sans-serif; /* Or use a similar font */
	font-weight: 750; /* Extra bold */
	font-size: 24px; /* Adjust size as needed */
	color: #000000; /* Black color */
}
</style>
</head>
<body id="product-sidebar-left" class="product-grid-sidebar-left">

	<jsp:include page="/includes/header.jsp" />

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
										<li><a href="#"> <span>Add Product</span>
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
									enctype="multipart/form-data" onsubmit="return validateForm()">
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
									<div class="form-row">
										<div class="form-group">

											<label for="productImage">Product Image *</label> <input
												type="file" id="productImage" name="product_image"
												accept="image/*" required>
										</div>

										<div class="form-group">
											<label for="Threshold">Threshold</label> <input type="text"
												id="threshold" name="threshold"
												placeholder="Threshold For Product">
										</div>
									</div>

									<button class="checkout-btn" type="submit">Add Product</button>
								</form>
								<a href="ProductMaintenanceServlet" class="back-btn">←
									Back to Dashboard</a>
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

	<script>
		function validateForm() {
			const productName = document.getElementById('productName').value
					.trim();
			const productCategory = document.getElementById('productCategory').value;
			const productPrice = document.getElementById('productPrice').value
					.trim();
			const productDiscount = document.getElementById('productDiscount').value
					.trim();
			const productStock = document.getElementById('productStock').value
					.trim();
			const productBrand = document.getElementById('productBrand').value
					.trim();
			const productDescription = document
					.getElementById('productDescription').value.trim();
			const productStatus = document.getElementById('productStatus').value;
			const productImage = document.getElementById('productImage').files[0];
			const threshold = document.getElementById('threshold').value.trim();

			// Product Name Validation
			if (productName === "") {
				alert("Product Name is required.");
				return false;
			}

			// Product Category Validation
			if (productCategory === "") {
				alert("Please select a product category.");
				return false;
			}

			// Product Price Validation
			if (productPrice === "" || isNaN(productPrice)
					|| parseFloat(productPrice) <= 0) {
				alert("Please enter a valid product price greater than 0.");
				return false;
			}

			// Product Discount Validation (Optional)
			if (productDiscount !== ""
					&& (isNaN(productDiscount)
							|| parseFloat(productDiscount) < 0 || parseFloat(productDiscount) > 100)) {
				alert("Please enter a valid discount percentage between 0 and 100.");
				return false;
			}

			// Product Stock Validation
			if (productStock === "" || isNaN(productStock)
					|| parseInt(productStock) < 0) {
				alert("Please enter a valid stock quantity of 0 or more.");
				return false;
			}

			// Product Brand Validation
			if (productBrand === "") {
				alert("Product Brand is required.");
				return false;
			}

			// Product Description Validation
			if (productDescription === "") {
				alert("Product Description is required.");
				return false;
			}

			// Product Status Validation
			if (productStatus === "") {
				alert("Please select a product status.");
				return false;
			}

			// Product Image Validation
			if (!productImage) {
				alert("Product Image is required.");
				return false;
			}

			// Validate image type (should be an image file)
			const allowedTypes = [ 'image/jpeg', 'image/png', 'image/gif',
					'image/webp' ];
			if (!allowedTypes.includes(productImage.type)) {
				alert("Please upload a valid image file (JPEG, PNG, GIF, WebP).");
				return false;
			}

			// Threshold Validation (Optional)
			if (threshold !== ""
					&& (isNaN(threshold) || parseInt(threshold) < 0)) {
				alert("Please enter a valid threshold value of 0 or more.");
				return false;
			}

			// If all validations pass
			return true;
		}

		// Attach validation function to the form submission
		document.querySelector('form').onsubmit = validateForm;
	</script>


	<jsp:include page="/includes/footer.jsp" />
</body>
</html>