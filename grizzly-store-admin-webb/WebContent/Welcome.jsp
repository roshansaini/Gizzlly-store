<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>Welcome</title>
<style>
    .navbar
     {
        position: relative;
        display: flex;
        flex-wrap: wrap;
        align-items: center;
        justify-content: space-between;
        padding: 0.5rem 1rem;
        background:#173F5F;
        color: #f2f2f2;
    }

    input[type=search] 
    {
        background: #206398 url(http://hp-proliant.co.uk/qual_images/mob-search-icon.png) no-repeat 9px center;
        border: solid 1px #ccc;
        border-radius: 50px;
        padding: 6.2px 8px 6.2px 26px;
        width: 55px;
        color:whitesmoke;
    }
    input[type=search]:focus
    {
        width: 250px;
        background-color: #ccc;
        border-color: #333;
        border: solid 1px #fff;
    }

    #logout,#options
    {
        border-radius: 50px;
        background-color: #206398;
        color:whitesmoke;
        width: 80px;
    }
    #addproduct
    {
        border-radius: 50px;
        background-color: #206398;
        color:whitesmoke;
    }
    .nav-item,.searchform
    {
        margin-left: 15px;
    }
    .searchform
    {
        margin-left: 40px;
    }

    #adminprofile
    {
        text-align:left;
        padding:5px;
        background-color: #173F5F;
        color:#206398;
    }
    #adminname
    {
        padding-top: 10px;
        color: #206398
    }
    .card-body.h6 + .card.body.p
    {
        margin-top:-20px;
    }
    #productform
    {
        margin-left: 20px;
    }
    </style>
  </head>
  <body>
 <%@ page import="java.util.*" %>
 <%@ page import="java.sql.*" %>
 <%@ page import="com.roshan.Product" %>
 <%@ page import="com.roshan.User" %>
<%

String userid=(String)session.getAttribute("userid");

if(userid==null)
{
	  RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
	  rd.forward(request, response);
}

%> 
<% 
	User user=(User)session.getAttribute("User");
%>
    <nav class="navbar navbar-expand-lg ">
        <a class="navbar-brand" href="Welcome.jsp">GRIZZLY STORE</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <form class="form-inline searchform">
            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
        </form>
        <div class="collapse navbar-collapse" id="navbarNav">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item active ml-auto">
              <a class="nav-link" href="#"><span class="fa fa-bell"><span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Welcome  <%= user.getUserName() %></a>
            </li>
            <li class="nav-item">
             <form action="logout" method="post"><button class="nav-link btn" type="submit" id="logout">Logout</button></form>
            </li>            
          </ul>
        </div>
      </nav>

