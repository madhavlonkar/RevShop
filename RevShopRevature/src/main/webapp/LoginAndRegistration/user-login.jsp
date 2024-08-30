<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login</title>
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
<body class="user-login blog">
	<%
	session.invalidate();
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
							<li><span>Login</span></li>
						</ol>
					</div>
				</div>
			</nav>
		</div>
		<!-- main -->
		<div id="wrapper-site">
			<div id="content-wrapper" class="full-width">
				<div id="main">
					<div class="container">
						<h1 class="text-center title-page">Log In</h1>
						<div class="login-form">
							<div id="error-message"
								style="color: red; font-weight: bold; text-align: center;">
								<%
								if (request.getAttribute("LoginerrorMessage") != null) {
								%>
								<%=request.getAttribute("LoginerrorMessage")%>
								<%
								}
								%>
							</div>
							<br>
							<form id="customer-form" action="/RevShopRevature/LoginServlet"
								method="POST">
								<div class="form-group no-gutters">
									<input class="form-control" name="email" type="email"
										placeholder="Email">
								</div>
								<div class="form-group no-gutters">
									<div class="input-group js-parent-focus">
										<input class="form-control js-child-focus js-visible-password"
											name="password" type="password" placeholder="Password">
									</div>
								</div>
								<div class="no-gutters text-center">
									<div class="forgot-password">
										<a href="user-reset-password.html" rel="nofollow"> Forgot
											your password? </a>
									</div>
								</div>
								<div class="clearfix text-center">
									<button class="btn btn-primary" data-link-action="sign-in"
										type="submit">Sign in</button>
								</div>
							</form>
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