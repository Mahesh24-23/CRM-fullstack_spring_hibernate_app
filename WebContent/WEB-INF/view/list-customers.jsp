<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list</title>

<link type="text/css" rel="stylesheet" 
href="${pageContext.request.contextPath}/resources/css/style.css"/>
</head>
<body>
    <div id="wrapper">
       <div id="header">
       <h2>CRM-CUSTOMER RELATIONSHIP MANAGER</h2>
       </div>
       
       <div id="container">
                 <div id="content">
                 <!-- add a button to the customers 
                 when the button is clicked. In this case, the function assigned to the onClick event is window.
                 location.href='showFormForAdd', which redirects the user to the location specified by the URL showFormForAdd. The return false; 
                 statement at the end of the function prevents the default 
                 action of the button from being executed. In this case, 
                 it prevents the page from refreshing or navigating away from the current page.
                 -->
                 <input type="button" value="Add Customer" 
                 onClick="window.location.href='showFormForAdd'; return false;"
                 class="add-button"
                 />
                 
                 
                 
                 
                 <!-- add out our html table here -->
                 
                 <table>
                
                     <tr>
                        <th>First Name &nbsp &nbsp &nbsp &nbsp</th>
                        <th>Last Name &nbsp &nbsp</th>
                        <th>&nbsp &nbspEmail</th>
                        <th>&nbsp &nbsp Action</th>
                     </tr>
                     <!-- loop over and print the customer-->
                     <c:forEach var="customer" items="${customers}">
                      <!-- contruct a "update" link with customer id -->
                      <c:url var="updateLink" value="/customer/showFormForUpdate">
                         			<c:param name="customerId" value="${customer.id}"/>
                         			
                         			</c:url>
                         		<tr>
                         			<td>${customer.firstname}</td>
                         			<td>${customer.lastname}</td>
                         			<td>${customer.email}</td>
                         			<td>
                         			<a href="${updateLink}">Update</a>
                         			
                         			</td>
                         		</tr>
           
                     </c:forEach>
          
                 </table>
       
                  </div>
       
       </div>
    
    </div>



</body>
</html>