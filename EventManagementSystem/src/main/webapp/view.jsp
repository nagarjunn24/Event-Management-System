
<%@page import="java.sql.*" %>

<%
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/events?useSSL=false", "root", "root");

String vsql ;

  try{
     Statement st=con.createStatement();
     vsql="select *  from MeetingTable";    
    ResultSet Rs=st.executeQuery(vsql);
%>
<html>
<head>
<title><SCHEDULED CONFERENCES</title>
</head>
<body bgcolor="#E2E2E2">
<h2 align="center">SCHEDULED MEETINGS</h2>
<table border="1" align=center>
<thead>
<tr bgcolor="#26618D">
<FONT FACE="Times New Roman" COLOR="#FFFF99">
<th><font size="3" COLOR="#FFFF99">MEETING NAME</th>
<th><font size="3" COLOR="#FFFF99">DESCRIPTION</th>
<th><font size="3" COLOR="#FFFF99">MEETING TYPE</th>
<th><font size="3" COLOR="#FFFF99">DATE </th>
<th><font size="3" COLOR="#FFFF99">DURATION</th>
<th><font size="3"  COLOR="#FFFF99">TIME</th>

<th><font size="3" COLOR="#FFFF99">PARTICIPANTS</th>
<th><font size="3" COLOR="#FFFF99">COLLEGE ID</th>
<th><font size="3" COLOR="#FFFF99">E-MAIL ID</th></FONT>
<% 
while(Rs.next())
{%><tr bgcolor="#d3d2d1">
   <td><%out.println(Rs.getString(1));%></td>
   <td><%out.println(Rs.getString(2));%></td>
  <td><%out.println(Rs.getString(3));%></td>
  <td><%out.println(Rs.getString(10)+" "+Rs.getString(9)+" "+Rs.getString(11));%></td>
  <td><%out.println(Rs.getString(7));%></td>
  <td><%out.println(Rs.getString(4)+":"+Rs.getString(5)+"   "+Rs.getString(6));%></td>

  <td><%out.println(Rs.getString(13));%></td>
   <td><%out.println(Rs.getString(10));%></td>
  <td><%out.println(Rs.getString(16));%></td>
   </tr>
<% 
  }
%>

</thead>
</body>
</html>

<%
}
catch(Exception e){out.println(e.getMessage());}

%>

 


 

