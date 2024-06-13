<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>

    <%
    String uid=request.getParameter("uids");
    String pwd=request.getParameter("pwds");
    String type ;

    try
    {
  	  Class.forName("com.mysql.jdbc.Driver").newInstance();
  	 // Class.forName("com.mysql.cj.jdbc.Driver");
  	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/events?useSSL=false&allowPublicKeyRetrieval=true","root","root");
  	 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/events","root","root");
  	    
   	Statement st=con.createStatement();
  //  String sql="select * from WBMSlogin where userid='"+uid+"' and pwd='"+pwd+"'";
    ResultSet rs=st.executeQuery("select * from WBMSlogin where userid='"+uid+"' and pwd='"+pwd+"'");
  while(rs.next())
     {
      
    if((uid.equals(rs.getString(1)))&&(pwd.equals( rs.getString(2))))
     { 
     type=rs.getString(6);
     if(type.equals("Admin"))
     {    
      response.sendRedirect("Adminpage.html");
     }
     else if(type.equals("users"))
     {
      response.sendRedirect("userhme1.html");
     }
  }
  }

     response.sendRedirect("ReLogin.html");
   
    }   


  catch(Exception e)
     {
      out.println(e.getMessage());
      out.println("Err "+e);
      System.out.println(e);
     }
    %>