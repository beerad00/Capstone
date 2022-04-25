<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 <style type="text/css">
 	body{
  background-image:
    linear-gradient(rgba(0, 0, 0, 0.527),rgba(0, 0, 0, 0.5)) ,url("/pub/images/coinp.jpg");
  background-repeat: no-repeat;
  background-attachment: fixed;  
  background-size: cover;
  background-color: gray;
 	}
 	#divId{
 		position: absolute;
     top: 50%;
     left: 40%;
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

 	img {
  -webkit-filter: grayscale(100%); /* Safari 6.0 - 9.0 */
  filter: grayscale(100%);
}

 	
 </style>
 <script>
    window.onload = function () {
        document.querySelector("video").muted = false;
    };
</script>
</head>
<body>
	
<jsp:include page="../include/header.jsp" />
<video autoplay loop >
    <source src="/pub/music/coinfall.mp3" />
</video>


<div id="divId" >
	
	<h1>Credits Added</h1>
	<a href="/homePage"><h4>Return to Home Page</h4></a>


</div>


<jsp:include page="../include/footer.jsp" />



</body>
</html>