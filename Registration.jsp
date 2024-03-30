<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page language="java" %>
<%@page import="java.sql.*" %>    
    
    
<!DOCTYPE html>
<html lang="en">
<head>
 
    <meta charset="UTF-8">
 
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
 
    <title>Registration</title>
 
    <link rel="stylesheet" href="login.css">
</head>
<body>
 
     <div class="container">
         <form action="Registration.jsp" class="login" method="post">
 
              <label for="" id="label1">Name:</label>
             <input type="text" placeholder="Name*" id="user" name="name">
              <label for="" id="label1">Mobaile No:</label>
             <input type="text" placeholder="Mobaile No*" id="user" name="mno">
       
            <label for="" id="label">Enter Username:</label>
 
            <input type="text" placeholder="UserName*" name="user" id="user">
 
            <label for="" id="label">Enter Password:</label>
 
            <input type="text" placeholder="Password*" name="password" id="user">
 
 
            <input type="submit" value="Signup" id="add-btn" name="signup">
        </form>
     </div>

</body>

</html>

<%
   String name=request.getParameter("name");
   String mno=request.getParameter("mno");
   String user=request.getParameter("user");
   String password=request.getParameter("password");
   
   String result=request.getParameter("signup");
    try{
	   Class.forName("org.postgresql.Driver");
	   Connection con=DriverManager.getConnection("jdbc:postgresql://localhost/abhi","postgres","");
	   PreparedStatement pst=con.prepareStatement("insert into Login values(?,?,?,?)");
	   
    if(name!=null && mno!=null && user!=null && password !=null){
	     pst.setString(1, name);
	     pst.setString(2, mno);
	     pst.setString(3, user);
	     pst.setString(4, password);
	   
	     pst.execute();
	     response.sendRedirect("index.html");
	  }
    else{
    	out.println("Fill Write Registration");
    }
    
  }
    catch(Exception e){
    	out.println(e);
    }
	  
%>