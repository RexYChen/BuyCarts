<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>list cart page</title>
	<script type="text/javascript">
		function deleteItem(id){
			var b = window.confirm("Are you sure delete?");
			if(b){
				window.location.href="${pageContext.request.contextPath}/servlet/DeleteServlet?id="+id;
			}
		}
		
		function clearCart(){
			var b =window.confirm("Are you sure clear cart?");
			if(b){
				window.location.href="${pageContext.request.contextPath}/servlet/ClearServlet";
			}
		}
		
		
		function changeQuantity(input,id,oldQuantity){
			var quantity = input.value;
			
			if(isNaN(quantity)){
				alert("please input number");
				input.value = oldQuantity;
				return;
			}
			
			if(quantity<0 || quantity != parseInt(quantity))
			{
				alert("please input legal number");
				input.value = oldQuantity;
				return;
			}
			
			var b = window.confirm("Are you sure change the number?");
			if(b){
				window.location.href="${pageContext.request.contextPath}/servlet/ChangeServlet?id="+id+"&quantity="+input.value;
			}
		
		}
		
	</script>
</head>

<body style="text-align:center">
	<h2>ORDER LIST</h2>
	<br />
	<center>
	
	<c:if test="${empty(cart.map)}">
		Please Select books first!
	</c:if>
	
	<c:if test="${!empty(cart.map)}">
		<table width="60%" border="1">
			<tr>
				<td>Bookname</td>
				<td>Author</td>
				<td>Price</td>
				<td>Quantity</td>
				<td>TatolPrice</td>
				<td>Operator</td>
			</tr>

			<c:forEach var="entry" items="${cart.map}">
				<tr>
					<td>${entry.value.book.name}</td>
					<td>${entry.value.book.author}</td>
					<td>${entry.value.book.price}</td>
					<td>
						<input type="text" name="quantity" value="${entry.value.quantity}" style="width:40px" onchange="changeQuantity(this,${entry.key},${entry.value.quantity})">
						
					</td>
					<td>${entry.value.price}</td>
					<td><a
						href="javascript:void(0)" onclick="deleteItem(${entry.key})">DELETE</a>
						
					</td>
				</tr>

			</c:forEach>

			<tr>
				<td colspan="3">TotalPrice</td>
				<td colspan="2">${cart.price}</td>
				<td colspan="1">
					<a href="javascript:void(0)" onclick="clearCart()">CLEAR</a>
				</td>
			</tr>
		</table>
		</c:if>
	</center>
</body>
</html>