<br>
    <section>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-3">
                    <div class="card">
                        <div card-header>
                            <p id="adminprofile">
                                <a href="#"><b>PROFILE</b></a>
                                <span style="float:right;"><a href="#"><b>Edit</b></a></span>
                            </p>                            
                        </div>
                        <div class="card-body text-center">
                            <img src="http://localhost:8080/grizzly-store-admin-webb/images/<%= user.getUserImage() %>" class="rounded mx-auto d-block" alt="Admin Photo">
                            <h5 id="adminname"><b><%= user.getUserName() %></b></h5><br>
                            <h6>ID</h6>
                            <p><%= user.getUserId() %></p><br>
                            <h6>DESIGNATION</h6>
                            <p><%= user.getUserDesignation() %></p><br>
                            <h6>OFFICE</h6>
                            <p><%= user.getUserAddress() %></p>
                        </div>
                    </div>
                </div>
                <div class="col-md-9">
                    <nav>
                        <div class="nav nav-tabs" id="nav-tab" role="tablist">
                            <a class="nav-item nav-link active" id="nav-product-tab" data-toggle="tab" href="#nav-product" role="tab" aria-controls="nav-product" aria-selected="true"><b>Product</b></a>
                            <a class="nav-item nav-link" id="nav-vendor-tab" data-toggle="tab" href="#nav-vendor" role="tab" aria-controls="nav-vendor" aria-selected="false"><b>Vendor</b></a>
                            <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false"><b>Profile</b></a>
                        </div>
                    </nav>
                    <div class="tab-content" id="nav-tabContent">
                    <div class="tab-pane fade show active" id="nav-product" role="tabpanel" aria-labelledby="nav-product-tab"><br>
                        <div>
                            <span style="float:left;" id="productform">
                                <select placeholder="Category" name="scategory" class="form-control" style="width:150px; border-radius:50px;">
                                    <option selected>Category</option>
                                    <option>Mens</option>
                                    <option>Womens</option>
                                    <option>Kids</option>
                                </select>
                            </span>
                            <span style="float:left;" id="productform">
                                <form class="form-inline searchformm">
                                    <input class="form-control mr-sm-2" type="search" placeholder=" Search" aria-label="Search" style="background-color:white;">
                                </form>
                            </span>
                            <span style="float:left;" id="productform">
                                <select placeholder="Sort by" name="sortby" class="form-control" style="width:150px; border-radius:50px;">
                                    <option selected>Sort By</option>
                                    <option>Name</option>
                                    <option>Rating</option>                                    
                                </select>
                            </span>
                            <span style="float:right;">
                                <a class="btn" href="Add Product.jsp" id="addproduct">Add Product</a>
                            </span>
                        </div>
                        <br>                                                
                        <div>  
                            <br>  
                            <br>                     
                            <table class="table">
                                <thead class="thead-light">
                                    <tr>
                                    <th scope="col">Product List</th>
                                    <th scope="col">Brand</th>
                                    <th scope="col">Category</th>
                                    <th scope="col">Rating</th>
                                    <th><th>
                                    </tr>
                                </thead>
                                <tbody>
                                <%
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
                        		  
	                              		for(Product i:productlist){
		                                out.println("<tr>");
		                              	out.println("<td>"+i.getProduct_name()+"</td>");
		                              	out.println("<td>"+i.getProduct_brand()+"</td>");
		                              	out.println("<td>"+i.getProduct_category()+"</td>");
		                              	out.println("<td>"+i.getProduct_rating()+"</td>");                                	
		                              	out.println("<td><a href='http://localhost:8080/grizzly-store-admin-webb/Viewproduct.jsp?id="+i.getProduct_id()+"&name="+i.getProduct_name()+"&brand="+i.getProduct_brand()+"&category="+i.getProduct_category()+"&price="+i.getProduct_price()+"&discount="+i.getProduct_discount()+"&description="+i.getProduct_description()+"&image1="+i.getProduct_image1()+"&image2="+i.getProduct_image2()+"&image3="+i.getProduct_image3()+"&image4="+i.getProduct_image4()+"&image5="+i.getProduct_image5()+"'class='btn viewproduct' id='options'>View</a> <a class='btn' id='options'>Edit</a><a class='btn' id='options'>Remove</a></td>");
		                              	out.println("</tr>");
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
                        	 
                        	  
                                %>
                                <%/*
                                   List<Product> ls=(ArrayList<Product>)session.getAttribute("Productslist");
                                	for(Product i:ls){
                                    out.println("<tr>");
                                	out.println("<td>"+i.getProduct_name()+"</td>");
                                	out.println("<td>"+i.getProduct_brand()+"</td>");
                                	out.println("<td>"+i.getProduct_category()+"</td>");
                                	out.println("<td>"+i.getProduct_rating()+"</td>");                                	
                                	out.println("<td><a href='http://localhost:8080/grizzly-store-admin-webb/Viewproduct.jsp?id="+i.getProduct_id()+"&name="+i.getProduct_name()+"&brand="+i.getProduct_brand()+"&category="+i.getProduct_category()+"&price="+i.getProduct_price()+"&discount="+i.getProduct_discount()+"&description="+i.getProduct_description()+"&image1="+i.getProduct_image1()+"&image2="+i.getProduct_image2()+"&image3="+i.getProduct_image3()+"&image4="+i.getProduct_image4()+"&image5="+i.getProduct_image5()+"'class='btn viewproduct' id='options'>View</a> <a class='btn' id='options'>Edit</a><a class='btn' id='options'>Remove</a></td>");
                                	out.println("</tr>");
                                }*/
                                %>                                    
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="nav-vendor" role="tabpanel" aria-labelledby="nav-vendor-tab">vendor</div>
                    <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">Profile</div>
                    </div>
                </div>
            </div>            
        </div>
    </section>
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>    