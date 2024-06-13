<%@ page isThreadSafe="true" %>
<!--%@ page errorPage="errorpage.jsp" %-->
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="java.sql.*,javax.sql.*,javax.naming.*" %>
<%@ page session="true" %>
<%

Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/events?useSSL=false&allowPublicKeyRetrieval=true","root","root");


			Statement stmt=con.createStatement();			
	String Uid=request.getParameter("Uid");
	String pwd=request.getParameter("pwd");
	String mailid=request.getParameter("mailid");
	String collid=request.getParameter("collid");
	String dep=request.getParameter("dep");
	String usertype=request.getParameter("usertype");
				
	String str="update wbmslogin set  userid='"+Uid+"',pwd='"+pwd+"',mailid='"+mailid+"',collid='"+collid+"',dept='"+dep+"',usertype='"+usertype+"' where userid='"+Uid+"'";
	stmt.execute(str);
       // con.commit(); 

		out.println("<body bgcolor='yellow'><h1 align='center'>One Record Updated  Successfully!</h1>");



%>