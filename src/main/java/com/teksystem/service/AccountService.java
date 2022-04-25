package com.teksystem.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teksystem.database.AccountDAO;
import com.teksystem.database.MoneyAccountDAO;
import com.teksystem.database.ProductDAO;
import com.teksystem.database.ReviewDAO;
import com.teksystem.database.TagsDAO;
import com.teksystem.formbean.ProductValidator;
import com.teksystem.formbean.UserValidator;
import com.teksystem.model.Account;
import com.teksystem.model.MoneyAccount;
import com.teksystem.model.Product;
import com.teksystem.model.Review;
import com.teksystem.model.Tags;

@Service
public class AccountService {
	@Autowired
	AccountDAO ad;
	
	@Autowired
	ProductDAO pd;
	
	@Autowired
	TagsDAO td;
	
	@Autowired
	ReviewDAO rd;
	
	@Autowired
	MoneyAccountDAO mad;
	
	
	
	public Account retrieveAccount(String username,String password)
	{	//Not necessary
		Account account = ad.findByusername(username);
		//Fix and remove
		try {
		if(account==null || !(account.getPassword().equals(password)))
			return null;
		}
		catch(Exception e)
		{
			return null;
		}
		
		List<Product> sellinglist = pd.findByselleraccount(account);
		//Retrieves tags for each product, and removes products that have been bought
		
		sellinglist.removeIf((a)->(a.isPurchased()));
		for(Product p:sellinglist)
			p.setLot(td.findByproducttagged(p));
		
		
		account.setSellerlist(sellinglist);
		
	
		return account;
	}
	
	public void addProduct(Account seller, String[] tags, Product p)
	{
		pd.save(p);
		for(String t:tags)
		{
			td.save(new Tags(t,p));
		}
		
	}
	
	public List<Product> getAllProducts()
	{
		List<Product> list = pd.getSellingList();
		
		return list;
	}
	
	public List<Account> getAllSellers()
	{
		List<Account> sellerlist = ad.findAll();
		for(Account a:sellerlist)
		{
			List<Review> avglist = this.getReviews(a);
			a.setRating(avglist.stream().mapToDouble(d->d.getUserrating()).average().orElse(0.0));
		}
		
		return sellerlist;
	}
	
	public Product retrieveProduct(int id)
	{
		Product prod = pd.getById(id);
		List<Tags> lot= td.findByproducttagged(prod);
		prod.setLot(lot);
		return prod;
	}
	
	public List<Product> retrieveUserSellingList(Account account)
	{
		
		List<Product> prod= pd.findByselleraccount(account);
		prod.removeIf(a->(a.isPurchased()));
		return prod;
	}
	
	public List<Product> retrieveUserBuyingList(Account account)
	{
		return pd.findBybuyeraccount(account);
	}
	
	public List<Product> getRelatedItems(Product prod)
	{
		
		int sametagcounter=0;
		Set<Product> relatedproducts=new HashSet<>();
		List<Product> allproducts = pd.getSellingList();
		
		allproducts.remove(prod);
		List<Tags> parenttag = prod.getLot();
		
		
		//Set Tags for the products
		prod.setLot(td.findByproducttagged(prod));
		for(Product p:allproducts)
			p.setLot(td.findByproducttagged(p));
		
		for(int i=0;i<allproducts.size();i++)
		{
			List<Tags> checkedproduct = allproducts.get(i).getLot();
			for(Tags t:parenttag)
			{
				if(relatedproducts.size()>=5)
				{
					
					List<Product> relproduct = new ArrayList<>(relatedproducts);
					return relproduct;
				}
				
				for(int j=0;j<checkedproduct.size();j++)
				{
					if(t.getTitle().equals(checkedproduct.get(j).getTitle()))
					{
						++sametagcounter;
					}
					
					if(sametagcounter>=2)
					{
						relatedproducts.add(allproducts.get(i));
						sametagcounter=0;
						break;
					}
				}
			}
		}
		
		 List<Product> relproduct = new ArrayList<>(relatedproducts);
		 return relproduct;
	}
	
	
	public void saveReview(Review review)
	{
		rd.save(review);
	}
	
	public List<Review> getReviews(Account account)
	{
		List<Review> reviews = rd.findByaccountreviewed(account);
		return reviews;
	}
	
	public void deleteProduct(int id)
	{
		pd.deleteById(id);
	}
	
