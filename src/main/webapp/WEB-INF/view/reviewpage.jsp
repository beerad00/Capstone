<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
 <meta charset="UTF-8">
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
			<option value="1">Newest Review</option>
  			<option value="2">Oldest Review</option>
 			<option value="3">Lowest Rating</option>
 			<option value="4">Highest Rating</option>
			</select>
			
			
<div id="new">		
<table class="table table-dark table-sm">
<thead>
<tr>
<th>Review</th>
<th>Rating</th>
<th>Date</th>
</tr>
</thead>
<c:forEach var="review" items="${datedsc}">
<tr>
<td>${review.getReviews()}</td>
<td>${review.getUserrating()}</td>
<td>${review.getDate()}</td>
</tr>
</c:forEach>

</table>
</div>	

<div id="old" style="display:none;">		
<table class="table table-dark table-sm" >
<thead>
<tr>
<th>Review</th>
<th>Rating</th>
<th>Date</th>
</tr>
</thead>
<c:forEach var="review" items="${dateasc}">
<tr>
<td>${review.getReviews()}</td>
<td>${review.getUserrating()}</td>
<td>${review.getDate()}</td>
</tr>
</c:forEach>

</table>
</div>	


<div id="az" style="display:none;">		
<table class="table table-dark table-sm">
<thead>
<tr>
<th>Review</th>
<th>Rating</th>
<th>Date</th>
</tr>
</thead>
<c:forEach var="review" items="${az}">
<tr>
<td>${review.getReviews()}</td>
<td>${review.getUserrating()}</td>
<td>${review.getDate()}</td>
</tr>
</c:forEach>

</table>
</div>	

<div id="za" style="display:none;">		
<table class="table table-dark table-sm">
<thead>
<tr>
<th>Review</th>
<th>Rating</th>
<th>Date</th>
</tr>
</thead>
<c:forEach var="review" items="${za}">
<tr>
<td>${review.getReviews()}</td>
<td>${review.getUserrating()}</td>
<td>${review.getDate()}</td>
</tr>
</c:forEach>

</table>
</div>	

<jsp:include page="../include/footer.jsp" />
</body>
</html>