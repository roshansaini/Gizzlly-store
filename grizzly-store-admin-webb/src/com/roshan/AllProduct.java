package com.roshan;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

 
public class AllProduct extends HttpServlet {
	protected void doPost(HttpServletRequest req,HttpServletResponse res)
	{
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
	      System.out.println("Connecting to database...");
	      conn = DriverManager.getConnection(DB_URL,USER,PASS);	
	      
	      // Execute a query
	      System.out.println("Creating statement...");
	      stmt = conn.createStatement();
	      String sql;
	      sql = "SELECT * FROM Product";
	      ResultSet rs = stmt.executeQuery(sql);
	      
	      ArrayList<Product> productlist=new ArrayList<Product>();
		  while(rs.next())
		  {
			  Product product=new Product();
  			product.setProduct(rs.getString("product_id"),rs.getString("product_name"),rs.getString("product_brand"),rs.getInt("product_price"),rs.getString("product_category"),rs.getFloat("product_rating"),rs.getString("product_description"),rs.getInt("product_discount"),rs.getString("product_image1"),rs.getString("product_image2"),rs.getString("product_image3"),rs.getString("product_image4"),rs.getString("product_image5"));
  			productlist.add(product);
		  }
		  HttpSession session=req.getSession();  
		  session.setAttribute("Productslist", productlist);
		  RequestDispatcher rd = req.getRequestDispatcher("Welcome.jsp");
		  rd.forward(req, res);
	      
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
