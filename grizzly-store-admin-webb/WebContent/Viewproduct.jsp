<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>View Product</title>
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

    #logout,#options,#addproduct,#viewproduct
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
                            <a class="nav-item nav-link active" id="nav-productinfo-tab" data-toggle="tab" href="#nav-productinfo" role="tab" aria-controls="nav-productinfo" aria-selected="true"><b>Product Info</b></a>                            
                        </div>
                    </nav>
                    <div class="tab-content" id="nav-tabContent">
                    <div class="tab-pane fade show active" id="nav-productinfo" role="tabpanel" aria-labelledby="nav-productinfo-tab"><br>
                        <div class="row">
                            <div class="col-md-12">
                                <p><span style="font-size:20px;"><b><%= request.getParameter("name") %></b></span> by <%= request.getParameter("brand") %> <span class="fa fa-edit"></span></p>
                            </div>
                            <div class="col-md-7">
                                <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                                    <ol class="carousel-indicators">
                                        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                                        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                                        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                                        <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
                                        <li data-target="#carouselExampleIndicators" data-slide-to="4"></li>
                                    </ol>
                                    <div class="carousel-inner">
                                        <div class="carousel-item active">
                                        <img class="d-block w-100" src="http://localhost:8080/grizzly-store-admin-webb/images/<%= request.getParameter("image1") %>" alt="First slide">
                                        </div>
                                        <div class="carousel-item">
                                        <img class="d-block w-100" src="http://localhost:8080/grizzly-store-admin-webb/images/<%= request.getParameter("image2") %>" alt="Second slide">
                                        </div>
                                        <div class="carousel-item">
                                        <img class="d-block w-100" src="http://localhost:8080/grizzly-store-admin-webb/images/<%= request.getParameter("image3") %>" alt="Third slide">
                                        </div>
                                        <div class="carousel-item">
                                            <img class="d-block w-100" src="http://localhost:8080/grizzly-store-admin-webb/images/<%= request.getParameter("image4") %>" alt="Third slide">
                                        </div>
                                        <div class="carousel-item">
                                            <img class="d-block w-100" src="http://localhost:8080/grizzly-store-admin-webb/images/<%= request.getParameter("image5") %>" alt="Third slide">
                                        </div>
                                    </div>
                                    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                        <span class="sr-only">Previous</span>
                                    </a>
                                    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                        <span class="sr-only">Next</span>
                                    </a>
                                    </div>
                            </div>
                            <div class="col-md-5">
                                <div>
                                    <h5>Product Description <span class="fa fa-edit"></span></h5>
                                </div><br>
                                <div>
                                    <p><%= request.getParameter("description") %></p>
                                </div>
                                <br>
                                <div>
                                    <p><span style="font-size:20px;"><i class="fas fa-rupee-sign"></i>Rs <%= request.getParameter("price") %><b></b></span> &nbsp;<%= request.getParameter("discount") %>%off <span class="fa fa-edit"></span></p>
                                </div>
                            </div>
                            <div class="col-md-12" style="text-align:right;">
                                <button class="btn" id="viewproduct">Finish</button>
                                <a class="btn" id="viewproduct" href="http://localhost:8080/grizzly-store-admin-webb/Welcome.jsp">Cancel</a>
                            </div>
                        </div>
                    </div>
                                     
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