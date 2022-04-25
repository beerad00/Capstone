<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
 <style type="text/css">
 	body{
  background-image:
    linear-gradient(rgba(0, 0, 0, 0.527),rgba(0, 0, 0, 0.5)) ,url("/pub/images/productheader.jpg");
  background-repeat: no-repeat;
  background-attachment: fixed;  
  background-size: cover;
  background-color: gray;
 	}

 	#flexbox{
 		display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: row; 
  gap: 30px;
 	}


 	#myformId{
 		background-color: gray;
 		width: 250px;
 		height: 50%;
 		padding: 20px 30px;
 		border-radius: 5px;
 		margin: auto;

 	}

textarea {
  width: 300px;
  height: 150px;
}
 
 </style>
</head>
<body>
	
<nav class="navbar navbar-dark bg-dark">
    <div class="container-fluid">
    <h1 class="navbar-brand mb-0 h1 mr-5" style="margin-left: 500px;">Product Page</h1>
    
  </div>
</nav>
<br>
<br>
<div id="flexbox">


<div id="divId" >
	<form id="myformId" action="/newReview"  >
	
	<input type="hidden" name="productid" value="${product.getId()}">
	
	<div class="form-group form-group-lg">
    <label for="sellerid">Seller Account</label>
    <input type="text" class="form-control-md" id="sellerid" value="${product.getSelleraccount().getUsername()}" disabled>
  </div>

  	<div class="form-group form-group-lg">
    <label for="nameid">Product Name</label>
    <input type="text" class="form-control-md" id="nameid" value="${product.getName()}" disabled>
  </div>

  <div class="col-md-15">
    <label for="ratingid" class="form-label">Rating</label>
    <select id="ratingid" name="rating" class="form-select" required>
      <option>5</option>
      <option>4</option>
      <option>3</option>
      <option>2</option>
      <option>1</option>
    </select>
  </div>
  
    <div class="form-group form-group-lg">
    <label for="exampleFormControlTextarea1">Write Review</label>
    <textarea class="form-control" id="exampleFormControlTextarea1" name="review" rows="10"  maxlength="200" required></textarea>
  </div>

	<br>
		<input type="submit" name="" class="btn btn-primary">
	</form>

<jsp:include page="../include/footer.jsp" />
</div>
</div>

</body>
</html>