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
 	
    #image{
        display: flex;
  
  justify-content: center;
  
    }
    #descriptiondiv{
         display: flex;
  
  justify-content: center;
    }
    #description{
        text-align: center;
        resize: none;
        width: 300px;
         height: 120px;
    }

    #underpic{
        display: flex;
        row-gap: 10px;

    }

    .card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  max-width: 500px;
  margin: auto;
  
  font-family: arial;
}

.price {
  color: grey;
  font-size: 22px;
}

.card button {
  border: none;
  outline: 0;
  padding: 12px;
  color: white;
  background-color: #000;
  text-align: center;
  cursor: pointer;
  width: 90%;
  font-size: 18px;
  margin-left: 20px;
}

.card button:hover {
  opacity: 0.7;
}
 
 #productheader{
    display: flex;
    justify-content: space-between;
 }
 	
</style>
</head>


<body>

<jsp:include page="../include/header.jsp" />
<div id="productheader">
    <p style="margin-left:20px;color:blue">Tags: <c:forEach var="tag" items="${product.getLot()}"><span>${tag.getTitle()} ,</span></c:forEach> </p>
<h2 style="text-align:center;color:blue"><b><u>${product.getName()}</u></b></h2>
<h4 style="color:blue;margin-right:20px;">${product.getDateadded()}</h4>
</div>



<div class="card">
  <img src="${product.getImagepath()}"  style="width:100%">
  <h1 class="price" id="priceid" style="text-align: center;">$${product.getPrice()}</h1>
  <p style="margin-left:30px">Seller: <a href="/sellerPage/${product.getSelleraccount().getUsername() }">${product.getSelleraccount().getUsername() }</a></p>
  <hr>
  <p style="text-align:center;">${product.getDescription() }</p>
  <hr>
  <c:choose>
    <c:when test="${product.getSelleraccount().getUsername().equals(user.getUsername())}">
 <a href="/purchaseProduct/${product.getId()}" style="visibility:hidden;"  class="btn btn-primary btn-lg btn-block">Buy</a>
</c:when>

<c:when test="${casherror}">
 <a href="/purchaseProduct/${product.getId()}" style="visibility:hidden;"  class="btn btn-primary btn-lg btn-block">Buy</a>
</c:when>

<c:when test="${product.isPurchased()}">
 <a href="/purchaseProduct/${product.getId()}" style="visibility:hidden;"  class="btn btn-primary btn-lg btn-block">Buy</a>
</c:when>

 <c:otherwise>
 <a href="/purchaseProduct/${product.getId()}"  class="btn btn-primary btn-lg btn-block">Buy</a>
  </c:otherwise>     
</c:choose>

</div>
<c:if test="${casherror }">
<p id="crediterror" style="text-align: center;color:red;" > Not enough credits to purchase</p>
</c:if>
<h6 style="text-align: center;color:blue">Related Items</h6>
<hr>
<div style="margin-left: 30px;"  class="m-4">
    <div class="row row-cols-1 row-cols-md-5 g-4">
    	<c:forEach var="product" items="${relatedproducts}">
        <div class="col">
            <div class="card">
                <img src="${product.getImagepath()}" class="card-img-top" alt="...">
                <div class="card-body">
                    <h5 class="card-title">${product.getName()}</h5>
                </div>
                <div class="card-footer">
                    <small class="text-muted"><a href="/productPage/${product.getId()}">View Product</a></small>
                </div>
            </div>
        </div>
        </c:forEach>

    </div>
</div>


	<br>
	<jsp:include page="../include/footer.jsp" />

</body>
</html>