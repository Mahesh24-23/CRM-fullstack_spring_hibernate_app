<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Form</title>
<link type="text/css" rel="stylesheet" 
href="${pageContext.request.contextPath}/resources/css/style.css"/>
<link type="text/css" rel="stylesheet" 
href="${pageContext.request.contextPath}/resources/css/add-customer-style.css"/>
</head>
<body>
  				<div id="wrapper">
  					<div id="header">
  						<h2>CRM-CUSTOMER RELATION MANAGER</h2>
  					</div>
  				
  				<div id="container">
  					<h3>save customer</h3>
  					<form:form action="saveCustomer" modelAttribute="customers" 
  					method="post">
  					<!-- need to associate data with customer id -->
  					<form:hidden path="id"/>
  						<table>
  							<tr>
  								<td>First Name-:</td>
  								<td><form:input path="firstname"/></td>
  								
  							</tr>
  							<tr>
  							<td><lable>Last Name:</lable></td>
  							<td><form:input path="lastname"/></td>
  								
  							</tr>
  							<tr>
  							
  							<td><lable>E-mail:</lable></td>
  							<td><form:input path="email"/></td>
  							</tr>
  							<tr>
  							<td><lable></lable></td>
  							<td><input type="submit" value="save" class="save"/> </td>
  							
  							</tr>
  						
  						</table>
  					
  					</form:form>
  					
  					<div style="clear; both;">
  					<p>
  					<a href="${pageContext.request.contextPath}"/customer/list>back to customer list</a>
  					</p>
  					</div>
  				
  				</div>



</body>
</html>