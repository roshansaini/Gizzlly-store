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

@WebServlet("/login")  
public class LoginServlet extends HttpServlet {

	protected void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException, IOException
	{
		String useremail=req.getParameter("uname");
		String userpassword=req.getParameter("upass");
		
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
	      sql = "SELECT * FROM User where user_email=\'"+useremail+"\'";
	      ResultSet rs = stmt.executeQuery(sql);
	      
	      if(rs.next())  // Valid User
	      {
	    	  String user_id=rs.getString("user_id");
	    	  String user_email=rs.getString("user_email");
	    	  String user_name=rs.getString("user_name");
	    	  String user_address=rs.getString("user_address");
	    	  String user_designation=rs.getString("user_designation");
	    	  String user_password=rs.getString("user_password");
	    	  String user_image=rs.getString("user_image");
	    	  int user_blocked=rs.getInt("user_blocked");
	    	  int user_attempt=rs.getInt("user_attempts");
	    	  
	    	  if(user_email.equals(useremail) && user_password.equals(userpassword) && user_blocked==0)
	    	  {   		 
	    		  HttpSession session=req.getSession();  
	    		  User user=new User(user_id,user_name,user_designation,user_address,user_image);
	    		  session.setAttribute("User", user);
	    		      	
	    		 
				  session.setAttribute("userid", user_id);		 
	    		  
	    		  RequestDispatcher rd = req.getRequestDispatcher("Welcome.jsp");
				  rd.forward(req, res);
	    	  }
	    	  else
	    	  {
	    		  user_attempt++;    		  
	        	  if(user_attempt>3)   // blocking access if no attempts is more than 3  
	        	  {
	        		  user_blocked=1;
	        		  sql="Update User SET user_blocked="+user_blocked+" where user_id='"+user_id+"'";
	            	  stmt.executeUpdate(sql);
	            	  req.setAttribute("Msg","Your Account is Blocked. Contact Adminstrator..!!");
	            	  RequestDispatcher rd = req.getRequestDispatcher("Login.jsp");
					  rd.forward(req, res);
	        	  }
	        	  else // updating the attempts
	        	  {
		        	  sql="Update User SET user_attempts="+user_attempt+" where user_id='"+user_id+"'";
		        	  stmt.executeUpdate(sql);
		    		  req.setAttribute("Msg","Invalid Credentials..!!");
		    		  RequestDispatcher rd = req.getRequestDispatcher("Login.jsp");
					  rd.forward(req, res);
	        	  }
	    		  
	    	  }
	    	 
	    	  
	      }
	      else // Non Valid User 
	      {	  
	    	  req.setAttribute("Msg","Wrong Username Password");
	    	  RequestDispatcher rd = req.getRequestDispatcher("Login.jsp");
			  rd.forward(req, res);
	    	 
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
