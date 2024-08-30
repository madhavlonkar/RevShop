<%@ page import="java.util.List"%>
<%@ page import="com.revshop.Entity.OrderEntity"%>
<%@ page import="com.revshop.Entity.LoginEntity"%>

<%
List<OrderEntity> orders = (List<OrderEntity>) request.getAttribute("orders");
LoginEntity user = (LoginEntity) session.getAttribute("user");
String role = (user != null) ? user.getRole() : "";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>My Orders</title>
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
	font-family: Arial, sans-serif;
	font-weight: 750;
	font-size: 24px;
	color: #000000;
}
/* Custom styles */
.order-table img {
	max-width: 100%;
	height: auto;
}

.order-details {
	background-color: #f8f9fa;
	padding: 15px;
	border: 1px solid #ddd;
	margin-top: 10px;
	border-radius: 5px;
}
</style>
</head>

<body class="product-cart checkout-cart blog">
	<jsp:include page="/includes/header.jsp" />

	<!-- main content -->
	<div class="main-content" id="orders">
		<!-- main -->
		<div id="wrapper-site">
			<!-- breadcrumb -->
			<nav class="breadcrumb-bg">
				<div class="container no-index">
					<div class="breadcrumb">
						<ol>
							<li><a href="#"> <span>Home</span></a></li>
							<li><a href="#"> <span>Orders</span></a></li>
						</ol>
					</div>
				</div>
			</nav>
			<div class="container">
				<div class="row">
					<div id="content-wrapper"
						class="col-xs-12 col-sm-12 col-md-12 col-lg-12 onecol">
						<section id="main">
							<h1 class="title-page">My Orders</h1>

							<% if ("seller".equals(role)) { %>
								<button class="btn btn-primary" type="button" 
									onclick="location.href='OrderServletMain?action=myOrders'">My Orders</button>
							<% } %>
							
							<div class="order-container">
								<%
								if (orders != null && !orders.isEmpty()) {
								%>
								<!-- Orders Table -->
								<table class="table table-striped order-table">
									<thead>
										<tr>
											<th>Image</th>
											<th>Product Name</th>
											<th>Price</th>
											<th>Status</th>
											<th>Action</th>
										</tr>
									</thead>
									<tbody>
										<%
										for (OrderEntity order : orders) {
											double totalPrice = order.getTotalPrice() * order.getQuantity();
										%>
										<tr>
											<td style="width: 100px; text-align: center;"><img
												src="<%=order.getImgUrl()%>"
												alt="<%=order.getProductName()%>"
												style="width: 100px; height: auto;"></td>
											<td><%=order.getProductName()%></td>
											<td>Rs. <%=String.format("%.2f", order.getTotalPrice())%></td>
											<td>
												<%
												if ("seller".equals(role) && !"myOrders".equals(request.getParameter("action"))) {
												%>
												<form method="post" action="OrderServletMain">
													<input type="hidden" name="orderId"
														value="<%=order.getOrderId()%>"> <input
														type="hidden" name="action" value="updateStatus">
													<select name="status" onchange="this.form.submit()">
														<option value="To Be Shipped"
															<%="To Be Shipped".equals(order.getStatus()) ? "selected" : ""%>>To
															Be Shipped</option>
														<option value="In Transit"
															<%="In Transit".equals(order.getStatus()) ? "selected" : ""%>>In
															Transit</option>
														<option value="Delivered"
															<%="Delivered".equals(order.getStatus()) ? "selected" : ""%>>Delivered</option>
														<option value="Cancelled"
															<%="Cancelled".equals(order.getStatus()) ? "selected" : ""%>>Cancelled</option>
													</select>
												</form> <%
												} else {
												%> <%=order.getStatus()%> <%
												}
												%>
											</td>
											<td>
												<button class="btn btn-primary" type="button"
													onclick="toggleDetails(this, 'details<%=order.getOrderId()%>')">
													Show Details</button>
											</td>
										</tr>
										<tr>
											<td colspan="5">
												<div class="order-details"
													id="details<%=order.getOrderId()%>" style="display: none;">
													<p>
														<strong>Order ID:</strong>
														<%=order.getOrderId()%></p>
													<p>
														<strong>Transaction ID:</strong>
														<%=order.getTranscationId()%></p>
													<p>
														<strong>Shipping Address:</strong>
														<%=order.getShippingAddress()%></p>
													<p>
														<strong>Quantity:</strong>
														<%=order.getQuantity()%></p>
													<p>
														<strong>Total Price:</strong> Rs.
														<%=String.format("%.2f", totalPrice)%></p>
												</div>
											</td>
										</tr>
										<%
										}
										%>
									</tbody>
								</table>
								<%
								} else {
								%>
								<div class="alert alert-warning">No orders found.</div>
								<%
								}
								%>
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
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

	<script>
		function toggleDetails(button, detailsId) {
			var detailsDiv = document.getElementById(detailsId);

			if (detailsDiv.style.display === "none"
					|| detailsDiv.style.display === "") {
				detailsDiv.style.display = "block";
				button.textContent = "Hide Details";
			} else {
				detailsDiv.style.display = "none";
				button.textContent = "Show Details";
			}
		}
	</script>
	
	<jsp:include page="/includes/footer.jsp" />
</body>
</html>
