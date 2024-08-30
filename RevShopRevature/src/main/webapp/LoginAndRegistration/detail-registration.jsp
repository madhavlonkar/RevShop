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
		HttpSession s = request.getSession(false); // Use false to prevent creating a new session if one doesn't exist
		com.revshop.Entity.LoginEntity user = (com.revshop.Entity.LoginEntity) (s != null ? s.getAttribute("user") : null);
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
										method="POST">
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

										<%
										// Retrieve the LoginEntity object from the session

										// Add a hidden field to pass the userId or email for updating the user
										if (user != null) {
										%>
										<input type="hidden" name="userId"
											value="<%=user.getUserId()%>"> <input type="hidden"
											name="email" value="<%=user.getEmail()%>">
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
	<jsp:include page="/includes/footer.jsp" />
</body>
</html>