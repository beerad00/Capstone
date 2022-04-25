<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
 <meta charset="UTF-8">
</head>

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
</style>
<body>
	

<nav class="navbar navbar-expand-md navbar-dark bg-secondary">
 <div class="container-fluid">
    <h1 class="navbar-brand mb-0 h1 mr-5" style="margin-left: 500px;">Product Page</h1>
    </div>
 
</nav>


<div id="divId" >
	<form id="myformId" action="/login" method="post" >
		<h1 id=loginheaderId> Login</h1>
	<div class="form-group">
		<label for="usernameid">Username: </label>
		<input type="text" name="username" id="usernameid" class="form-control-sm" value="${login.getUsername()}" >
		<c:forEach items="${bindingresult.getFieldErrors('username')}" var="error">
        <div style="color:white;">${error.getDefaultMessage()}</div>
    </c:forEach>
	</div>

	<div class="form-group">
		<label for="passwordId">Password: </label>
		<input type="password" name="password" id="passwordId" class="form-control-sm" value="${login.getPassword()}"  title="Up to 45 characters">
		<c:forEach items='${bindingresult.getFieldErrors("password")}' var="error">
        <div style="color:red;">${error.getDefaultMessage()}</div>
    </c:forEach>
	</div>
	<br>
		<input type="submit" name="" class="btn btn-primary">
	</form>
	<a href="/createUserForm">Create New Account</a>
	<c:if test = "${!error.isEmpty()}">
         <p style="color:red">${error }<p>
      </c:if>

</div>
<jsp:include page="../include/footer.jsp" />
</body>
</html>