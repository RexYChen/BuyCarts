<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>Book list page</title>
  </head>
  
  <body style ="text-align:center">
	<h1> BOOK LIST</h1>  
	<br/>
   <center>
   	<table width="60%" border="1">
   		<tr>
   			<td>Bookname</td>
   			<td>Author</td>
   			<td>Price</td>
   			<td>Description</td>
   			<td>Operator</td>
   		</tr>
   		
   		<c:forEach var="entry" items="${map}">
   			<tr>
	   			<td>${entry.value.name}</td>
	   			<td>${entry.value.author}</td>
	   			<td>${entry.value.price}</td>
	   			<td>${entry.value.description}</td>
	   			
	   			<td>
	   				<a href="${pageContext.request.contextPath}/servlet/BuyServlet?id=${entry.key}">BUY</a>
	   			</td>
   			</tr>
   		
   		</c:forEach>
   		
   	</table>
   </center>
  </body>
</html>
