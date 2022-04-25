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
 	#centerdiv{
 	display: flex;
  justify-content: center;
 	
 	}
 	
 	label{
 	color:white;
 	}
 	
 	button{
 	margin-left:500px;
 	
 	}

</style>
</head>
<body>
<jsp:include page="../include/header.jsp" />
<h1>Product Form</h1>
<div>
<form action="/addProduct" method="POST" enctype="multipart/form-data">
<div id="centerdiv">
<div class="form-group">
<label for="productname">Product Name: </label>
<input type="text" class="form-control-md" name="name" id="productname">
</div>
<c:forEach items="${bindingresult.getFieldErrors('name')}" var="error">
        <div style="color:red;">${error.getDefaultMessage()}</div>
    </c:forEach>

<div class="form-group">
<label for="productprice">Product Price: </label>
<input type="number" class="form-control-md" name="price" id="productprice" step=".01" min="0" title="Enter a price" required>
</div>

<div class="form-group">
<label for="productdescription">Product Description: </label>
<input type="text" class="form-control-md" name="description" id="productdescription">
</div>
<c:forEach items="${bindingresult.getFieldErrors('description')}" var="error">
        <div style="color:red;">${error.getDefaultMessage()}</div>
    </c:forEach>

<div class="form-group">
<label for="imagepic">Upload Your Image: </label>
<input type="file" name="file" id="file">
</div>
<c:if test = "${!error.isEmpty()}">
         <p style="color:red">${error }<p>
      </c:if>
