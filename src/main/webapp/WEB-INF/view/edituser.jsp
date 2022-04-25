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
 		top: 30%;
 		background-color: gray;
 		width: 250px;
 		height: auto;
 		padding: 10px 30px;
 		border-radius: 5px;
 		margin: auto;
 	}

 	h5{
 		color: red;
 	}
 </style>
</head>
<body>
	<jsp:include page="../include/header.jsp" />
<div id="flexbox">
<div  class="m-4">
    <div class="card" style="margin-left: auto;margin-right: auto;width: 400px;">
        <img src="${user.getImagepath() }" class="w-100 border-bottom" >
        <div class="card-body">
            <h5 class="card-title">Description</h5>
            <p class="card-text">${user.getSumdescription()}</p>
        </div>
        <ul class="list-group list-group-flush">
            <li class="list-group-item">Location: ${user.getLocation()}</li>
            <li class="list-group-item">Phone Number: ${user.getPhonenumber()}</li>
        </ul>
       
    </div>
</div>

<div id="divId" >
	<form id="myformId" action="/editUser" method="POST" enctype="multipart/form-data" >
		<h1 id=loginheaderId> Edit Account</h1>
		
		<input type="hidden" name="username" value="${user.getUsername() }"/> 

		<div class="form-group">
		<label for="fileid">File: </label>
		<input type="file" name="file" id="fileid" class="form-control-md" title="Choose a file">
	</div>
	
	<div class="form-group">
		<label for="nameid">Name: </label>
		<input type="text" name="name" id="nameid" class="form-control-md" value="${user.getName() }"  title="Enter name">
	</div>
	<c:forEach items="${bindingresult.getFieldErrors('name')}" var="error">
        <div style="color:white;">${error.getDefaultMessage()}</div>
    </c:forEach>
    
	<div class="form-group">
		<label for="descriptionid">Summary Description: </label>
		<textarea id="txtArea" name="sumdescription"  id="descriptionid" rows="5" >${user.getSumdescription()}</textarea>
	</div>


	<div class="form-group">
		<label for="locationid">Location: </label>
		<input type="text" name="location" id="locationid" value="${user.getLocation()}" class="form-control-md"  title="Enter your location">
	</div>

	<div class="form-group">
		<label for="phoneid">Phone Number: </label>
		<input type="tel" name="phonenumber" id="phoneid" value="${user.getPhonenumber()}" class="form-control-md" pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}"
       required title="Format: 123-456-7890">
	</div>

	<br>
		<input type="submit" name="" class="btn btn-primary">
	</form>


</div>
</div>

<jsp:include page="../include/footer.jsp" />
</body>
</html>