	public void updateProduct(int id,String name, String description,String[] newtags, String imagepath, Double price)
	{
		Product prod = pd.getById(id);
		prod.setName(name);
		prod.setDescription(description);
		if(!imagepath.equals(""))
			prod.setImagepath(imagepath);
		prod.setPrice(price);
		pd.save(prod);
		
		List<Tags> tags = td.findByproducttagged(prod);
		for(Tags t: tags)
			td.delete(t);
		for(String t:newtags)
		{
			td.save(new Tags(t,prod));
		}
		
		
	}
	
	public List<Product> categoryList(String category)
	{
		
		List<Product> categorylist = new ArrayList<>();
		List<Tags> categorytag = new ArrayList<>();
		if(category.equals("Animals"))
		{
			categorytag.addAll(td.findBytitle(category));
			categorytag.addAll(td.findBytitle("Animal Accessories"));
			categorytag.addAll(td.findBytitle("Animal Health & Grooming"));
			categorytag.addAll(td.findBytitle("Animal Food"));
			for(Tags t: categorytag)
			{
				categorylist.add(t.getProducttagged());
			}
		}
		
		else if(category.equals("Arts & Crafts"))
		{
			categorytag.addAll(td.findBytitle(category));
			categorytag.addAll(td.findBytitle("Sewing"));
			categorytag.addAll(td.findBytitle("Art Supplies"));
			for(Tags t: categorytag)
			{
				categorylist.add(t.getProducttagged());
			}
		}
		
		else if(category.equals("Automobile"))
		{
			categorytag.addAll(td.findBytitle(category));
			categorytag.addAll(td.findBytitle("Automobile Parts"));
			categorytag.addAll(td.findBytitle("Automobile Tools"));
			for(Tags t: categorytag)
			{
				categorylist.add(t.getProducttagged());
			}
		}
		
		else if(category.equals("Computers"))
		{
			categorytag.addAll(td.findBytitle(category));
			categorytag.addAll(td.findBytitle("Computer Accessories"));
			categorytag.addAll(td.findBytitle("Laptops"));
			for(Tags t: categorytag)
			{
				categorylist.add(t.getProducttagged());
			}
		}
		
		else if(category.equals("Clothing"))
		{
			categorytag.addAll(td.findBytitle(category));
			categorytag.addAll(td.findBytitle("Fashion Accessories"));
			categorytag.addAll(td.findBytitle("Baby Clothe"));
			categorytag.addAll(td.findBytitle("Jewelry"));
			categorytag.addAll(td.findBytitle("Footwear"));
			for(Tags t: categorytag)
			{
				categorylist.add(t.getProducttagged());
			}
		}
		
		else if(category.equals("Cooking"))
		{
			categorytag.addAll(td.findBytitle(category));
			categorytag.addAll(td.findBytitle("Cooking Accessories"));
			categorytag.addAll(td.findBytitle("Cooking Utensils"));
			for(Tags t: categorytag)
			{
				categorylist.add(t.getProducttagged());
			}
		}
		
		else if(category.equals("Electronics"))
		{
			categorytag.addAll(td.findBytitle(category));
			categorytag.addAll(td.findBytitle("Cell Phones"));
			categorytag.addAll(td.findBytitle("Smart Watches"));
			categorytag.addAll(td.findBytitle("TV's"));
			for(Tags t: categorytag)
			{
				categorylist.add(t.getProducttagged());
			}
		}
		
		else if(category.equals("Electronic Accessories"))
		{
			categorytag.addAll(td.findBytitle(category));
			categorytag.addAll(td.findBytitle("Cell Phone Accessories"));
			categorytag.addAll(td.findBytitle("Head Phones"));
			for(Tags t: categorytag)
			{
				categorylist.add(t.getProducttagged());
			}
		}
		
		else if(category.equals("Furniture"))
		{
			categorytag.addAll(td.findBytitle(category));
			categorytag.addAll(td.findBytitle("Outdoor Furniture"));
			categorytag.addAll(td.findBytitle("Bedding"));
			for(Tags t: categorytag)
			{
				categorylist.add(t.getProducttagged());
			}
		}
		
		else if(category.equals("Gaming"))
		{
			categorytag.addAll(td.findBytitle(category));
			categorytag.addAll(td.findBytitle("Video Game Consoles"));
			categorytag.addAll(td.findBytitle("Video Games"));
			categorytag.addAll(td.findBytitle("Gaming Controllers"));
			for(Tags t: categorytag)
			{
				categorylist.add(t.getProducttagged());
			}
		}
		
		else if(category.equals("Home"))
		{
			categorytag.addAll(td.findBytitle(category));
			categorytag.addAll(td.findBytitle("Home Appliances"));
			categorytag.addAll(td.findBytitle("Home Accessories"));
			for(Tags t: categorytag)
			{
				categorylist.add(t.getProducttagged());
			}
		}
		
		else if(category.equals("Music"))
		{
			categorytag.addAll(td.findBytitle(category));
			categorytag.addAll(td.findBytitle("Song"));
			categorytag.addAll(td.findBytitle("Instruments"));
			for(Tags t: categorytag)
			{
				categorylist.add(t.getProducttagged());
			}
		}
		
		else if(category.equals("Other"))
		{
			categorytag.addAll(td.findBytitle(category));
			for(Tags t: categorytag)
			{
				categorylist.add(t.getProducttagged());
			}
		}
		
		else if(category.equals("Sports"))
		{
			categorytag.addAll(td.findBytitle(category));
			categorytag.addAll(td.findBytitle("Sports Accessories"));
			categorytag.addAll(td.findBytitle("Sports Gear"));
			for(Tags t: categorytag)
			{
				categorylist.add(t.getProducttagged());
			}
		}
		
		else if(category.equals("Software"))
		{
			categorytag.addAll(td.findBytitle(category));
			categorytag.addAll(td.findBytitle("Apps"));
			categorytag.addAll(td.findBytitle("OS"));
			for(Tags t: categorytag)
			{
				categorylist.add(t.getProducttagged());
			}
		}
		
		else if(category.equals("Tools & HardWare"))
		{
			categorytag.addAll(td.findBytitle(category));
			categorytag.addAll(td.findBytitle("Gardening Tools"));
			for(Tags t: categorytag)
			{
				categorylist.add(t.getProducttagged());
			}
		}
		
		else
		{
			categorytag.addAll(td.findBytitle(category));
			for(Tags t: categorytag)
			{
				categorylist.add(t.getProducttagged());
			}
		}
		
		Set<Product> set = new HashSet<>(categorylist);
		List<Product> uniquelist= new ArrayList<>(set);
		uniquelist.removeIf(p->(p.isPurchased()));
		return uniquelist;
			
	}
	
