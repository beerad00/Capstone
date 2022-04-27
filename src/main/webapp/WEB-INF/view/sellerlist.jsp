<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
 
<style>
<style>
body{
  background-image:
    linear-gradient(rgba(0, 0, 0, 0.527),rgba(0, 0, 0, 0.5)) ,url("/pub/images/productheader.jpg");
  background-repeat: no-repeat;
  background-attachment: fixed;  
  background-size: cover;
  background-color: gray;
 	}
 	#divId{
 		position: absolute;
     top: 30%;
     left: 38%;
 		display: flex;
 		flex-wrap: wrap;
     flex-direction: column; 
 		align-items: center;
 		 justify-content: center;

 	}
 	#myformId{
 		background-color: gray;
 		width: 250px;
 		height: auto;
 		padding: 20px 30px;
 		border-radius: 5px;
 		margin: auto;
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
			<option value="1">Highest Rating</option>
  			<option value="2">Lowest Rating</option>
 			<option value="3">A-Z</option>
 			<option value="4">Z-A</option>
			</select>
			
			
<div id="new">		
<table class="table table-dark table-sm">
<thead>
<tr>
<th>Name</th>
<th>Rating</th>
<th>Phone Number</th>
<th>Location</th>
<th>Image</th>
<th></th>

</tr>
</thead>
<c:forEach var="seller" items="${datedsc}">
<td><a href="/sellerPage/${seller.getUsername()}">${seller.getUsername()}</a></td>
<td>${seller.getRating()}</td>
<td>${seller.getPhonenumber()}</td>
<td>${seller.getLocation()}</td>
<td><img src="${seller.getImagepath()}" height="42" width="42"></td>
	<c:choose>
    <c:when test="${seller.getUsername().equals(user.getUsername())}">
  		<td><a href="/editAccount/${user.getUsername()}" class="card-link">Edit Profile</a></td>
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
<th> Name</th>
<th>Rating</th>
<th>Phone Number</th>
<th>Location</th>
<th>Image</th>
<th></th>

</tr>
</thead>
<c:forEach var="seller" items="${dateasc}">
<td><a href="/sellerPage/${seller.getUsername()}">${seller.getUsername()}</a></td>
<td>${seller.getRating()}</td>
<td>${seller.getPhonenumber()}</td>
<td>${seller.getLocation()}</td>
<td><img src="${seller.getImagepath()}" height="42" width="42"></td>
	<c:choose>
    <c:when test="${seller.getUsername().equals(user.getUsername())}">
  		<td><a href="/editAccount/${user.getUsername()}" class="card-link">Edit Profile</a></td>
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
<th> Name</th>
<th>Rating</th>
<th>Phone Number</th>
<th>Location</th>
<th>Image</th>
<th></th>

</tr>
</thead>
<c:forEach var="seller" items="${az}">
<tr>
<td><a href="/sellerPage/${seller.getUsername()}">${seller.getUsername()}</a></td>
<td>${seller.getRating()}</td>
<td>${seller.getPhonenumber()}</td>
<td>${seller.getLocation()}</td>
<td><img src="${seller.getImagepath()}" height="42" width="42"></td>
	<c:choose>
    <c:when test="${seller.getUsername().equals(user.getUsername())}">
  		<td><a href="/editAccount/${user.getUsername()}" class="card-link">Edit Profile</a></td>
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
<th> Name</th>
<th>Rating</th>
<th>Phone Number</th>
<th>Location</th>
<th>Image</th>
<th></th>

</tr>
</thead>
<c:forEach var="seller" items="${za}">
<tr>
<td><a href="/sellerPage/${seller.getUsername()}">${seller.getUsername()}</a></td>
<td>${seller.getRating()}</td>
<td>${seller.getPhonenumber()}</td>
<td>${seller.getLocation()}</td>
<td><img src="${seller.getImagepath()}" height="42" width="42"></td>
	<c:choose>
    <c:when test="${seller.getUsername().equals(user.getUsername())}">
  		<td><a href="/editAccount/${user.getUsername()}" class="card-link">Edit Profile</a></td>
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