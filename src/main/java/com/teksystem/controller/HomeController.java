package com.teksystem.controller;

import java.io.File;
import java.io.IOException;
import java.util.Collections;
import java.util.Date;
import java.util.List;


import javax.validation.Valid;


import org.apache.commons.io.FileUtils;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.teksystem.database.AccountDAO;
import com.teksystem.database.MoneyAccountDAO;
import com.teksystem.database.ProductDAO;
import com.teksystem.database.ReviewDAO;
import com.teksystem.database.TagsDAO;
import com.teksystem.formbean.LoginValidator;
import com.teksystem.formbean.ProductValidator;
import com.teksystem.formbean.UserValidator;
import com.teksystem.model.Account;
import com.teksystem.model.MoneyAccount;
import com.teksystem.model.Product;
import com.teksystem.model.Review;
import com.teksystem.model.Tags;
import com.teksystem.service.AccountService;




@Controller
public class HomeController {
	
	@Autowired
	AccountDAO a;
	
	@Autowired
	ProductDAO p;
	
	@Autowired
	TagsDAO t;
	
	@Autowired
	ReviewDAO r;
	@Autowired
	MoneyAccountDAO ma;
	
	Account mainuser;
	@Autowired
	AccountService service;
	
	//Return Login Form
	@RequestMapping(name="/", method=RequestMethod.GET)
	public String home(Model m)
	{
		
		return "login";
		
	}
	//Returns Product Form
	@RequestMapping("/getProductForm")
	public String getProductForm(Model m)
	{
		if (mainuser==null)
		{
			return "redirect:/logout";
		}
		return "productform";
	}
	//Adds Product and checks if data is valid
	@RequestMapping(value="/addProduct", method = RequestMethod.POST)
	public String addProduct(Model m,@RequestParam(name="tags",required=false) String[] tagtest, @RequestParam(name="file",required = false) MultipartFile file, @Valid ProductValidator prod, BindingResult bindingresult) throws IOException
	{
		if (mainuser==null)
		{
			return "redirect:/logout";
		}
		
		String imagepath;
		
		if(file.getOriginalFilename().equals(""))
		{
			 imagepath="/pub/images/defaultpic.png";
		}
		else
		{
			File targetFile = new File("C:/Users/bradl/OneDrive/Documents/TekSystemCapstone/Project/src/main/webapp/pub/images/" + file.getOriginalFilename());
			 imagepath = "/pub/images/"+file.getOriginalFilename();
	        FileUtils.copyInputStreamToFile(file.getInputStream(), targetFile);
			
		}
		
		if((prod.getName().isEmpty()||prod.getName().isBlank())||(prod.getDescription().isBlank()||prod.getDescription().isEmpty()))
		{
			prod.setLot(tagtest);
			m.addAttribute("bindingresult", bindingresult);
			m.addAttribute("product", prod);
			return "productform";
		}
		
		if(tagtest==null)
		{
			m.addAttribute("bindingresult", bindingresult);
			m.addAttribute("product", prod);
			return "productform";
		}
		
		Product newproduct = new Product(prod.getName(),prod.getDescription(),new Date(),false,false,mainuser,imagepath,prod.getPrice());
		service.addProduct(mainuser, tagtest, newproduct);
		
		m.addAttribute("user", mainuser);
		
		return "redirect:/homePage";
	}
	//Checks if user is in the database, and information entered is correct, otherwise returned to login form
	@RequestMapping("/login")
	public String login(Model m,@Valid LoginValidator login, BindingResult bindingresult)
	{
		
		this.mainuser=service.retrieveAccount(login.getUsername(),login.getPassword());
		if(mainuser==null)
		{
			m.addAttribute("bindingresult", bindingresult);
			m.addAttribute("login", login);
			m.addAttribute("error", "Wrong Username/Password");
			return "login";
		}
		
		m.addAttribute("user", mainuser);
		return "redirect:/homePage";
	}
	//MainPage/Home: Shows user their last 5 purchases, last 5 added to selling list, and streams reviews, at bottom of page
	@RequestMapping("/homePage")
	public String homePage(Model m)
	{
		
		mainuser=service.retrieveAccountForLoggedInUser(mainuser.getUsername());
		if (mainuser==null)
		{
			return "redirect:/logout";
		}
		m.addAttribute("user", mainuser);
		List<Product> sellinglist=service.retrieveUserSellingList(mainuser);
		List<Product> buyinglist=service.retrieveUserBuyingList(mainuser);
		List<Review> reviewlist = service.getReviews(mainuser);
		reviewlist.sort((a,b)->{return a.getDate().compareTo(b.getDate());});
		sellinglist.sort((a,b)->{return a.getDateadded().compareTo(b.getDateadded());});
		buyinglist.sort((a,b)->{return a.getDatebought().compareTo(b.getDatebought());});
		
	
		
		Collections.reverse(buyinglist);
		Collections.reverse(sellinglist);
		Collections.reverse(reviewlist);
		
		if(sellinglist.size()>5)
			sellinglist.subList(5,sellinglist.size()).clear();
		if(buyinglist.size()>5)
			buyinglist.subList(5, buyinglist.size()).clear();
		
		
		m.addAttribute("buyinglist", buyinglist);
		m.addAttribute("sellinglist", sellinglist);
		m.addAttribute("reviewlist", reviewlist);
				
		List<Review> avglist = service.getReviews(mainuser);
		Double ans=avglist.stream().mapToDouble(d->d.getUserrating()).average().orElse(0.0);
		
		m.addAttribute("percentage", Math.round(ans*20));
		

		
		
		return "userpage";
	}
	//Return products list
	@RequestMapping("/productList")
	public String productList(Model m)
	{
		
		if (mainuser==null)
		{
			return "redirect:/logout";
		}
		
		List<Product> az = service.getAllProducts();
		//A-Z
		az.sort((a,b)->{return a.getName().compareTo(b.getName());});
		
		List<Product> za = service.getAllProducts();
		//Z-A
		za.sort((a,b)->{return a.getName().compareTo(b.getName());});
		Collections.reverse(za);
		
		
		List<Product> dateasc=service.getAllProducts();
		//Data oldest-newest
		dateasc.sort((a,b)->{return a.getDateadded().compareTo(b.getDateadded());});
		
		
		List<Product> datedsc=service.getAllProducts();
		datedsc.sort((a,b)->{return a.getDateadded().compareTo(b.getDateadded());});
		//Date newest-oldest
		Collections.reverse(datedsc);
		
		
		
		m.addAttribute("az", az);
		m.addAttribute("za", za);
		m.addAttribute("dateasc", dateasc);
		m.addAttribute("datedsc", datedsc);
		
		m.addAttribute("user", this.mainuser);
		return "productlist";
	}
	//Return List of sellers
	@RequestMapping("/sellerList")
	public String sellerList(Model m)
	{
		if (mainuser==null)
		{
			return "redirect:/logout";
		}
		
		List<Account> az = service.getAllSellers();
		//A-Z
		az.sort((a,b)->{return a.getName().compareTo(b.getName());});
		
		List<Account> za = service.getAllSellers();
		//Z-A
		za.sort((a,b)->{return a.getName().compareTo(b.getName());});
		Collections.reverse(za);
		
		
		List<Account> dateasc=service.getAllSellers();
		//Data oldest-newest
		dateasc.sort((a,b)->{return new Double(a.getRating()).compareTo(new Double(b.getRating()));});
		
		
		List<Account> datedsc=service.getAllSellers();
		datedsc.sort((a,b)->{return new Double(a.getRating()).compareTo(new Double(b.getRating()));});
		//Date newest-oldest
		Collections.reverse(datedsc);
		
		
		
		m.addAttribute("az", az);
		m.addAttribute("za", za);
		m.addAttribute("dateasc", dateasc);
		m.addAttribute("datedsc", datedsc);
		
		
		m.addAttribute("user", this.mainuser);
		return "sellerlist";
	}
	//Returns the edit product form (it takes page id so user can be directed to that page again once done editing)
	@RequestMapping("/editProduct/{id}/{pageid}")
	public String editProduct(Model m, @PathVariable("id") int id,@PathVariable("pageid") int pageid)
	{
		if (mainuser==null)
		{
			return "redirect:/logout";
		}
		
		m.addAttribute("product", service.retrieveProduct(id));
		m.addAttribute("pageid", pageid);
		return "editproduct";
	}
	//Updates Product, and check if valid data is entered. Afterwards returns user back to the page they decided to edit on
	@RequestMapping(value="/updateProduct", method=RequestMethod.POST)
	public String updateProduct(Model m,@Valid ProductValidator prod,BindingResult bindingresult, @RequestParam(name="tags",required = false) String[] tagtest, @RequestParam(name="file",required = false) MultipartFile file, @RequestParam(name="pageid") int pageid) throws IOException
	{
		if (mainuser==null)
		{
			return "redirect:/logout";
		}
		
		String imagepath;
		
		if(file.getOriginalFilename().equals(""))
		{
			 imagepath="";
		}
		else
		{
			File targetFile = new File("C:/Users/bradl/OneDrive/Documents/TekSystemCapstone/Project/src/main/webapp/pub/images" + file.getOriginalFilename());
			
			 imagepath = "/pub/images/"+file.getOriginalFilename();
	        FileUtils.copyInputStreamToFile(file.getInputStream(), targetFile);
			
		}
		
		if((prod.getName().isEmpty()||prod.getName().isBlank())||(prod.getDescription().isBlank()||prod.getDescription().isEmpty()))
		{
			m.addAttribute("pageid", pageid);
			m.addAttribute("bindingresult", bindingresult);
			m.addAttribute("product", service.retrieveProduct(prod.getId()));
			return"editproduct";
		}
		
		if(tagtest==null)
		{
			m.addAttribute("pageid", pageid);
			m.addAttribute("bindingresult", bindingresult);
			m.addAttribute("product", service.retrieveProduct(prod.getId()));
			m.addAttribute("error", "You must pick a tag for your product");
			return "editproduct";
		}
		
		service.updateProduct(prod.getId() ,prod.getName(),prod.getDescription(),tagtest,imagepath,prod.getPrice());
		
		if(pageid==1)
			return "redirect:/homePage";
		else
			return "redirect:/productList";
	}
	//Returns Product page where user see detailed information about the product
	//User also has the ability to buy products, and see related items based on my algorithm
	@RequestMapping(value="/productPage/{id}", method=RequestMethod.GET)
	public String productPage(Model m,@PathVariable("id") int id)
	{
		if (mainuser==null)
		{
			return "redirect:/logout";
		}
		
		Product prod=service.retrieveProduct(id);
		List<Product> relatedproducts = service.getRelatedItems(prod);
		m.addAttribute("product", prod);
		m.addAttribute("relatedproducts", relatedproducts);
		m.addAttribute("account", service.getMoneyAccount(mainuser));
		m.addAttribute("user", mainuser);
		return "productpage";
	}

	
	//Deletes only owned products by user, and returns them to page they were on previously
	@RequestMapping(value="/deleteProduct/{id}/{pageid}", method=RequestMethod.GET)
	public String deleteProduct(@PathVariable("id") int id,@PathVariable("pageid") int pageid)
	{
		if (mainuser==null)
		{
			return "redirect:/logout";
		}
		service.deleteProduct(id);
		if(pageid==1)
			return "redirect:/homePage";
		if (pageid ==2)
			return "redirect:/productList";
		return "redirect:/productList";
		
	}
	//Returns a Product List with all the tags a product can be given
	//The user can click on the tags too see only products with the contained tags
	@RequestMapping("/productCategoryPage")
	public String getCategoryList(Model m, @RequestParam("producttagged") String tagged)
	{
		if (mainuser==null)
		{
			return "redirect:/logout";
		}
		
		List<Product> az = service.categoryList(tagged);
		//A-Z
		az.sort((a,b)->{return a.getName().compareTo(b.getName());});
		
		List<Product> za = service.categoryList(tagged);
		//Z-A
		za.sort((a,b)->{return a.getName().compareTo(b.getName());});
		Collections.reverse(za);
		
		
		List<Product> dateasc=service.categoryList(tagged);
		//Data oldest-newest
		dateasc.sort((a,b)->{return a.getDateadded().compareTo(b.getDateadded());});
		
		
		List<Product> datedsc=service.categoryList(tagged);
		datedsc.sort((a,b)->{return a.getDateadded().compareTo(b.getDateadded());});
		//Date newest-oldest
		Collections.reverse(datedsc);
		
		
		
		m.addAttribute("az", az);
		m.addAttribute("za", za);
		m.addAttribute("dateasc", dateasc);
		m.addAttribute("datedsc", datedsc);
		
		
		m.addAttribute("user", this.mainuser);
		
		
		
		return "categorypage";
	}
	