	public MoneyAccount getMoneyAccount(Account account)
	{
		return mad.findByuseraccount(account);
	}
	
	public void purchaseProduct(Account account, int productid)
	{
		Product purchasedproduct = pd.getById(productid);
		purchasedproduct.setBuyeraccount(account);
		purchasedproduct.setPurchased(true);
		purchasedproduct.setDatebought(new Date());
		pd.save(purchasedproduct);
		
		//Reflect Purchase
		MoneyAccount ma = mad.findByuseraccount(account);
		ma.setBalance(ma.getBalance()-purchasedproduct.getPrice());
		
		MoneyAccount sa = mad.findByuseraccount(purchasedproduct.getSelleraccount());
		sa.setBalance(sa.getBalance()+purchasedproduct.getPrice());
		mad.save(ma);mad.save(sa);
		
	}
	
	public void depositMoney(double deposit, Account account)
	{
		MoneyAccount ma = mad.findByuseraccount(account);
		ma.setBalance(ma.getBalance()+deposit);
		mad.save(ma);
		
	}
	
	public List<Review> reviewList(Account account)
	{
		return rd.findByaccountreviewed(account);
	}

	public Account retrieveAccountForLoggedInUser(String name)
	{
		Account account = ad.findByusername(name);
		
		return account;
	}
	
	public boolean doesUserExist(String accountname)
	{
		Account account = ad.findByusername(accountname);
		if(account!=null)
			return true;
		return false;
		
	}
	
	public void createNewUser(UserValidator user)
	{
		Account newaccount = new Account(user.getUsername(),user.getName(),user.getPassword(),0,user.getSumdescription(),user.getPhonenumber(),user.getLocation(),user.getImagepath());
		MoneyAccount newmoneyaccount= new MoneyAccount(0,newaccount);
		
		ad.save(newaccount);
		mad.save(newmoneyaccount);
		
	}
	
	public void editUser(UserValidator user)
	{
			
		Account account = ad.findByusername(user.getUsername());
		account.setName(user.getName());
		account.setPhonenumber(user.getPhonenumber());
		account.setSumdescription(user.getSumdescription());
		account.setLocation(user.getLocation());
		if(!(user.getImagepath()==""))
			account.setImagepath(user.getImagepath());
		ad.save(account);
	}
	
	public void createNewReview(int rating, String review ,int productid) 
	{
		Product product = pd.getById(productid);
		product.setReviewed(true);
		pd.save(product);
		Review newreview= new Review(review,rating, product.getSelleraccount());
		rd.save(newreview);
	}
	
	public List<Account> searchAccount(String query)
	{
		
		return ad.getSimilarName(query);
	}
	
	public List<Product> searchProduct(String query)
	{
		return pd.getSimilarName(query);
	}
}
