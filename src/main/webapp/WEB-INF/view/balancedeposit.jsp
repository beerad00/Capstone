<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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

 	
 </style>
</head>
<body>
	<jsp:include page="../include/header.jsp" />


<div id="divId" >
	<form id="myformId" action="/confirmDeposit" >
		<h1 id=loginheaderId> Money Account</h1>

	<div class="form-group">
		<label for="balanceid">Current Balance: </label>
	<input type="number" name="balance" id="balanceid" class="form-control-md" value="${money.getBalance()}" disabled>
	</div>

	<div class="form-group">
		<label for="depositid">Deposit Money</label>
		<input type="number" name="deposit" id="depositid" class="form-control-md" step=".01" min="0" title="Please enter an appropriate amount">
	</div>


	<br>
		<input type="submit" name="" class="btn btn-primary"></button> 
	</form>
	


</div>


<jsp:include page="../include/footer.jsp" />
</body>
</html>