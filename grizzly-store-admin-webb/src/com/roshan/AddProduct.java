package com.roshan;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.*;
import java.util.*;


@WebServlet("/AddProduct")  
public class AddProduct extends HttpServlet {
	
	protected void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException, IOException
	{
		
		String productid=req.getParameter("product_id");
		String productname=req.getParameter("product_name");
		String productdesc=req.getParameter("product_desc");
		String productcat=req.getParameter("product_category");
		int productprice=Integer.parseInt(req.getParameter("product_price"));
		String productimage1=req.getParameter("image1");
		String productimage2=req.getParameter("image2");
		String productimage3=req.getParameter("image3");
		String productimage4=req.getParameter("image4");
		String productimage5=req.getParameter("image5");
		
		
		// JDBC driver name and database URL
	    final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
	    final String DB_URL = "jdbc:mysql://localhost/GIZZLY";
		
	    // Database Credentials
	    final String USER = "root";
	    final String PASS = "password-1";

		  
	    Connection conn = null;
	    Statement stmt = null;
	    try
	    {
	      // Register JDBC driver
	      Class.forName("com.mysql.jdbc.Driver");
	      
	      // Open a connection
	      System.out.println("Adding Product...");
	      conn = DriverManager.getConnection(DB_URL,USER,PASS);	
	      
	      // Execute a query
	      System.out.println("Adding Productt...");
	      stmt = conn.createStatement();
	      String sql;
	      sql = "select * from Product where product_name='"+productname+"' and product_category='"+productcat+"'";
	      ResultSet rs = stmt.executeQuery(sql);
	      HttpSession session=req.getSession();
	      if(!rs.next())  // Valid User
	      {	
	    	  sql="insert into Product values('"+productid+"','"+productname+"','GIZZLY',"+productprice+",'"+productcat+"',"+10.00+",'"+productdesc+"',"+10+",'"+productimage1+"','"+productimage2+"','"+productimage3+"','"+productimage4+"','"+productimage5+"')";
	    	  stmt.executeUpdate(sql);
	    	  session.setAttribute("Msg3","Product Added Successfully.");
	    	  res.sendRedirect("Add Product.jsp");
	      }
	      else
	      {
	    	   
	    	  session.setAttribute("Msg3","Product Already Exits");
	    	  res.sendRedirect("Add Product.jsp");
	      }
	      // Closing connections
	      rs.close();
	      stmt.close();
	      conn.close();
	    }
	    
	    catch(SQLException se)  // Handle errors for JDBC
	    {      
	      se.printStackTrace();
	    }
	    catch(Exception e)   //Handle errors for Class.forName
	    {    
	      e.printStackTrace();
	    }
	    finally  //finally block used to close resources
	    {     
	      try
	      {
	         if(stmt!=null)
	            stmt.close();
	      }
	      catch(SQLException se2)
	      {
	    	// nothing we can do
	      }
	      try
	      {
	         if(conn!=null)
	            conn.close();
	      }
	      catch(SQLException se)
	      {
	         se.printStackTrace();
	      }
	    }//end finally try
	

}
}
