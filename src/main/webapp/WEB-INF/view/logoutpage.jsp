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
 	
    
}

 	#divId{
 		position: absolute;
     top: 60%;
     left: 30%;
 		display: flex;
 		flex-wrap: wrap;
     flex-direction: column; 
 		align-items: center;
 		 justify-content: center;

 	}
</style>

</head>
<body>
	
<nav class="navbar navbar-dark bg-dark">
    <div class="container-fluid">
    <h1 class="navbar-brand mb-0 h1 mr-5" style="margin-left: 500px;">Product Page</h1>
    
  </div>
</nav>

<center><div  id="divId">
	<h1 style="color: antiquewhite;">You have been logged out</h1>
	<a href="/">Back to Login Page</a>
</div></center>

<jsp:include page="../include/footer.jsp" />
</body>
</html>