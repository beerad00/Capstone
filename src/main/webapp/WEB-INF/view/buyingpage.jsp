<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
 
<style>
body{
  background-image:
    linear-gradient(rgba(0, 0, 0, 0.527),rgba(0, 0, 0, 0.5)) ,url("/pub/images/productheader.jpg");
  background-repeat: no-repeat;
  background-attachment: fixed;  
  background-size: cover;
  background-color: gray;
 	}
 	

 	h5{
 		color: red;
 	}
 	
 	.taglink{
 	
 	margin-right: 20px;
 		
 	
 	}
 	
 	#subtags{
 	display:none;
 	margin-right: 20px;
 	
 	
 	}
	
	#sortid{
	position:fixed; left:1115px;
	}
    
}
</style>

</head>
<body>
		<script>
			

			function sortList()
			{
				var option = document.getElementById("sortid").value;
				console.log(option);
				if(option==1)
				{
					document.getElementById("new").style.display = "block";
					document.getElementById("old").style.display = "none";
					document.getElementById("az").style.display = "none";
					document.getElementById("za").style.display = "none";
				}

				if(option==2)
				{
					
					document.getElementById("new").style.display = "none";
					document.getElementById("old").style.display = "block";
					document.getElementById("az").style.display = "none";
					document.getElementById("za").style.display = "none";

				}


				if(option==3)
				{

					document.getElementById("new").style.display = "none";
					document.getElementById("old").style.display = "none";
					document.getElementById("az").style.display = "block";
					document.getElementById("za").style.display = "none";

				}


				if(option==4)
				{
					document.getElementById("new").style.display = "none";
					document.getElementById("old").style.display = "none";
					document.getElementById("az").style.display = "none";
					document.getElementById("za").style.display = "block";
				}
				


				}
			

			</script>
	
	<jsp:include page="../include/header.jsp" />

	
			
			<select name="sort" id="sortid" onchange="sortList()">
			<option value="1">Newest Products</option>
  			<option value="2">Oldest Products</option>
 			<option value="3">A-Z</option>
 			<option value="4">Z-A</option>
			</select>
			
			
<div id="new">		
<table class="table table-dark table-sm">
<thead>
<tr>
<th>Product Name</th>
<th>Product Price</th>
<th>Date Added</th>
<th>Image</th>
<th>Seller</th>
<th></th>
</tr>
</thead>
<c:forEach var="product" items="${datedsc}">
<tr>
<td><a href="/productPage/${product.getId()}">${product.getName()}</a></td>
<td>$${product.getPrice()}</td>
<td>${product.getDateadded()}</td>
<td><img src="${product.getImagepath()}" height="42" width="42"></td>
<td>${product.getSelleraccount().getUsername()}</td>

	<c:choose>
						    <c:when test="${!product.isReviewed()}">
						  		<td><a href="/reviewForm/${product.getId()}" ><i class="fa fa-pencil" aria-hidden="true"></i>Review</a></td>
						    </c:when>
						    <c:otherwise>
						    <td></td>
						    </c:otherwise>
						    
						    
						    </c:choose>
</tr>
</c:forEach>

</table>
</div>	

<div id="old" style="display:none;">		
<table class="table table-dark table-sm" >
<thead>
<tr>
<th>Product Name</th>
<th>Product Price</th>
<th>Date Added</th>
<th>Image</th>
<th>Seller</th>
<th></th>

</tr>
</thead>
<c:forEach var="product" items="${dateasc}">
<tr>
<td><a href="/productPage/${product.getId()}">${product.getName()}</a></td>
<td>$${product.getPrice()}</td>
<td>${product.getDateadded()}</td>
<td><img src="${product.getImagepath()}" height="42" width="42"></td>
<td>${product.getSelleraccount().getUsername()}</td>

	<c:choose>
						    <c:when test="${!product.isReviewed()}">
						  		<td><a href="/reviewForm/${product.getId()}" ><i class="fa fa-pencil" aria-hidden="true"></i>Review</a></td>
						    </c:when>
						    <c:otherwise>
						    <td></td>
						    </c:otherwise>
						    
						    
						    </c:choose>
</tr>
</c:forEach>

</table>
</div>	


<div id="az" style="display:none;">		
<table class="table table-dark table-sm">
<thead>
<tr>
<th>Product Name</th>
<th>Product Price</th>
<th>Date Added</th>
<th>Image</th>
<th>Seller</th>
<th></th>
</tr>
</thead>
<c:forEach var="product" items="${az}">
<tr>
<td><a href="/productPage/${product.getId()}">${product.getName()}</a></td>
<td>$${product.getPrice()}</td>
<td>${product.getDateadded()}</td>
<td><img src="${product.getImagepath()}" height="42" width="42"></td>
<td>${product.getSelleraccount().getUsername()}</td>

	<c:choose>
						    <c:when test="${!product.isReviewed()}">
						  		<td><a href="/reviewForm/${product.getId()}" ><i class="fa fa-pencil" aria-hidden="true"></i>Review</a></td>
						    </c:when>
						    <c:otherwise>
						    <td></td>
						    </c:otherwise>
						    
						    
						    </c:choose>
</tr>
</c:forEach>

</table>
</div>	

<div id="za" style="display:none;">		
<table class="table table-dark table-sm">
<thead>
<tr>
<th>Product Name</th>
<th>Product Price</th>
<th>Date Added</th>
<th>Image</th>
<th>Seller</th>
<th></th>
</tr>
</thead>
<c:forEach var="product" items="${za}">
<tr>
<td><a href="/productPage/${product.getId()}">${product.getName()}</a></td>
<td>$${product.getPrice()}</td>
<td>${product.getDateadded()}</td>
<td><img src="${product.getImagepath()}" height="42" width="42"></td>
<td>${product.getSelleraccount().getUsername()}</td>

	<c:choose>
						    <c:when test="${!product.isReviewed()}">
						  		<td><a href="/reviewForm/${product.getId()}" ><i class="fa fa-pencil" aria-hidden="true"></i>Review</a></td>
						    </c:when>
						    <c:otherwise>
						    <td></td>
						    </c:otherwise>
						    
						    
						    </c:choose>
</tr>
</c:forEach>

</table>
</div>	

<jsp:include page="../include/footer.jsp" />
</body>
</html>