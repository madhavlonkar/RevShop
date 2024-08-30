<%@ page import="java.util.List"%>
<%@ page import="com.revshop.Entity.CartEntity"%>
<%@ page import="com.revshop.Entity.UserEntity"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%
UserEntity userDetails = (UserEntity) request.getAttribute("userDetails");
List<CartEntity> cartItems = (List<CartEntity>) request.getAttribute("cartItems");

double totalAmount = 0;
if (cartItems != null && !cartItems.isEmpty()) {
    for (CartEntity item : cartItems) {
        double priceAfterDiscount = item.getProductPrice() * (1 - item.getProductDiscount() / 100.0);
        double itemTotal = priceAfterDiscount * item.getQuantity();
        totalAmount += itemTotal;
    }
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <style>
        .logo {
            font-family: Arial, sans-serif;
            font-weight: 750;
            font-size: 24px;
            color: #000000;
        }
        .section-divider {
            margin: 20px 0;
            font-weight: bold;
            text-align: center;
            color: #333;
        }
        .product-summary {
            margin: 20px 0;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        .product-summary h4 {
            font-weight: bold;
            margin-bottom: 10px;
        }
        .product-item {
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;
        }
        .product-item span {
            display: inline-block;
            margin-right: 10px;
        }
        .product-total {
            font-weight: bold;
        }
        .checkout-container {
            display: flex;
            justify-content: space-between;
        }
        .checkout-form {
            flex: 0 0 65%;
            margin-right: 20px;
        }
        .order-summary {
            flex: 0 0 30%;
        }
        .checkout-form form {
            text-align: left;
        }
        .checkout-form .form-group {
            text-align: left;
            margin-bottom: 15px;
        }
        .checkout-form .form-control {
            width: 100%;
            text-align: left;
            margin: 0;
            padding: 10px;
            box-sizing: border-box;
        }
        .checkout-form .btn-primary {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            font-weight: bold;
        }
        .product-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 10px;
        }
        .product-item span {
            flex: 1;
            text-align: left;
        }
        .product-item span:nth-child(2) {
            text-align: center;
            flex: 0 0 50px;
        }
        .product-item span:nth-child(3) {
            text-align: right;
            flex: 0 0 100px;
        }
    </style>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checkout</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;600&display=swap" rel="stylesheet">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="keywords" content="Furniture, Decor, Interior">
    <meta name="description" content="Furnitica - Minimalist Furniture HTML Template">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="Static/libs/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="Static/libs/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="Static/libs/nivo-slider/css/nivo-slider.css">
    <link rel="stylesheet" href="Static/libs/nivo-slider/css/animate.css">
    <link rel="stylesheet" href="Static/libs/nivo-slider/css/style.css">
    <link rel="stylesheet" href="Static/libs/font-material/css/material-design-iconic-font.min.css">
    <link rel="stylesheet" href="Static/libs/slider-range/css/jslider.css">
    <link rel="stylesheet" href="Static/libs/owl-carousel/assets/owl.carousel.min.css">
    <link rel="stylesheet" type="text/css" href="Static/css/style.css">
    <link rel="stylesheet" type="text/css" href="Static/css/reponsive.css">
</head>
<body class="user-login blog">
    <jsp:include page="/includes/header.jsp" />
    <div class="main-content">
        <div class="wrap-banner">
            <nav class="breadcrumb-bg">
                <div class="container no-index">
                    <div class="breadcrumb">
                        <ol>
                            <li><span>Home</span></li>
                            <li><span>Checkout</span></li>
                        </ol>
                    </div>
                </div>
            </nav>
        </div>
        <div id="wrapper-site">
            <div>
                <div class="row">
                    <div id="content-wrapper">
                        <div id="main">
                            <div id="content" class="page-content">
                                <div class="checkout-form">
                                    <h1 class="text-center title-page">Checkout</h1>
                                    <div id="error-message" style="color: red; font-weight: bold; text-align: center;">
                                    </div>
                                    <br>
                                    <% if (cartItems == null || cartItems.isEmpty()) { %>
													<div class="alert alert-warning">You have no Item in Cart
														.</div>
                                    <% } else { %>
                                    <div class="order-summary">
                                        <div class="section-divider">Order Summary</div>
                                        <div class="product-summary">
                                            <h4>Products</h4>
                                            <%
                                            for (CartEntity item : cartItems) {
                                                double priceAfterDiscount = item.getProductPrice() * (1 - item.getProductDiscount() / 100.0);
                                                double itemTotal = priceAfterDiscount * item.getQuantity();
                                            %>
                                            <div class="product-item">
                                                <span><%=item.getProductName()%></span> <span>X <%=item.getQuantity()%></span>
                                                <span class="product-total">Rs. <%=String.format("%.2f", itemTotal)%></span>
                                            </div>
                                            <%
                                            }
                                            %>
                                            <div class="product-item">
                                                <strong>Total Amount:</strong> <strong class="product-total">Rs.
                                                    <%=String.format("%.2f", totalAmount)%></strong>
                                            </div>
                                        </div>
                                    </div>
                                    <form id="checkout-form"
                                        action="CheckoutServlet" method="POST">
                                        <!-- Personal Details Section -->
                                        <div class="section-divider">Personal Details</div>
                                        <div class="row">
                                            <div class="form-group col-md-6">
                                                <input class="form-control" name="firstName" type="text"
                                                    placeholder="First Name"
                                                    value="<%=userDetails.getFirstName()%>" readonly>
                                            </div>
                                            <div class="form-group col-md-6">
                                                <input class="form-control" name="lastName" type="text"
                                                    placeholder="Last Name"
                                                    value="<%=userDetails.getLastName()%>" readonly>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="form-group col-md-6">
                                                <input class="form-control" name="gender" type="text"
                                                    placeholder="Gender" value="<%=userDetails.getGender()%>"
                                                    readonly>
                                            </div>
                                            <div class="form-group col-md-6">
                                                <input class="form-control" name="mobile" type="text"
                                                    placeholder="Mobile" value="<%=userDetails.getMobile()%>"
                                                    readonly>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="form-group col-md-12">
                                                <input class="form-control" name="email" type="email"
                                                    placeholder="Email" value="<%=userDetails.getEmail()%>"
                                                    readonly>
                                            </div>
                                        </div>

                                        <!-- Shipping Address Section -->
                                        <div class="section-divider">Shipping Address</div>
                                        <div class="row">
                                            <div class="form-group col-md-6">
                                                <input class="form-control" name="address" type="text"
                                                    placeholder="Address">
                                            </div>
                                            <div class="form-group col-md-6">
                                                <input class="form-control" name="city" type="text"
                                                    placeholder="City">
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="form-group col-md-6">
                                                <input class="form-control" name="state" type="text"
                                                    placeholder="State">
                                            </div>
                                            <div class="form-group col-md-6">
                                                <input class="form-control" name="zip" type="text"
                                                    placeholder="Zip Code">
                                            </div>
                                        </div>

                                        <!-- Razorpay integration -->
                                        <input type="hidden" name="payment_id" id="payment_id" value="">
                                        <div class="clearfix text-center">
                                            <button type="button" class="btn btn-primary" onclick="payNow()">Pay Now</button>
                                        </div>
                                    </form>
                                    <% } %>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="/includes/footer.jsp" />
    
    <!-- Razorpay integration -->
    <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
    <script>
        function payNow() {
        	var amountInPaise = Math.round(<%=totalAmount * 100%>);
            var options = {
                "key": "rzp_test_wquKp1Dkyy2Nck",
                "amount": amountInPaise,
                "currency": "INR",
                "name": "Rev Shop",
                "description": "Test Transaction",
                "image": "https://example.com/your_logo",
                "handler": function (response) {
                    alert("Payment successful!");
                    var payment_id = response.razorpay_payment_id;
                    document.getElementById('payment_id').value = payment_id;
                    document.getElementById('checkout-form').submit();
                },
                "prefill": {
                    "name": "<%=userDetails.getFirstName() + ' ' + userDetails.getLastName()%>",
                    "email": "<%=userDetails.getEmail()%>",
                    "contact": "<%=userDetails.getMobile()%>"
                },
                "notes": {
                    "address": "<%=userDetails.getShippingAddress()%>"
                },
                "theme": {
                    "color": "#3399cc"
                }
            };

            var rzp1 = new Razorpay(options);
            rzp1.open();
        }
    </script>
</body>
</html>
