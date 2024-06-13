<%@ page import="java.io.*,java.util.*" %>
<%@ page import="java.sql.*,javax.sql.*,javax.naming.*" %>
<%@ page session="true" %>
<%	


Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/events?useSSL=false&allowPublicKeyRetrieval=true","root","root");

  Statement stmt=con.createStatement();
   int count=0;
   String MeetName=request.getParameter("cancel");    

   count=stmt.executeUpdate("delete from MeetingTable where Mname='"+MeetName+"'");
	if(count>0){


              out.println("<body bgcolor='yellow'><h1 align='center'>Meeting Deleted Successfully Deleted Successfully!</h1>");

      	       
	}else{
                 out.println("Meeting  was not deleted");  	
	
	}
	%>