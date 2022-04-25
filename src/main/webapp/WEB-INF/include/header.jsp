<nav class="navbar navbar-expand-md navbar-dark bg-secondary">
<ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link" href="/homePage">Home Page</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/productList">Product List</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/sellerList">Sellers</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/balancePage">Your Balance</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/getProductForm">Add a product</a>
        </li>
        
        <li class="nav-item">
          <a class="nav-link" href="/buyingPage">Bought Products</a>
        </li>
        
      </ul>
    <form action="/searchBar">
    <label class="radio-inline">
      <input type="radio" value=1 name="choice" checked>Seller
    </label>
    <label class="radio-inline">
      <input type="radio" value=2 name="choice">Product
    </label>
    <input type="text" name="searchfor" placeholder="search"/>
    <input class="btn btn-primary" style="margin-right:10px" type="submit"/>
  </form>
    
 
</nav>