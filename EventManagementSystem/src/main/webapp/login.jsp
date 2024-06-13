<%@ page import="java.sql.*"%>
<%!Connection con;
   Statement st;
   ResultSet rs;
   String sql;
    

%>
<%
String uid=request.getParameter("uids");
String pwd=request.getParameter("pwds");
String type ;
   try
  {
	//   Class.forName("com.mysql.cj.jdbc.Driver");
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	 //  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/events","root","root"); 
	  //  Connection con=DriverManager.getConnection("jdbc:mysql://localhost/events","root","root");

	    
  }
catch(ClassNotFoundException e)
   {
    out.println(e.getMessage());
    out.println("Err "+e);
   }

  try
  {
	  //Class.forName("com.mysql.jdbc.Driver").newInstance();
	  Class.forName("com.mysql.cj.jdbc.Driver");
	 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/events?useSSL=false&allowPublicKeyRetrieval=true","root","root");
	// con=DriverManager.getConnection("jdbc:mysql://localhost:3306/events","root","root");
	    
   st=con.createStatement();
   sql="select * from WBMSlogin where userid='"+uid+"' and pwd='"+pwd+"'";
   rs=st.executeQuery(sql);
while(rs.next())
   {
    
  if((uid.equals(rs.getString(1)))&&(pwd.equals( rs.getString(2))))
   { 
   type=rs.getString(6);
   if(type.equals("admin"))
   {    
    response.sendRedirect("Adminpage.html");
   }
   else if(type.equals("faculty"))
   {
    response.sendRedirect("userhme1.html");
   }
}
}
response.sendRedirect("Adminpage.html");
  // response.sendRedirect("ReLogin.html");
 
  }   


catch(Exception e)
   {
    out.println(e.getMessage());
    out.println("Err "+e);
   }
%>