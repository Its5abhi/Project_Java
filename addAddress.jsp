<%@page import="java.sql.*" %>>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   String s1=request.getParameter("name");
   String s2=request.getParameter("mno");
   String s3=request.getParameter("pincode");
   String s4=request.getParameter("add");
   String s5=request.getParameter("locality");
   String s6=request.getParameter("city");
   String s7=request.getParameter("state");

   try{
	   Class.forName("org.postgresql.Driver");
	   Connection con=DriverManager.getConnection("jdbc:postgresql://localhost/abhi","postgres","");
	   PreparedStatement pst=con.prepareStatement("insert into address1 values(?,?,?,?,?,?,?)");
	   
	   pst.setString(1,s1);
	   pst.setString(2,s3);
	   pst.setString(3,s3);
	   pst.setString(4,s4);
	   pst.setString(5,s5);
	   pst.setString(6,s6);
	   pst.setString(7,s7);
	   
	   pst.executeUpdate();
   }catch(Exception e){
	   out.println(e);
   }
%>>