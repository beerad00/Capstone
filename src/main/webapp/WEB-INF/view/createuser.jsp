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
 </style>
</head>
<body>
	
<nav class="navbar navbar-dark bg-dark">
    <div class="container-fluid">
    <h1 class="navbar-brand mb-0 h1 mr-5" style="margin-left: 500px;">Product Page</h1>
    
  </div>
</nav>



<div id="divId" >
	<form id="myformId" action="/createNewUser" onsubmit="return checkInput();" method="POST" enctype="multipart/form-data" >
		<h1 id=loginheaderId> Create Account</h1>

	<div class="form-group">
		<label for="userid">Username: </label>
		<input type="text" name="username" id="userid" class="form-control-md" pattern="^[a-zA-Z0-9]+([._]?[a-zA-Z0-9]+)*$" title="Enter a username">
	</div>
	<c:forEach items="${bindingresult.getFieldErrors('username')}" var="error">
        <div style="color:white;">${error.getDefaultMessage()}</div>
    </c:forEach>

	<div class="form-group">
		<label for="nameid">Name: </label>
		<input type="text" name="name" id="nameid" class="form-control-md"  title="Enter name">
	</div>
	
	<c:forEach items="${bindingresult.getFieldErrors('name')}" var="error">
        <div style="color:white;">${error.getDefaultMessage()}</div>
    </c:forEach>
	
	
	<div class="form-group">
		<label for="descriptionid">Summary Description: </label>
		<textarea id="txtArea" name="sumdescription" id="descriptionid" rows="5" ></textarea>
	</div>


	<div class="form-group">
		<label for="locationid">Location: </label>
		<input type="text" name="location" id="locationid" class="form-control-md"  title="Enter your location">
	</div>

	<div class="form-group">
		<label for="phoneid">Phone Nuumber: </label>
		<input type="tel" name="phonenumber" id="phoneid" class="form-control-md" pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}"
       required title="Format: 123-456-7890">
	</div>

	<div class="form-group">
		<label for="passwordid">Password: </label>
		<input type="password" name="password" id="passwordid" class="form-control-md"  title="Enter a password">
	</div>

	<div class="form-group">
		<label for="passwordId">Confirm Password: </label>
		<input type="password" id="passwordId" class="form-control-md"  title="Confirm password">
	</div>
	
	<div class="form-group">
		<label for="fileid">File: </label>
		<input type="file" name="file" id="fileid" class="form-control-md" title="Choose a fiel">
	</div>

	<br>
		<input type="submit" name="" class="btn btn-primary"></button> 
	</form>
	
<h5 id="passwordwarning" style="visibility:hidden;">Password does not match</h5>

<c:if test = "${!error.isEmpty()}">
         <p style="color:red">${error }<p>
      </c:if>

</div>


	


<script type="text/javascript">
	function checkInput()
	{

		var em=document.getElementById("passwordId").value;
		var ps=document.getElementById("passwordid").value;
		if (em!==ps) 
		{
			console.log(ps);
			console.log(em);
			
			document.getElementById("passwordwarning").style.visibility = 'visible';
			return false;
		}

		

		return true;
	}
</script>
<jsp:include page="../include/footer.jsp" />
</body>
</html>