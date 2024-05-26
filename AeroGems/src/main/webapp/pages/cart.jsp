<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<%@page import="model.userDetail"%>



<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>AeroGems | Cart</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/style/cart.css" />
<link rel="apple-touch-icon" sizes="180x180"
	href="${pageContext.request.contextPath}/images/favicon/apple-touch-icon.png" />
<link rel="icon" type="image/png" sizes="32x32"
	href="${pageContext.request.contextPath}/images/favicon/favicon-32x32.png" />
<link rel="icon" type="image/png" sizes="16x16"
	href="${pageContext.request.contextPath}/images/favicon/favicon-16x16.png" />
<link rel="manifest"
	href="${pageContext.request.contextPath}/images/favicon/site.webmanifest" />
</head>

<body>

	<%
	String purchaseSuccess = (String) request.getAttribute("purchaseSuccess");
	%>
	<%
	if (purchaseSuccess != null) {
	%>
	<div class="overlay" style="display: block"></div>
    <div class="modal" style="display: block">
      <div class="delete_txt">
        <p><%=purchaseSuccess%></p>
        <button class="dismiss" onClick="hideModal()">Dismiss</button>
      </div>
    </div>
	
	
	
	
	<%
	}
	%>


	



	<sql:setDataSource var="dbConnection" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/coursework" user="root" password="" />
	<div class="margin">
		<!-- Header section containing logo in left and icons in right. -->
		<div class="header">
			<!-- logo -->
			<div class="header-left">
				<a href="${pageContext.request.contextPath}/index.jsp"> <img
					src="${pageContext.request.contextPath}/images/logo.png" alt="" />
				</a>
			</div>
			<%
			HttpSession sessionName = request.getSession(false);

			String userName = (String) sessionName.getAttribute("user");
			%>
			<sql:query var="users" dataSource="${dbConnection}">
				
				SELECT name, image FROM `register` WHERE email = "<%=userName%>";
				
			</sql:query>



			<!-- icons -->
			<div class="header-right">
				<ul>
					<li><c:forEach var="userDetail" items="${users.rows}">
							<div class="info">
								<a href="${pageContext.request.contextPath}/pages/profile.jsp">
									<img
									src="${pageContext.request.contextPath}/images/user/${userDetail.image}"
									alt="image" srcset="" class="icon" />
								</a>
								<p>
									<c:out value="${userDetail.name} " />
								</p>
							</div>
						</c:forEach></li>
				</ul>
			</div>
		</div>
	</div>

	<p class="common-text">Cart</p>
	<%
	userDetail obj = new userDetail();
	int id = obj.userId(userName);
	boolean empty = true;
	%>

	<sql:query var="item" dataSource="${dbConnection}">
			SELECT cart.cart_id, product.product_name, product.product_type, product.category, product.rating, product.price, product.product_image FROM cart,product WHERE cart.product_id = product.product_id AND  cart.user_id = <%=id%>;
	</sql:query>

	<div class="table">
		<table>
			<thead>
				<tr>
					<th>Name</th>
					<th>Type</th>
					<th>Category</th>
					<th>Rating</th>
					<th>Price</th>
					<th>Image</th>
					<th>Action</th>
				</tr>
			</thead>

			<tbody>
				<c:forEach var="productDetail" items="${item.rows}">
					<tr>
						<%
						empty = false;
						%>
						<td><c:out value="${productDetail.product_name}" /></td>
						<td><c:out value="${productDetail.product_type}" /></td>
						<td><c:out value="${productDetail.category}" /></td>
						<td><c:out value="${productDetail.rating}" /></td>
						<td>$<c:out value="${productDetail.price}" /></td>
						<td><img
							src="${pageContext.request.contextPath}/images/product/${productDetail.product_image}"
							alt="Product 1" /></td>
						<td>


							
									<form action="${pageContext.request.contextPath}/deleteCart"
										method="post">
										<input type="hidden" name="cartId"
											value="<c:out value='${productDetail.cart_id}'/>" /> 
											<input type="hidden" name="mode" value="delete" />
										<button class="delete">Clear</button>
									</form>
									

							


						</td>
					</tr>
				</c:forEach>

				<%
				if (empty) {
				%>
				<tr>
					<td colspan=7>
						<p style="margin: 2.05rem"><%="Cart Is Empty"%></p>
					</td>
				</tr>
				<%
				}
				%>

			</tbody>


		</table>

	</div>



	<%
	if (!empty) {
	%>

	<form action="${pageContext.request.contextPath}/deleteCart"
		method="post">
		<input type="hidden" name="checkOut" value="<%=id%>"> <input
			type="hidden" name="mode" value="checkout">
		<button class="checkout-button">Checkout</button>
	</form>

	<%
	}
	%>

	<!--Footer section of website containing copyright information-->
	<footer class="final">
		<div class="footer">
			<div class="footer-left">
				<h3 style="margin: 2% 0 2% 0">About company</h3>
				<p>AeroGems is a premier online destination for drone enthusiasts and professionals alike.
				 Since our launch, we have proudly served a growing community of customers, delivering close to 
				 200 high-quality drones. Our focus is on innovation, reliability, and customer satisfaction, ensuring that every product in our catalog offers exceptional performance and value.</p>
				
				
					<div class="footer-right">
				<center style="padding-top: 5%">
					<img src="images/logo.png" alt="" srcset="" width="70%" />
				</center>
				<br />
				<div class="social-media">
					<ul>
						<li><a href="#"><img
								src="images/icons/facebook.png" alt="" srcset="" class="icon" /></a>
						</li>

						<li><a href="#"><img
								src="images/icons/insta.png" alt="" srcset="" class="icon" /></a>
						</li>

						<li><a href="#"><img
								src="images/icons/tiktok.png" alt="" srcset="" class="icon" /></a>
						</li>
					</ul>
				</div>
			</div>
	</footer>
	<!-- Endnote -->
	<div class="copyright">
		<br> &copy2024 AeroGems. All Rights Reserved. <br />
	</div>
	</div>
	
	<script>
		
		function hideModal() {
			document.querySelector(".overlay").style.display = "none";
			document.querySelector(".modal").style.display = "none";
		}

		document.querySelector(".cancel").addEventListener("click", hideModal);
	</script>

</body>
</html>