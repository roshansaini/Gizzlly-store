<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>Login</title>
</head>
<body>

<div class="container-fluid">
		<div class="row">
			<div class="card col-md-6 offset-md-3 align-middle" style="border:none;">
				<div class="card-title">
				<img src="http://localhost:8080/grizzly-store-admin-webb/images/logincopy.jpg" class="rounded mx-auto d-block" width="500px" height="150px"alt="">
				<hr>
				</div>
				<div class="card-body">
					<form class="form col-md-8 offset-md-2" action="login" method="post">						
						<label style="color:red;"><%= request.getAttribute("Msg") %></label>					
						<div class="form-group">
							<label for="username">UserName</label>
							<input type="email" name="uname" id="username" class="form-control">
						</div>
						<div class="form-group">
							<label for="password">Password</label>
							<input type="password" name="upass" id="password" class="form-control">
						</div>
						<button type="submit" class="btn btn-primary">Submit</button>
						
						<div class="form-group">
						<br/>
							<a href="">Forgot password ? Click Here</a>
						</div>
					</form>
				</div>
			<div class="card-footer"  style="border:none;"></div>
		</div>
	</div>
</div>


<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>    