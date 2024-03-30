<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <%@page language="java" %>
 <%@page import="java.sql.*" %>
<%
    String user=request.getParameter("user");
    String password=request.getParameter("password");
    String result=request.getParameter("result");
   
    try{
	   Class.forName("org.postgresql.Driver");
	   Connection con=DriverManager.getConnection("jdbc:postgresql://localhost/abhi","postgres","");
	   Statement st=con.createStatement();
	  
	   ResultSet rs=st.executeQuery("select * from login where username='"+user+"' and password='"+password+"'");
	  
	   
	   if(result.equals("Signup")){
		   response.sendRedirect("Registration.jsp");
	  }
	   else{
	   if(rs.next()){
		   String s1=rs.getString(3);
		   String s2=rs.getString(4);
		   if(user.equals(s1) && password.equals(s2)){
            response.sendRedirect("index.html");
		  }
		   
	    }
	   else{
		   out.println("Enter correct user and password");
	   }
	   }
	  
    }catch(Exception e){
	   out.println(e);
	 }
 %>    
