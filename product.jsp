<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Product Management</title>
</head>
<body>
	<c:url var="addAction" value="/product/add" ></c:url>

<form:form action="${addAction}" method="POST" modelAttribute="smartproducts" >
<table>
	
	<c:if test="${!empty productDetails.product_name}">
	<tr>
		<td>
			<form:label path="product_id">
				<spring:message text="Product id"/>
			</form:label>
				<td>
		<td>
			<form:input path="product_id"  readonly="true"   disabled="true" />
			
		</td> 
	</tr>
	</c:if>
	<tr><td>
			<form:label path="product_name">
				<spring:message text="Product name"/>
			</form:label>
				<td>
			<form:input path="product_name" />
		</td> 
	</tr>
	<tr>
		<td>
			<form:label path="product_category">
				<spring:message text="Category"/>
			</form:label>
		</td>
		<td>
			<form:input path="product_category" />
		</td>
	</tr>
	<tr>
		<td>
			<form:label path="product_description">
				<spring:message text="Description"/>
			</form:label>
		</td>
		<td>
			<form:input path="product_description" />
		</td>
	</tr>
	<tr>
		<td>
			<form:label path="product_price">
				<spring:message text="price"/>
			</form:label>
		</td>
		<td>
			<form:input path="product_price" />
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<c:if test="${!empty ProductDetails.product_name}">
				<input type="submit"
					value="<spring:message text="Edit Product"/>" />
			</c:if>
			<c:if test="${empty ProductDetails.product_name}">
				<input type="submit"
					value="<spring:message text="Add Product"/>" />
			</c:if>
		</td>
	</tr>
</table>	
</form:form>
<br>
<h3>Product List</h3>
<c:if test="${!empty listProducts}">
	<table class="tg">
	<tr>
		<th width="80">Product ID</th>
		<th width="120">Product Name</th>
		<th width="120">Category</th>
		<th width="120">Description</th>
		<th width="120">Price</th>
		<th width="60">Edit</th>
		<th width="60">Delete</th>
	</tr>
	<c:forEach items="${listProducts}" var="pd">
		<tr>
			<td>${pd.product_id}</td>
			<td>${pd.product_name}</td>
			<td>${pd.product_category}</td>
			<td>${pd.product_description}</td>
			<td>${pd.product_price}</td>
			<td><a href="<c:url value='/edit/${pd.product_id}' />" >Edit</a></td>
			<td><a href="<c:url value='/remove/${pd.product_id}' />" >Delete</a></td>
		</tr>
	</c:forEach>
	</table>
</c:if>

</body>
</html>