	//This method only runs when the user clicks the buy button
	//Checks if the user has appropriate funds to make purchase
	//If user doesn't have enough funds the buy button will disappear and user will be met with an error message
	@RequestMapping(value="/purchaseProduct/{id}", method=RequestMethod.GET)
	public String purchaseProduct(Model m, @PathVariable("id") int id)
	{
		if (mainuser==null)
		{
			return "redirect:/logout";
		}
		
		MoneyAccount usermoney= service.getMoneyAccount(mainuser);
		Product product = service.retrieveProduct(id);
		if(usermoney.getBalance()-product.getPrice()<0)
		{
			
			List<Product> relatedproducts = service.getRelatedItems(product);
			m.addAttribute("product", product);
			m.addAttribute("relatedproducts", relatedproducts);
			m.addAttribute("account", service.getMoneyAccount(mainuser));
			m.addAttribute("user", mainuser);
			m.addAttribute("casherror", true);
			return "productpage";
					
		}
		service.purchaseProduct(mainuser, id);
		
		return "redirect:/homePage";
		
	}
	//Returns a balance page where user can deposit money
	@RequestMapping("/balancePage")
	public String balancePage(Model m)
	{
		if (mainuser==null)
		{
			return "redirect:/logout";
		}
		m.addAttribute("money", service.getMoneyAccount(mainuser));
		return "balancedeposit";
	}
	//Send user to confirm page of what's deposited
	//An audio loop of coins dropping plays when the page is ran
	@RequestMapping("/confirmDeposit")
	public String confirmDeposit(Model m, @RequestParam("deposit") double deposit)
	{
		if (mainuser==null)
		{
			return "redirect:/logout";
		}
		service.depositMoney(deposit, mainuser);
		return "confirmdeposit";
	}
	//Returns a list of all the products the user has purchased
	@RequestMapping("/buyingPage")
	public String buyingPage(Model m)
	{
		if (mainuser==null)
		{
			return "redirect:/logout";
		}
		List<Product> az = service.retrieveUserBuyingList(mainuser);
		//A-Z
		az.sort((a,b)->{return a.getName().compareTo(b.getName());});
		
		List<Product> za = service.retrieveUserBuyingList(mainuser);
		//Z-A
		za.sort((a,b)->{return a.getName().compareTo(b.getName());});
		Collections.reverse(za);
		
		
		List<Product> dateasc=service.retrieveUserBuyingList(mainuser);
		//Data oldest-newest
		dateasc.sort((a,b)->{return a.getDateadded().compareTo(b.getDateadded());});
		
		
		List<Product> datedsc=service.retrieveUserBuyingList(mainuser);
		datedsc.sort((a,b)->{return a.getDateadded().compareTo(b.getDateadded());});
		//Date newest-oldest
		Collections.reverse(datedsc);
		
		
		
		m.addAttribute("az", az);
		m.addAttribute("za", za);
		m.addAttribute("dateasc", dateasc);
		m.addAttribute("datedsc", datedsc);
		
		m.addAttribute("user", this.mainuser);
		return "buyingpage";
	}
	//Return the a form for the user to create an account
	@RequestMapping("/createUserForm")
	public String getcreateUserForm(Model m)
	{
		
		return "createuser";
	}
	//
	@RequestMapping(value="/reviewPage/{account}", method=RequestMethod.GET)
	public String reviewPage(Model m,@PathVariable("account") String account)
	{
		if (mainuser==null)
		{
			return "redirect:/logout";
		}
		Account user = service.retrieveAccountForLoggedInUser(account);
		
		
		List<Review> az = service.getReviews(user);
		//A-Z
		az.sort((a,b)->{return new Integer(a.getUserrating()).compareTo(new Integer(b.getUserrating()));});
		
		List<Review> za = service.getReviews(user);
		//Z-A
		za.sort((a,b)->{return new Integer(a.getUserrating()).compareTo(new Integer(b.getUserrating()));});
		Collections.reverse(za);
		
		
		List<Review> dateasc=service.getReviews(user);
		//Data oldest-newest
		dateasc.sort((a,b)->{return a.getDate().compareTo(b.getDate());});
		
		
		List<Review> datedsc=service.getReviews(user);
		datedsc.sort((a,b)->{return a.getDate().compareTo(b.getDate());});
		//Date newest-oldest
		Collections.reverse(datedsc);
		
		
		
		m.addAttribute("az", az);
		m.addAttribute("za", za);
		m.addAttribute("dateasc", dateasc);
		m.addAttribute("datedsc", datedsc);
		
		return "reviewpage";
	}
	//Returns page for the seller, it's pretty similar to the user page but with less option such 
	//You can the last 5 items put up, all the reviews, and the seller details such location, phone number, etc
	@RequestMapping(value="/sellerPage/{account}", method=RequestMethod.GET)
	public String sellerPage(Model m, @PathVariable("account") String account)
	{
		if (mainuser==null)
		{
			return "redirect:/logout";
		}
		Account user = service.retrieveAccountForLoggedInUser(account);
		m.addAttribute("user", user);
		m.addAttribute("sellinglist", service.retrieveUserSellingList(user));
		m.addAttribute("reviewlist", service.getReviews(user));
		List<Review> avglist = service.getReviews(user);
		Double ans=avglist.stream().mapToDouble(d->d.getUserrating()).average().orElse(0.0);
		
		m.addAttribute("percentage", Math.round(ans*20));
		return "sellerpage";
	}
	//Creates a new user, and checks if data is valid
	@RequestMapping("/createNewUser")
	public String createUser(Model m,@Valid UserValidator user,BindingResult bindingresult, @RequestParam(name="file",required = false) MultipartFile file) throws IOException
	{
		String imagepath;
		
		if(file.getOriginalFilename().equals(""))
		{
			 imagepath="/pub/images/userdefaultpic.jpg";
		}
		else
		{
			File targetFile = new File("C:/Users/bradl/OneDrive/Documents/TekSystemCapstone/Project/src/main/webapp/pub/images/" + file.getOriginalFilename());
			 imagepath = "/pub/images/"+file.getOriginalFilename();
	        FileUtils.copyInputStreamToFile(file.getInputStream(), targetFile);
			
		}
		
		if(user.getUsername().isBlank()||user.getName().isBlank()||user.getUsername().isEmpty()||user.getName().isEmpty())
		{
			m.addAttribute("bindingresult", bindingresult);
			return "createuser";
		}
		
		if(service.doesUserExist(user.getUsername()))
		{
			m.addAttribute("error", "Please pick a different username");
			return "createuser";
		}
		
		user.setImagepath(imagepath);
		
		service.createNewUser(user);
		
		
		return "login";
	}
	//Edits User, and does Error Checking (Checks for Valid Input with form beans)
	@RequestMapping("/editUser")
	public String editUser(Model m,@RequestParam(name="file",required = false) MultipartFile file,@Valid UserValidator user,BindingResult bindingresult) throws IOException
	{
		if (mainuser==null)
		{
			return "redirect:/logout";
		}
		String imagepath;
		
		if(file.getOriginalFilename().equals(""))
		{
			 imagepath="";
		}
		else
		{
			File targetFile = new File("C:/Users/bradl/OneDrive/Documents/TekSystemCapstone/Project/src/main/webapp/pub/images" + file.getOriginalFilename());
			
			 imagepath = "/pub/images/"+file.getOriginalFilename();
	        FileUtils.copyInputStreamToFile(file.getInputStream(), targetFile);
			
		}
		if(user.getName().isBlank()||user.getName().isEmpty())
		{
			m.addAttribute("user", user);
			m.addAttribute("bindingresult", bindingresult);
			return "edituser";
		}
		
		user.setImagepath(imagepath);
		service.editUser(user);
		
		return "redirect:/homePage";
	}
	//Return review Form
	@RequestMapping(value="/reviewForm/{productid}", method=RequestMethod.GET)
	public String reviewForm(Model m,@PathVariable("productid") int id)
	{
		if (mainuser==null)
		{
			return "redirect:/logout";
		}
		m.addAttribute("product", service.retrieveProduct(id));
		return "reviewform";
	}
	//Creates New Review
	@RequestMapping("/newReview")
	public String newReview(@RequestParam("rating") int rating, @RequestParam("review") String review, @RequestParam("productid") int productid)
	{
		service.createNewReview(rating, review, productid);
		return "redirect:/homePage";
	}
	//Edits Account
	//User is brought a visual of how their current profile looks while they're editing 
	@RequestMapping("/editAccount/{account}")
	public String editAccount(@PathVariable("account") String account,Model m)
	{
		Account user= service.retrieveAccountForLoggedInUser(account);
		m.addAttribute("user", user);
		return "edituser";
	}
	//Search Bar Function
	//Depending on which radio button is selected, it'll search for products or sellers
	@RequestMapping("/searchBar")
	public String searchBar(Model m, @RequestParam("choice") int choice, @RequestParam("searchfor") String searchfor)
	{
		//Searches for Product
		if (choice == 2)
		{
			List<Product> az = service.searchProduct(searchfor);
			
			az.sort((a,b)->{return a.getName().compareTo(b.getName());});
			
			List<Product> za = service.searchProduct(searchfor);
			
			za.sort((a,b)->{return a.getName().compareTo(b.getName());});
			Collections.reverse(za);
			
			
			List<Product> dateasc=service.searchProduct(searchfor);
			//Data oldest-new
			dateasc.sort((a,b)->{return a.getDateadded().compareTo(b.getDateadded());});
			
			
			List<Product> datedsc=service.searchProduct(searchfor);
			datedsc.sort((a,b)->{return a.getDateadded().compareTo(b.getDateadded());});
			//Date newest-oldest
			Collections.reverse(datedsc);
			
			
			
			m.addAttribute("az", az);
			m.addAttribute("za", za);
			m.addAttribute("dateasc", dateasc);
			m.addAttribute("datedsc", datedsc);
			
			m.addAttribute("user", this.mainuser);
			return "searchproduct";
		}
		//Searches for Account
		else
		{
			List<Account> az = service.searchAccount(searchfor);
			//Sorts A-Z
			az.sort((a,b)->{return a.getName().compareTo(b.getName());});
			
			List<Account> za = service.searchAccount(searchfor);
			//Sorts Z-A
			za.sort((a,b)->{return a.getName().compareTo(b.getName());});
			Collections.reverse(za);
			
			
			List<Account> dateasc=service.searchAccount(searchfor);
			//Sorts Date Oldest
			dateasc.sort((a,b)->{return new Double(a.getRating()).compareTo(new Double(b.getRating()));});
			
			//Sorts Date Newest
			List<Account> datedsc=service.searchAccount(searchfor);
			datedsc.sort((a,b)->{return new Double(a.getRating()).compareTo(new Double(b.getRating()));});
			
			Collections.reverse(datedsc);
			
			
			
			m.addAttribute("az", az);
			m.addAttribute("za", za);
			m.addAttribute("dateasc", dateasc);
			m.addAttribute("datedsc", datedsc);
			
			
			m.addAttribute("user", this.mainuser);
			
			return "searchaccount";
		}
	}
	
	@RequestMapping("/logout")
	public String logout()
	{
		this.mainuser=null;
		
		return "logoutpage";
	}
	

	
	
	
}
