<%@ page import="java.util.List"%>
<%@ page import="com.revshop.Entity.UserEntity" %>
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
    <jsp:include page="/includes/header.jsp" />

    <!-- main content -->
    <div class="main-content">
        <div class="wrap-banner">

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

            <div class="acount head-acount">
                <div class="container">
                    <div id="main">
                        <h1 class="title-page">My Account</h1>
                        <div class="content" id="block-history">
                            <table class="std table">
                    <tbody>
                        <%
                            // Retrieve the 'userDetails' object from the request attribute
                            UserEntity userDetails = (UserEntity) request.getAttribute("userDetails");

                            // Check if 'userDetails' is not null
                            if (userDetails != null) {
                        %>
                        <tr>
                            <th class="first_item">My Name :</th>
                            <td><%= userDetails.getFirstName() %> <%= userDetails.getLastName() %></td>
                        </tr>
                        <tr>
                            <th class="first_item">Email :</th>
                            <td><%= userDetails.getEmail() %></td>
                        </tr>
                        <tr>
                            <th class="first_item">Address :</th>
                            <td><%= userDetails.getBillingAddress() %></td>
                        </tr>
                        
                        <tr>
                            <th class="first_item">Postal/Zip Code :</th>
                            <td><%= userDetails.getPincode() %></td>
                        </tr>
                        <tr>
                            <th class="first_item">Phone :</th>
                            <td><%= userDetails.getMobile() %></td>
                        </tr>
                        <tr>
                            <th class="first_item">Gender :</th>
                            <td><%= userDetails.getGender() %></td>
                        </tr>
                        <%
                            } else {
                        %>
                        <tr>
                            <td colspan="2">No user details available.</td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>

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