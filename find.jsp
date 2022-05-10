<!DOCTYPE html>
<html>
<head>
<title>Jsp Sample</title>
    <%@page import="java.sql.*"%>
    <%@ page import="java.io.*" %> 
    
</head>
<body ><form name="find vechicle.html" action="find vechicle.html" method="post">

<div>
<button style="position: relative; left: 10%;height:30px ;width:120px" >HOME</button>
  </div>
  
<h1 style="text-align:center"><img src="LOGO.PNG" ; style="width: 45px; height: 45px"></img>PARKING LOT</h1>
<h2 style="text-align:center">FIND MY VECHICLE </h1>
<table>		
		<div><tr>
		<br><td><td ><label for="Enterlot"  style="margin-left:400px">Vechicle Number</label><input style="margin-left: 30px" type="text" name="vechiclenumber" value="" size="50" id="vechiclenumber"/></td> 
		</tr></div>
</table>
 <div>
    <br><br><button style="position: relative; left: 46% ;height:30px;width:120px";"type=submit";"value=submit";>FIND</button>
  </div></h2>
    <%
    String vechiclenumber=request.getParameter("vechiclenumber");
    if(vechiclenumber!="")
    {	
    try
    {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/parking","root","nivi");
        PreparedStatement pst = con.prepareStatement("select h.vechicletype,h.enterlot1,h.vechiclenumber,h.checkin,m.checkout from checkin as h inner join checkout as m on h.vechiclenumber=m.vechiclenumber where h.vechiclenumber=?");
       	pst.setString(1,vechiclenumber);
        ResultSet rs=pst.executeQuery();
        rs.next();
        String lot=rs.getString("Enterlot1");
        String checkinn=rs.getString("checkin");
         %>
    <p style="text-align:center;"><br><font size="+2" color="green" ><% out.println("PARKING HISTORY");%><br></font></p>
    <table border=1 align=center style="text-align:center">
      <thead>
          <tr>
             <th>vechiclenumber</th>
             <th>LOT</th>
             <th>Checkin</th>
             <th>checkout</th>
             <th>vechicletype</th>
          </tr>
      </thead>
  <tbody>
        <% while(rs.next())
        {
            %>
            <tr>
                <td><%=rs.getString("vechiclenumber") %></td>
                <td><%=rs.getString("Enterlot1") %></td>
                <td><%=rs.getString("Checkin") %></td>
                <td><%=rs.getString("checkout") %></td>
                <td><%=rs.getString("vechicletype") %></td>
            </tr>
            <%}%>
           </tbody>
        </table><br> 
       
        
        <p style="text-align:center;"><br><font size="+2" color="green" ><% out.println("Vechicle "+vechiclenumber+" is parked at "+lot+" at "+checkinn);%><br></font></p>
        <p align="center"><input align="right" type="submit" value="back" /></p></form>
    <%}
    catch(Exception ex){ex.printStackTrace();
    %>
    </font><p style="text-align:center;">
    <font size="+3" color="red"></b>
    <%
    out.println("Invalid data");
    }}
    else
    {%>
    <p style="text-align:center;"><font size="+2" color="red"></b>
    <% 
    	out.println("Enter the data in field");
    }
    %></font></p>
</body>
</html>