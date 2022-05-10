<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title><%@page import="java.sql.*"%>
    <%@ page import="java.io.*" %> 
     <%@page import="java.sql.*"%>
</head>
<body><form name="showlots" action="total floors.html" method="post">
<div>
   <br> <button style="position: relative; left: 20%;height:30px ;width:120px" >HOME</button>
  </div></form>
  <form name="showlots" action="" method="post"></form>
<h1 style="text-align: center">
		<img src="LOGO.PNG" ; style="width: 45px; height: 45px"></img>PARKING
		LOT
	</h1>
	<form name="showlots" action="results.jsp" method="post">
		<h2 style="text-align: center">
			SHOW LOTS
			</h1>

</h2></form>
  <%try
    {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/parking","root","nivi");
        PreparedStatement pst = con.prepareStatement("SELECT COUNT(vechiclenumber)as No_of_vechicle,Enterlot1 FROM checkin GROUP BY Enterlot1;");
        ResultSet rs=pst.executeQuery();
        
        PreparedStatement ps = con.prepareStatement("SELECT COUNT(vechiclenumber)as No_of_vechicle,Enterlot1 FROM checkin GROUP BY Enterlot1;");
        ResultSet rst=ps.executeQuery();
    %><table border=1 align=center style="text-align:center">
      <thead>
          <tr>
             <th>LOT</th>
             <th>NO OF VECHICLE</th>
             <th>CAPACITY</th>
             <th>AVAILABILITY</th>
   
          </tr>
      </thead>
  <tbody>
        <% while(rs.next())
        {
        	int ve=rs.getInt("no_of_vechicle");
        	int cp=10;
        	int res=cp-ve;
        	
            %>
            <tr>
                <td><%=rs.getString("Enterlot1") %></td>
                <td><%=rs.getString("No_of_vechicle") %></td>
                <td><%out.println(cp); %></td>
                 <td><%out.println(res); %></td>
            </tr>
            <%}%>
           </tbody>
        </table><br> </form>
    <%}
    catch(Exception ex){ex.printStackTrace();
    %>
    </font>
    <font size="+3" color="red"></b>
    <%
    out.println("Unable to connect to database.");
    }
    %>
</body>
</html>
</body>
</html>