</div>
<div>
<table class="table table-dark table-sm">
	<tbody>
		<tr>
			<td><input type="checkbox" id="animals" name="tags" value="Animals"><label for="animalss"> Animals </label></td>
			<td><input type="checkbox" id="art" name="tags" value="Arts & Crafts"><label for="art"> Arts & Crafts </label></td>	
			<td><input type="checkbox" id= "automobile" name="tags" value="Automobile"><label for="automobile"> Automobile </label></td>	
			<td><input type="checkbox" id="computers" name="tags" value="Computers"><label for="computers"> Computers </label></td>
			<td><input type="checkbox" id="clothing" name="tags" value="Clothing"><label for="clothing"> Clothing </label></td>
			<td><input type="checkbox" id="cooking" name="tags" value="Cooking"><label for="cooking"> Cooking </label></td>			
			<td><input type="checkbox" id= "electronics" name="tags" value="Electronics"><label for="electronics">Electronics</label></td>
			<td><input type="checkbox" id="electronic accessories" name="tags" value="Electronic Accessories"><label for="electronic accessories"> Electronic Accessories </label></td>	
			<td><input type="checkbox" id="furniture" name="tags" value="Furniture"><label for="furniture">Furniture</label></td>
			<td><input type="checkbox" id="games" name="tags" value="Gaming"><label for="games"> Gaming </label></td>	
			<td><input type="checkbox" id="home" name="tags" value="Home"><label for="home"> Home </label></td>	
			<td><input type="checkbox" id="music" name="tags" value="Music"><label for="music"> Music</label></td>	
			<td><input type="checkbox" id="others" name="tags" value="Other"><label for="others"> Other </label></td>
			<td><input type="checkbox" id="sports" name="tags" value="Sports"><label for="sports"> Sports </label></td>	
			<td><input type="checkbox" id="software" name="tags" value="Software"><label for="software"> Software </label></td>
			<td><input type="checkbox" id="tools" name="tags" value="Tools & Hardware"><label for="tools"> Tools & HardWare</label></td>
		</tr>
		
		<tr>
			<td><input type="checkbox" id="animalaccessories" name="tags" value="Animal Accessories"><label for="animalaccessories"> Animal Accessories </label></td>
			<td><input type="checkbox" id="sewing" name="tags" value="Sewing"><label for="sewing"> Sewing </label></td>	
			<td><input type="checkbox" id= "automobileparts" name="tags" value="Automobile Parts"><label for="automobileparts"> Automobile Parts </label></td>	
			<td><input type="checkbox" id="computeraccessories" name="tags" value="Computer Accessories"><label for="computeraccessories"> Computer Accessories </label></td>
			<td><input type="checkbox" id="fashionaccessories" name="tags" value="Fashion Accessories"><label for="fashionaccessories"> Fashion Accessories </label></td>
			<td><input type="checkbox" id="cookingaccessories" name="tags" value="Cooking Accessories"><label for="cookingaccessories"> Cooking Accessories </label></td>			
			<td><input type="checkbox" id= "cellphones" name="tags" value="Cell Phones"><label for="cellphones">Cell Phones</label></td>
			<td><input type="checkbox" id="cellphoneaccessories" name="tags" value="Cell Phone Accessories"><label for="cellphoneaccessories"> Cell Phone Accessories </label></td>	
			<td><input type="checkbox" id="outdoorfurniture" name="tags" value="Outdoor Furniture"><label for="outdoorfurniture">Outdoor Furniture</label></td>
			<td><input type="checkbox" id="consoles" name="tags" value="Video Game Consoles"><label for="console"> Video Game Consoles </label></td>	
			<td><input type="checkbox" id="homeapplicances" name="tags" value="Home Appliances"><label for="homeapplicanes"> Home Appliances </label></td>	
			<td><input type="checkbox" id="song" name="tags" value="Song"><label for="song"> Song</label></td>	
			<td><input type="checkbox" id="others" name="tags" value="Other"><label for="others"> Other </label></td>
			<td><input type="checkbox" id="sportsaccessories" name="tags" value="Sports Accessories"><label for="sportsaccessories"> Sports Accessories</label></td>	
			<td><input type="checkbox" id="apps" name="tags" value="Apps"><label for="apps"> Apps </label></td>
			<td><input type="checkbox" id="gardeningtools" name="tags" value="Gardening Tools"><label for="gardeningtools"> Gardening Tools</label></td>
		</tr>
		
			<tr>
			<td><input type="checkbox" id="animalhealthngroom" name="tags" value="Animal Health & Grooming"><label for="animalhealthngroom"> Animal Health & Grooming </label></td>
			<td><input type="checkbox" id="artsupplies" name="tags" value="Art Supplies"><label for="artsupplies"> Art Supplies </label></td>	
			<td><input type="checkbox" id= "automobiletools" name="tags" value="Automobile Tools"><label for="automobiletools"> Automobile Tools</label></td>	
			<td><input type="checkbox" id="laptop" name="tags" value="Laptops"><label for="laptop"> Laptops </label></td>
			<td><input type="checkbox" id="babyclothe" name="tags" value="Baby Clothe"><label for="babyclothe"> Baby Clothe </label></td>
			<td><input type="checkbox" id="cooking utensils" name="tags" value="Cooking Utensils"><label for="cooking utensils"> Cooking Utensils </label></td>			
			<td><input type="checkbox" id= "smartwatches" name="tags" value="Smart Watches"><label for="smartwatches">Smart Watches</label></td>
			<td><input type="checkbox" id="headphones" name="tags" value="Head Phones"><label for="headphones"> Head Phones </label></td>	
			<td><input type="checkbox" id="bedding" name="tags" value="Bedding"><label for="bedding">Bedding</label></td>
			<td><input type="checkbox" id="videogames" name="tags" value="Video Games"><label for="videogames"> Video Games </label></td>	
			<td><input type="checkbox" id="homeaccessories" name="tags" value="Home Accessories"><label for="homeaccessories"> Home Accessories </label></td>	
			<td><input type="checkbox" id="instruments" name="tags" value="Instruments"><label for="instruments"> Instruments</label></td>	
			<td><input type="checkbox" id="others" name="tags" value="Other"><label for="others"> Other </label></td>
			<td><input type="checkbox" id="sportsgear" name="tags" value="Sports Gear"><label for="sportsgear"> Sports Gear </label></td>	
			<td><input type="checkbox" id="os" name="tags" value="OS"><label for="os"> OS </label></td>
			<td></td>
		</tr>
		
		
		<tr>
			<td><input type="checkbox" id="animalfood" name="tags" value="Animal Food"><label for="animalfood"> Animal Food </label></td>
			<td></td>	
			<td></td>	
			<td></td>
			<td><input type="checkbox" id="jewelry" name="tags" value="Jewelry"><label for="jewelry"> Jewelry </label></td>
			<td></td>			
			<td><input type="checkbox" id= "tv" name="tags" value="TV's"><label for="tv">TV's</label></td>
			<td></td>	
			<td></td>
			<td><input type="checkbox" id="gamingcontroller" name="tags" value="Gaming Controllers"><label for="gamingcontroller"> Gaming Controllers</label></td>	
			<td></td>	
			<td></td>	
			<td></td>
			<td></td>	
			<td></td>
			<td></td>
		</tr>
		
		<tr>
			<td></td>
			<td></td>	
			<td></td>	
			<td></td>
			<td><input type="checkbox" id="footwear" name="tags" value="Footwear"><label for="footwear"> Footwear </label></td>
			<td></td>			
			<td></td>
			<td></td>	
			<td></td>
			<td></td>	
			<td></td>	
			<td></td>	
			<td></td>
			<td></td>	
			<td></td>
			<td></td>
		</tr>
		
		
		
		

	</tbody>
</table>
</div>

<button type="submit" class="btn btn-primary btn-lg btn-block" name="button">Submit</button>
</form>
</div>

<br>
<jsp:include page="../include/footer.jsp" />
</body>
</html>