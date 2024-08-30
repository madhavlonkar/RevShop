<header>
		<%
		HttpSession s = request.getSession(false); // Use false to prevent creating a new session if one doesn't exist
		com.revshop.Entity.LoginEntity user = (com.revshop.Entity.LoginEntity) (s != null ? s.getAttribute("user") : null);
		%>
		<div class="header-top d-xs-none">
			<div class="container">
				<div class="row">
					<!-- logo -->
					<div class="col-sm-2 col-md-2 d-flex align-items-center">
						<div id="logo">
							<a href="HomeServlet?category=Electronics"> <span
								class="logo"> RevShop </span>
							</a>
						</div>
					</div>
					<!-- menu -->
					<div
						class="col-sm-5 col-md-5 align-items-center justify-content-center navbar-expand-md main-menu">
						<div class="menu navbar collapse navbar-collapse">
							<ul class="menu-top navbar-nav">
								<li><a href="HomeServlet?category=Electronics"
									class="parent">Home</a></li>
								<li><a href="HomeServlet?category=Electronics"
									class="parent">Categories</a>
									<div class="dropdown-menu">
										<ul>
											<li class="item"><a
												href="HomeServlet?category=Electronics" title="Electronics">Electronics</a></li>
											<li class="item"><a href="HomeServlet?category=Fashion"
												title="Fashion">Fashion</a></li>
											<li class="item"><a
												href="HomeServlet?category=HomeAppliances"
												title="Home Appliances">Home Appliances</a></li>
											<li class="item"><a href="HomeServlet?category=Books"
												title="Books">Books</a></li>
											<li class="item"><a href="HomeServlet?category=Sports"
												title="Sports">Sports</a></li>
										</ul>
									</div></li>
								<li><a href="OrderServletMain" class="parent">Order
										History</a></li>
								<li><a href="FavriouteServletMain" class="parent">Favorites</a></li>
							</ul>
						</div>
					</div>
					<!-- search and account -->
					<div
						class="col-sm-5 col-md-5 d-flex align-items-center justify-content-end"
						id="search_widget">
						<form method="get" action="HomeServlet">
							<input type="hidden" name="category"> <input type="text"
								name="s" value="" placeholder="Search"
								class="ui-autocomplete-input" autocomplete="off">
							<button type="submit">
								<i class="fa fa-search"></i>
							</button>
						</form>
						<div id="block_myaccount_infos" class="hidden-sm-down dropdown">
							<div class="myaccount-title">
								<a href="#acount" data-toggle="collapse" class="acount"> <i
									class="fa fa-user" aria-hidden="true"></i> <span>Account</span>
									<i class="fa fa-angle-down" aria-hidden="true"></i>
								</a>
							</div>
							<div id="acount" class="collapse">
								<div class="account-list-content">
									<%
									if (user != null) {
									%>
									<!-- Check if the user is logged in -->
									<!-- My Account Link -->
									<div>
										<a class="login" href="UserAccountServlet" rel="nofollow"
											title="Log in to your customer account"> <i
											class="fa fa-cog"></i> <span>My Account</span>
										</a>
									</div>
									<!-- Checkout Link -->
									<div>
										<a class="check-out" href="CheckoutServlet" rel="nofollow"
											title="Checkout"> <i class="fa fa-check"
											aria-hidden="true"></i> <span>Checkout</span>
										</a>
									</div>
									<!-- Seller Dashboard Link (only for sellers) -->
									<%
									if ("seller".equals(user.getRole())) {
									%>
									<!-- Check if the user role is 'seller' -->
									<div>
										<a class="seller-dashboard" href="ProductMaintenanceServlet"
											rel="nofollow" title="Seller Dashboard"> <i
											class="fa fa-tachometer-alt"></i> <span>Seller
												Dashboard</span>
										</a>
									</div>
									<%
									}
									%>
									<!-- Log Out Link -->
									<div class="link_wishlist">
										<a href="LoginAndRegistration/user-login.jsp" title="Log Out"> <i
											class="fa fa-heart"></i> <span>Log Out</span>
										</a>
									</div>
									<%
									} else {
									%>
									<!-- If the user is not logged in -->
									<!-- Sign In Link -->
									<div>
										<a class="login" href="LoginAndRegistration/user-login.jsp"
											rel="nofollow" title="Log in to your customer account"> <i
											class="fa fa-sign-in"></i> <span>Sign in</span>
										</a>
									</div>
									<!-- Register Link -->
									<div>
										<a class="register"
											href="LoginAndRegistration/user-register.jsp" rel="nofollow"
											title="Register Account"> <i class="fa fa-user"></i> <span>Register
												Account</span>
										</a>
									</div>
									<%
									}
									%>
								</div>
							</div>
						</div>
						<%
						if (user != null) {
						%>
						<div class="desktop_cart">
							<div class="blockcart block-cart cart-preview tiva-toggle">
								<div class="header-cart tiva-toggle-btn">
									<span class="cart-products-count">1</span> <a
										href="CartServlet?userId=<%=user.getUserId()%>"> <i
										class="fa fa-shopping-cart" aria-hidden="true"></i>
									</a>
								</div>
							</div>
						</div>
						<%
						} else {
						%>
						<div class="desktop_cart">
							<div class="blockcart block-cart cart-preview tiva-toggle">
								<div class="header-cart tiva-toggle-btn">
									<span class="cart-products-count">1</span> <a
										href="LoginAndRegistration/user-login.jsp"> <i
										class="fa fa-shopping-cart" aria-hidden="true"></i>
									</a>
								</div>
							</div>
						</div>
						<%
						}
						%>
					</div>
				</div>
			</div>
		</div>
	</header>