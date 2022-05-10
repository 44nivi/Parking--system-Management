<%@ page import="java.sql.*"%>
<%@ page import="java.io.*" %> 
<br> <br><form  name ="checkout" action="total floors.html" method="post"> <div>
   <br> <br><button style="position: relative; left: 20%;height:30px ;width:120px" >HOME</button>
  </div></form>
  </div>
<h1 style="text-align: center">
		<img src="LOGO.PNG" ; style="width: 45px; height: 45px"></img>PARKING
		LOT
	</h1>
		<h2 style="text-align: center">
			CHECK OUT
			</h1>
			<br>
				<br>
				<div>
					<table>
						<tr>

							<br>
							<td><label for="vechiclenumber" style="margin-left: 380px">vechicle
									number</label> <input style="margin-left: 10px" "type=text"
								name="vechiclenumber" value="" size="50" align:"center"/></td>
						</tr>
					</table>
					<tr>
					<br><td>
								<label for="checkout" style="margin-left: 390px">check
										out time</label>
							<input style="margin-left: 15px" type="datetime-local" name="checkout" id="checkout" value="" size="50" />
							</td></tr>
							
							<br><br><br><br>
						<button style="position: relative; left: 46%;height:30px ; width:120px">Check out</button></div></h2>
<% 
String vechiclenumber=request.getParameter("vechiclenumber");
String Checkout=request.getParameter("checkout");


if(vechiclenumber!="" && Checkout!="")
{
try
{ Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/parking","root","nivi");
Statement st=con.createStatement();
st.executeUpdate("insert into checkout(vechiclenumber,Checkout)values('"+vechiclenumber+"','"+Checkout+"')");
if(!con.isClosed())
%>
<p style="text-align:center;">
<font size="+2" color="green"></b>
<% 
out.println("The vechicle checked out successully");%></font>
<%
PreparedStatement ps = con.prepareStatement("SELECT h.vechiclenumber,h.vechicletype, TIMEDIFF(m.checkout, h.checkin) AS totaltime FROM checkin as h INNER JOIN checkout as m ON h.vechiclenumber = m.vechiclenumber where h.vechiclenumber=?");
ps.setString(1,vechiclenumber);
ResultSet rst=ps.executeQuery();
rst.next();
String num=rst.getString("vechiclenumber");
String diff=rst.getString("totaltime");
String vtype=rst.getString("vechicletype");
String sub=diff.substring(0,2);
int hour=Integer.parseInt(sub);
int charge;
if(vtype=="two")
{
charge=hour*10;%><br><font size="+2" color="green"><%
out.println(charge);%></font><% 
}else{charge=hour*50;}%><br><font size="+2" color="green"><%
out.println("\n The parking duration of vechicle Number "+num+" is "+diff+"hours cost: "+charge);%></font><% 
con.close();
}
catch(Exception ex){ex.printStackTrace();
%>
</font></p>
<p style="text-align:center;">
<font size="+2" color="red"></b>
<%
out.println("Unable to connect to database.");
}}
else
{%>
<p style="text-align:center;"><font size="+2" color="red"></b>
<% 
	out.println("Enter the data in all fields");
}
%>
</font></p>