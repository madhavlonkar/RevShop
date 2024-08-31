<%@ page import="com.revshop.Entity.LoginEntity"%>
<!DOCTYPE html>
<html lang="en">
<head>
<style>
.section-divider {
	margin: 20px 0;
	font-weight: bold;
	text-align: center;
	color: #333;
}

.logo {
	font-family: Arial, sans-serif; /* Or use a similar font */
	font-weight: 750; /* Extra bold */
	font-size: 24px; /* Adjust size as needed */
	color: #000000; /* Black color */
}
</style>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Register</title>
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
</head>
<body class="user-login blog">
	<%
		// Retrieve the LoginEntity object from the request attribute "Firstuser"
		com.revshop.Entity.LoginEntity user = (com.revshop.Entity.LoginEntity) request.getAttribute("Firstuser");
	%>
	<jsp:include page="/includes/header.jsp" />
	<!-- main content -->
	<div class="main-content">
		<div class="wrap-banner">
			<!-- breadcrumb -->
			<nav class="breadcrumb-bg">
				<div class="container no-index">
					<div class="breadcrumb">
						<ol>
							<li><span>Home</span></li>
							<li><span>Register</span></li>
						</ol>
					</div>
				</div>
			</nav>
		</div>
		<!-- main -->
		<div id="wrapper-site">
			<div class="container">
				<div class="row">
					<div id="content-wrapper"
						class="col-xs-12 col-sm-12 col-md-12 col-lg-12 onecol">
						<div id="main">
							<div id="content" class="page-content">
								<div class="register-form text-center">
									<h1 class="text-center title-page">Details Registration</h1>
									<div id="error-message"
										style="color: red; font-weight: bold; text-align: center;">
										<%
										if (request.getAttribute("RegistererrorMessage") != null) {
										%>
										<%=request.getAttribute("RegistererrorMessage")%>
										<%
										}
										%>
									</div>
									<br>
									<form id="customer-form"
										action="/RevShopRevature/DetailRegistrationServlet"
										method="POST" onsubmit="return validateForm()">
										
										<!-- Email Section (display only, no input) -->
										<div class="row">
											<div class="form-group col-md-12">
												<label>Email:</label>
												<p><strong><%= user != null ? user.getEmail() : "" %></strong></p>
												<input type="hidden" name="email" value="<%=user != null ? user.getEmail() : "" %>">
											</div>
										</div>

										<!-- Personal Details Section -->
										<div class="section-divider">------------------------Personal
											Details-------------------------</div>
										<div class="row">
											<div class="form-group col-md-6">
												<input class="form-control" name="firstName" type="text"
													placeholder="First Name">
											</div>
											<div class="form-group col-md-6">
												<input class="form-control" name="lastName" type="text"
													placeholder="Last Name">
											</div>
										</div>
										<div class="row">
											<div class="form-group col-md-6">
												<select class="form-control" name="gender">
													<option value="" disabled selected>Select Gender</option>
													<option value="male">Male</option>
													<option value="female">Female</option>
													<option value="other">Other</option>
												</select>
											</div>
											<div class="form-group col-md-6">
												<input class="form-control" name="mobile" type="text"
													placeholder="Mobile">
											</div>
										</div>
										<div class="row">
											<div class="form-group col-md-6">
												<input class="form-control" name="pincode" type="text"
													placeholder="Pincode">
											</div>
											<div class="form-group col-md-12">
												<textarea class="form-control" name="billingAddress"
													rows="4" placeholder="Billing Address"
													style="height: 100px;"></textarea>
											</div>
										</div>

										<!-- Hidden field for user ID -->
										<%
										// Add a hidden field to pass the userId for updating the user
										if (user != null) {
										%>
										<input type="hidden" name="userId" value="<%=user.getUserId()%>">
										<%
										}

										// Check if the user object is not null and if the role is "seller"
										if (user != null && "seller".equals(user.getRole())) {
										%>
										<!-- Company Details Section -->
										<div class="section-divider">------------------------Company
											Details------------------------</div>
										<div class="row">
											<div class="form-group col-md-6">
												<input class="form-control" name="companyName" type="text"
													placeholder="Company Name">
											</div>
											<div class="form-group col-md-6">
												<input class="form-control" name="gstNumber" type="text"
													placeholder="GST Number">
											</div>
										</div>
										<div class="row">
											<div class="form-group col-md-6">
												<input class="form-control" name="websiteUrl" type="text"
													placeholder="Website URL">
											</div>
											<div class="form-group col-md-6">
												<input class="form-control" name="panNumber" type="text"
													placeholder="PAN Number">
											</div>
										</div>

										<!-- Banking Details Section -->
										<div class="section-divider">------------------------Banking
											Details-------------------------</div>
										<div class="row">
											<div class="form-group col-md-6">
												<input class="form-control" name="bankAccountNo" type="text"
													placeholder="Bank Account Number">
											</div>
											<div class="form-group col-md-6">
												<input class="form-control" name="ifsc" type="text"
													placeholder="IFSC Code">
											</div>
										</div>
										<%
										}
										%>

										<div class="clearfix text-center">
											<button class="btn btn-primary" data-link-action="sign-in"
												type="submit">Submit Information</button>
										</div>
									</form>
									<!-- Optional CSS for better visual separation -->
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- footer -->
	<script>
		function validateForm() {
			// Validate personal details
			const firstName = document.forms["customer-form"]["firstName"].value;
			const lastName = document.forms["customer-form"]["lastName"].value;
			const gender = document.forms["customer-form"]["gender"].value;
			const mobile = document.forms["customer-form"]["mobile"].value;
			const pincode = document.forms["customer-form"]["pincode"].value;
			const billingAddress = document.forms["customer-form"]["billingAddress"].value;

			// Validate company details (only if user is a seller)
			const companyName = document.forms["customer-form"]["companyName"] ? document.forms["customer-form"]["companyName"].value
					: null;
			const gstNumber = document.forms["customer-form"]["gstNumber"] ? document.forms["customer-form"]["gstNumber"].value
					: null;
			const websiteUrl = document.forms["customer-form"]["websiteUrl"] ? document.forms["customer-form"]["websiteUrl"].value
					: null;
			const panNumber = document.forms["customer-form"]["panNumber"] ? document.forms["customer-form"]["panNumber"].value
					: null;
			const bankAccountNo = document.forms["customer-form"]["bankAccountNo"] ? document.forms["customer-form"]["bankAccountNo"].value
					: null;
			const ifsc = document.forms["customer-form"]["ifsc"] ? document.forms["customer-form"]["ifsc"].value
					: null;

			// Personal details validation
			if (firstName.trim() === "") {
				alert("First Name is required.");
				return false;
			}
			if (lastName.trim() === "") {
				alert("Last Name is required.");
				return false;
			}
			if (gender === "") {
				alert("Please select your gender.");
				return false;
			}
			if (!/^\d{10}$/.test(mobile)) {
				alert("Please enter a valid 10-digit mobile number.");
				return false;
			}
			if (!/^\d{6}$/.test(pincode)) {
				alert("Please enter a valid 6-digit pincode.");
				return false;
			}
			if (billingAddress.trim() === "") {
				alert("Billing Address is required.");
				return false;
			}

			// Company details validation (only if user is a seller)
			if (companyName !== null && companyName.trim() === "") {
				alert("Company Name is required for sellers.");
				return false;
			}
			if (gstNumber !== null && !/^\d{15}$/.test(gstNumber)) {
				alert("Please enter a valid 15-digit GST Number.");
				return false;
			}
			if (websiteUrl !== null && websiteUrl.trim() !== ""
					&& !/^https?:\/\/.+/.test(websiteUrl)) {
				alert("Please enter a valid website URL.");
				return false;
			}
			if (panNumber !== null
					&& !/^[A-Z]{5}[0-9]{4}[A-Z]{1}$/.test(panNumber)) {
				alert("Please enter a valid PAN Number.");
				return false;
			}
			if (bankAccountNo !== null && !/^\d+$/.test(bankAccountNo)) {
				alert("Please enter a valid Bank Account Number.");
				return false;
			}
			if (ifsc !== null && !/^[A-Z]{4}0[A-Z0-9]{6}$/.test(ifsc)) {
				alert("Please enter a valid IFSC Code.");
				return false;
			}

			return true; // If all validations pass
		}
	</script>

	<jsp:include page="/includes/footer.jsp" />
</body>
</html>
