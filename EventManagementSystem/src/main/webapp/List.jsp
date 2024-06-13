
<%@page import="java.sql.*" %>

<%
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/events?useSSL=false&allowPublicKeyRetrieval=true","root","root");

String vsql ;

  try{
     Statement st=con.createStatement();
     vsql="select *  from wbmslogin"; 
    ResultSet Rs=st.executeQuery(vsql);
%>
<html>
<head>
<title><List user </title>
</head>
<body bgcolor="#E2E2E2">
<h2 align="center">List user</h2>
<table border="1" align=center>
<thead>
<tr bgcolor="#26618D">
<th><font size="4" COLOR="#FFFF99">USER NAME</th>
<th><font size="4" COLOR="#FFFF99">E-MAIL ID</th>
<th><font size="4" COLOR="#FFFF99">COLLEGE ID</th>
<th><font size="4" COLOR="#FFFF99">DEPARTMENT</th>
<% 
while(Rs.next())
{%><tr bgcolor="#d3d2d1">
   <td><%out.println(Rs.getString(1));%></td>
   <td><%out.println(Rs.getString(3));%></td>
<td><%out.println(Rs.getString(4));%></td>
<td><%out.println(Rs.getString(5));%></td>
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

 


 

