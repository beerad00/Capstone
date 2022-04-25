<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
 <link rel="stylesheet" href="/pub/css/userpagecss.css">

</head>
<body>
	
<jsp:include page="../include/header.jsp" />
<h1>Hi ${user.getName()}</h1>

<div class="m-4">
    <div class="card text-center">
        <div class="card-header">
            <ul class="nav nav-tabs card-header-tabs" id="myTab">
                <li class="nav-item">
                    <a href="#home" class="nav-link active" data-bs-toggle="tab">Profile</a>
                </li>
                <li class="nav-item">
                    <a href="#profile" class="nav-link" data-bs-toggle="tab">Products Bought</a>
                </li>
                <li class="nav-item">
                    <a href="#messages" class="nav-link" data-bs-toggle="tab">Your Products</a>
                </li>
            </ul>
        </div>
        <div class="card-body">
            <div class="tab-content">
                <div class="tab-pane fade show active" id="home">
                    <h5 class="card-title">${user.getName()}</h5>
                    <div  class="m-4">
    <div class="card" style="margin-left: auto;margin-right: auto;width: 400px;">
        <img src="${user.getImagepath() }" width="75" height="230" class="w-100 border-bottom" >
        <div class="card-body">
            <h5 class="card-title">Description</h5>
            <p class="card-text">${user.getSumdescription()}</p>
        </div>
        <ul class="list-group list-group-flush">
            <li class="list-group-item">Location: ${user.getLocation()}</li>
            <li class="list-group-item">Phone Number: ${user.getPhonenumber()}</li>
            <li class="list-group-item"> 
            <div class="containerdiv">
    <div>
    <img id="imgstar"src="https://image.ibb.co/jpMUXa/stars_blank.png" alt="img">
    </div>
    <div class="cornerimage" style="width:${percentage}%;">
    <img id="imgstar" src="https://image.ibb.co/caxgdF/stars_full.png" alt="">
    </div>
</div>
            
            
            
            </li>
        </ul>
        <div class="card-body">
            <a href="/reviewPage/${user.getUsername()}" class="card-link">See Reviews</a>
            <a href="/editAccount/${user.getUsername()}" class="card-link">Edit Profile</a>
        </div>
    </div>
</div>
                </div>
                <div class="tab-pane fade" id="profile">
                    <h5 class="card-title">Last 5 product bought</h5>
                   <table class="table table-dark table-sm" style="margin-left: auto;margin-right: auto;">
                     <thead>
						<tr>
						<th>Product Name</th>
						<th>Product Price</th>
						<th>Date Bought</th>
						<th>Image</th>
						<th>Seller</th>
						<th></th>
						</tr>
						</thead>
						<c:forEach var="product" items="${buyinglist}">
						<tr>
						<td>${product.getName()}</td>
						<td>$${product.getPrice()}</td>
						<td>${product.getDateadded()}</td>
						<td>${product.getImagepath()}</td>
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
                <div class="tab-pane fade" id="messages">
                    <h5 class="card-title">Last 5 Product added</h5>
                    <table class="table table-dark table-sm" style="margin-left: auto;margin-right: auto;">
                     <thead>
						<tr>
						<th>Product Name</th>
						<th>Product Price</th>
						<th>Date Added</th>
						<th>Image</th>
						<th>Edit</th>
						<th>Delete</th>
						</tr>
						</thead>
						<c:forEach var="product" items="${sellinglist}">
						<tr>
						<td>${product.getName()}</td>
						<td>$${product.getPrice()}</td>
						<td>${product.getDateadded()}</td>
						<td>${product.getImagepath()}</td>
						<td><a href="/editProduct/${product.getId()}/1" ><i class="fa fa-pencil" aria-hidden="true"></i>Edit</a></td>
						<td><a href="/deleteProduct/${product.getId()}/1"><i class="fa fa-trash" aria-hidden="true"></i>Delete</a></td>
						</tr>
						</c:forEach>
                         
                  </table>
                </div>
            </div>
        </div>
    </div>
</div>
 
 <div id="corouseldiv">
 <!-- Carousel -->
<div id="demo" class="carousel slide" data-bs-ride="carousel" style=" margin-right: 100px; margin-left: 100px;
  display: block; border-radius: 100px;border-radius: 505px;">

 
  
  <!-- The slideshow/carousel -->
  <div class="carousel-inner">
    <div class="carousel-item active">
      <h1 style="text-align: center;">Reviews</h1>
    </div>
    <c:forEach var="review" items="${reviewlist}">
    <div class="carousel-item">
      
      			<table class="table table-dark table-sm" >
 						<thead>
						<tr>
						<th>  Review</th>
						<th>Rating</th>
						<th>Date</th>
						</tr>
						</thead>      
      					<tr>
      					<td>${review.getReviews()}</td>
						<td>${review.getUserrating()}</td>
						<td>${review.getDate()}</td>
						</tr>
      
      			</table>
						
						
      
    </div>
    </c:forEach>
  </div>
  
  <!-- Left and right controls/icons -->
  <button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
    <span class="carousel-control-next-icon"></span>
  </button>
</div>
</div>
<jsp:include page="../include/footer.jsp" />

</body>
</html>

