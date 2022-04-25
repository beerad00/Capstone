<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
 <meta charset="UTF-8">
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
			function showAllTags()
			{
				var a = document.getElementById("changetags").innerHTML;
				console.log(a);
				if(a == 'Show All Tags')
					{
				document.getElementById("subtags").style.display = "block";
				document.getElementById("changetags").innerHTML="Hide SubTags";
				}
				else
					{
					document.getElementById("subtags").style.display = "none";
					document.getElementById("changetags").innerHTML='Show All Tags';
					}
				

			}

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

			<a class="taglink" href="/productCategoryPage?producttagged=Animals" id="animals" name="tags" value="Animals"> Animals </a>
			<a class="taglink" href="/productCategoryPage?producttagged=Arts & Crafts" id="art" name="tags" value="Arts & Crafts"> Arts & Crafts </a>	
			<a class="taglink" href="/productCategoryPage?producttagged=Automobile" id= "automobile" name="tags" value="Automobile"> Automobile </a>	
			<a class="taglink" href="/productCategoryPage?producttagged=Computers" id="computers" name="tags" value="Computers"> Computer </a>
			<a class="taglink" href="/productCategoryPage?producttagged=Clothing" id="clothing" name="tags" value="Clothing">Clothing </a>
			<a class="taglink" href="/productCategoryPage?producttagged=Cooking" id="cooking" name="tags" value="Cooking"> Cooking </a>			
			<a class="taglink" href="/productCategoryPage?producttagged=Electronics" id= "electronics" name="tags" value="Electronics">Electronics</a>
			<a class="taglink" href="/productCategoryPage?producttagged=Electronic Accessories" id="electronic accessories" name="tags" value="Electronic Accessories"> Electronic Accessories </a>	
			<a class="taglink" href="/productCategoryPage?producttagged=Furniture" id="furniture" name="tags" value="Furniture">Furniture</a>
			<a class="taglink" href="/productCategoryPage?producttagged=Gaming" id="games" name="tags" value="Gaming">Gaming </a>	
			<a class="taglink" href="/productCategoryPage?producttagged=Home" id="home" name="tags" value="Home">Home </a>	
			<a class="taglink" href="/productCategoryPage?producttagged=Music" id="music" name="tags" value="Music"> Music</a>	
			<a class="taglink" href="/productCategoryPage?producttagged=Other" id="others" name="tags" value="Other"> Other </a>
			<a class="taglink" href="/productCategoryPage?producttagged=Sports" id="sports" name="tags" value="Sports"> Sports </a>	
			<a class="taglink" href="/productCategoryPage?producttagged=Software" id="software" name="tags" value="Software"> Software </a>
			<a class="taglink" href="/productCategoryPage?producttagged=Tools & Hardware" id="tools" name="tags" value="Tools & Hardware"> Tools & HardWare</a>
			<a href='javascript:;' id="changetags" onclick="showAllTags()">Show All Tags</a>
			<div id="subtags">
			<h5>SubTags:</h5>
			<a class="taglink" href="/productCategoryPage?producttagged=Animal Accessories" id="animalaccessories" name="tags" value="Animal Accessories"> Animal Accessories </a>
			<a class="taglink" href="/productCategoryPage?producttagged=Sewing" id="sewing" name="tags" value="Sewing"> Sewing </a>	
			<a class="taglink" href="/productCategoryPage?producttagged=Automobile Parts" id= "automobileparts" name="tags" value="Automobile Parts"> Automobile Parts </a>	
			<a class="taglink" href="/productCategoryPage?producttagged=Computer Accessories" id="computeraccessories" name="tags" value="Computer Accessories"> Computer Accessories </a>
			<a class="taglink" href="/productCategoryPage?producttagged=Fashion Accessories" id="fashionaccessories" name="tags" value="Fashion Accessories"> Fashion Accessories </a>
			<a class="taglink" href="/productCategoryPage?producttagged=Cooking Accessories" id="cookingaccessories" name="tags" value="Cooking Accessories"> Cooking Accessories </a>			
			<a class="taglink" href="/productCategoryPage?producttagged=Cell Phones" id= "cellphones" name="tags" value="Cell Phones">Cell Phones</a>
			<a class="taglink" href="/productCategoryPage?producttagged=Cell Phone Accessories" id="cellphoneaccessories" name="tags" value="Cell Phone Accessories">Cell Phone Accessories </a>	
			<a class="taglink" href="/productCategoryPage?producttagged=Outdoor Furniture" id="outdoorfurniture" name="tags" value="Outdoor Furniture">Outdoor Furniture</a>
			<a class="taglink" href="/productCategoryPage?producttagged=Video Game Console" id="consoles" name="tags" value="Video Game Console"> Video Game Consoles </a>	
			<a class="taglink" href="/productCategoryPage?producttagged=Home Appliances" id="homeapplicances" name="tags" value="Home Appliances"> Home Appliances </a>	
			<a class="taglink" href="/productCategoryPage?producttagged=Song" id="song" name="tags" value="Song"> Song</a>	
			<a class="taglink" href="/productCategoryPage?producttagged=Other" id="others" name="tags" value="Other"> Other </a>
			<a class="taglink" href="/productCategoryPage?producttagged=Sports Accessories" id="sportsaccessories" name="tags" value="Sports Accessories"> Sports Accessories</a>	
			<a class="taglink" href="/productCategoryPage?producttagged=Apps" id="apps" name="tags" value="Apps"> Apps </a>
			<a class="taglink" href="/productCategoryPage?producttagged=Gardening Tools" id="gardeningtools" name="tags" value="Gardening Tools"> Gardening Tools</a>
			<a class="taglink" href="/productCategoryPage?producttagged=Animal Health & Grooming" id="animalhealthngroom" name="tags" value="Animal Health & Grooming"> Animal Health & Grooming </a>
			<a class="taglink" href="/productCategoryPage?producttagged=Art Supplies" id="artsupplies" name="tags" value="Art Supplies"> Art Supplies </a>	
			<a class="taglink" href="/productCategoryPage?producttagged=Automobile Tools" id= "automobiletools" name="tags" value="Automobile Tools"> Automobile Tools</a>	
			<a class="taglink" href="/productCategoryPage?producttagged=Laptops" id="laptop" name="tags" value="Laptops"> Laptops </a>
			<a class="taglink" href="/productCategoryPage?producttagged=Baby Clothe" id="babyclothe" name="tags" value="Baby Clothe">Baby Clothe </a>
			<a class="taglink" href="/productCategoryPage?producttagged=Cooking Utensils" id="cooking utensils" name="tags" value="Cooking Utensils"> Cooking Utensils </a>			
			<a class="taglink" href="/productCategoryPage?producttagged=Smart Watches" id= "smartwatches" name="tags" value="Smart Watches">Smart Watches</a>
			<a class="taglink" href="/productCategoryPage?producttagged=Head Phones" id="headphones" name="tags" value="Head Phones"> Head Phones </a>	
			<a class="taglink" href="/productCategoryPage?producttagged=Bedding" id="bedding" name="tags" value="Bedding">Bedding</a>
			<a class="taglink" href="/productCategoryPage?producttagged=Video Games" id="videogames" name="tags" value="Video Games"> Video Games </a>	
			<a class="taglink" href="/productCategoryPage?producttagged=Home Accessories" id="homeaccessories" name="tags" value="Home Accessories"> Home Accessories </a>	
			<a class="taglink" href="/productCategoryPage?producttagged=Instruments" id="instruments" name="tags" value="Instruments"> Instruments</a>	
			<a class="taglink" href="/productCategoryPage?producttagged=Other" id="others" name="tags" value="Other"> Other </a>
			<a class="taglink" href="/productCategoryPage?producttagged=Sports Gear" id="sportsgear" name="tags" value="Sports Gear"> Sports Gear </a>	
			<a class="taglink" href="/productCategoryPage?producttagged=OS" id="os" name="tags" value="OS"> OS </a>
			<a class="taglink" href="/productCategoryPage?producttagged=Animal Food" id="animalfood" name="tags" value="Animal Food"> Animal Food </a>
			<a class="taglink" href="/productCategoryPage?producttagged=Jewelry" id="jewelry" name="tags" value="Jewelry"> Jewelry </a>	
			<a class="taglink" href="/productCategoryPage?producttagged=Tv's" id= "tv" name="tags" value="Tv's">TV's</a>
			<a class="taglink" href="/productCategoryPage?producttagged=Gaming Controllers" id="gamingcontroller" name="tags" value="Gaming Controllers">Gaming Controller</a>
			<a class="taglink" href="/productCategoryPage?producttagged=Footwear" id="footwear" name="tags" value="Footwear"> Footwear </a>	
			</div>
			
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
    <c:when test="${product.getSelleraccount().getUsername().equals(user.getUsername())}">
  		<td><a href="/editProduct/${product.getId()}/2" ><i class="fa fa-pencil" aria-hidden="true"></i>Edit</a></td>
 		<td><a href="/deleteProduct/${product.getId()}/2"><i class="fa fa-trash" aria-hidden="true"></i>Delete</a></td>
    </c:when>
    <c:otherwise>
    <td></td>
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
    <c:when test="${product.getSelleraccount().getUsername().equals(user.getUsername())}">
  		<td><a href="/editProduct/${product.getId()}/2" ><i class="fa fa-pencil" aria-hidden="true"></i>Edit</a></td>
 		<td><a href="/deleteProduct/${product.getId()}/2"><i class="fa fa-trash" aria-hidden="true"></i>Delete</a></td>
    </c:when>
    <c:otherwise>
    <td></td>
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
    <c:when test="${product.getSelleraccount().getUsername().equals(user.getUsername())}">
  		<td><a href="/editProduct/${product.getId()}/2" ><i class="fa fa-pencil" aria-hidden="true"></i>Edit</a></td>
 		<td><a href="/deleteProduct/${product.getId()}/2"><i class="fa fa-trash" aria-hidden="true"></i>Delete</a></td>
    </c:when>
    <c:otherwise>
    <td></td>
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
    <c:when test="${product.getSelleraccount().getUsername().equals(user.getUsername())}">
  		<td><a href="/editProduct/${product.getId()}/2" ><i class="fa fa-pencil" aria-hidden="true"></i>Edit</a></td>
 		<td><a href="/deleteProduct/${product.getId()}/2"><i class="fa fa-trash" aria-hidden="true"></i>Delete</a></td>
    </c:when>
    <c:otherwise>
    <td></td>
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