package com.roshan;

public class Product {
	private String product_id;
	private String product_name;
	private String product_brand;
	private int product_price;
	private String product_category;
	private float product_rating;
	private String product_description;
	private int product_discount;
	private String product_image1;
	private String product_image2;
	private String product_image3;
	private String product_image4;
	private String product_image5;
	public void setProduct(String product_id,String product_name,String product_brand,int product_price,String product_category,float product_rating,String product_description,int product_discount,String product_image1,String product_image2,String product_image3,String product_image4,String product_image5)
	{
		this.product_id=product_id;
		this.product_name=product_name;
		this.product_brand=product_brand;
		this.product_price=product_price;
		this.product_category=product_category;
		this.product_rating=product_rating;
		this.product_description=product_description;
		this.product_discount=product_discount;
		this.product_image1=product_image1;
		this.product_image2=product_image2;
		this.product_image3=product_image3;
		this.product_image4=product_image4;
		this.product_image5=product_image5;
	}
	
	public String getProduct_id() {
		return this.product_id;
	}
	
	public String getProduct_name() {
		return this.product_name;
	}
	
	public String getProduct_brand() {
		return this.product_brand;
	}
	
	public int getProduct_price() {
		return this.product_price;
	}
	
	public String getProduct_category() {
		return this.product_category;
	}
	
	public float getProduct_rating() {
		return this.product_rating;
	}
	
	public String getProduct_description() {
		return this.product_description;
	}
	
	public int getProduct_discount() {
		return this.product_discount;
	}
	
	public String getProduct_image1() {
		return this.product_image1;
	}
	
	public String getProduct_image3() {
		return this.product_image3;
	}
	
	public String getProduct_image2() {
		return this.product_image2;
	}
	
	public String getProduct_image4() {
		return this.product_image4;
	}
	
	public String getProduct_image5() {
		return this.product_image5;
	}
	
}

