package com.roshan;

public class User {
	String user_id;	
	String user_name;
	String user_address;
	String user_designation;	
	String user_image;
	
	User(String user_id,String user_name,String user_address,String user_designation,String user_image)
	{
		this.user_id=user_id;		
		this.user_name=user_name;
		this.user_address=user_address;
		this.user_designation=user_designation;		
		this.user_image=user_image;
	}
	
	public String getUserId()
	{
		return this.user_id;
	}
	
	public String getUserName()
	{
		return this.user_name;
	}
	
	public String getUserDesignation()
	{
		return this.user_designation;
	}
	
	public String getUserAddress()
	{
		return this.user_address;
	}
	
	public String getUserImage()
	{
		return this.user_image;
	}
}
