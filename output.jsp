
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 

<html> 
<head> 
<title>Connection with mysql database</title> 
</head> 
<body><form name="total floors" action="total floors.html" method="post"> <br>
	<button style="position:relative;left: 15%;height:30px ; width:120px;" >HOME</button></form>
<h1 style="text-align: center">
		<img src="LOGO.PNG" ; style="width: 45px; height: 45px"></img>PARKING
		LOT
	</h1>
		<h2 style="text-align: center">
			CHECK IN
			</h1></h2>
				<br>
				<br>
				<div>
					<table>
						<tr>

							<br>
							<td><label for="first" style="margin-left: 380px">vechicle
									number</label> <input style="margin-left: 10px" "type=text" "id=vechiclenumber"
								 name="vechiclenumber" value="" size="50" align:"center"/></td>
						</tr>
				 </table>
					<table>
						<div>
							<tr>
								<td>
									<label for="vechicletype" style="margin-left: 380px">Vehicle Type</label>
										<input style="margin-left: 20px" type="radio" value="two" onchange="checked" name="vechicletype" id="vechicletype"/>two wheeler<img src="/parking syste/src/s.PNG" />
								<input style="margin-left: 30px" type="radio" value="four" name="vechicletype" />
									four wheeler																														
									<img src="E:/installation folder/elcipse/New folder/nivii/sad.PNG">
							</td>
							</tr>
						</div>
						<br>
					</table>
					<table>
						<div>
							<tr>
								<br>
								<td>
								<td><label for="Enterlot1" style="margin-left: 380px">Enter
										lot</label><input style="margin-left: 60px" type="text" name="Enterlot1" value="" size="50";id="Enterlot1"/></td>
							</tr>
						</div>
					</table>
					<table>
						<div>
							<tr>

								<br>
								<td><label for="last" style="margin-left: 380px">check
										in date</label>
										<input style="margin-left: 40px" type="datetime-local" name="Checkin" id="Checkin"
									value="" size="50" /></td>
							</tr>
						</div>
					</table>
					<div>
						<br>	
						<button style="position: relative; left: 46% ;height:30px;width:120px";"type=submit";"value=submit";>Check in</button>
					</div></div>
<% 
String vechiclenumber=request.getParameter("vechiclenumber");
String vechicletype=request.getParameter("vechicletype");
String Enterlot1=request.getParameter("Enterlot1");
String Checkin=request.getParameter("Checkin");

if(vechiclenumber!="" && vechicletype!="" && Enterlot1!="" && Checkin!=""){
try { 	
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/parking","root","nivi");
Statement st=con.createStatement();
PreparedStatement ps = con.prepareStatement("select count(Enterlot1)as lotcount from checkin where Enterlot1=?");
ps.setString(1,Enterlot1);
ResultSet rst=ps.executeQuery();
rst.next();
String lott=rst.getString("lotcount");
int lottcount=Integer.parseInt(lott);
if(lottcount<10)
{
st.executeUpdate("insert into checkin values('"+vechiclenumber+"','"+vechicletype+"','"+Enterlot1+"','"+Checkin+"')");
// check weather connection is established or not by isClosed() method 
if(!con.isClosed()){
%>
<p style="text-align:center;"><font size="+2" color="green"></b>
<% }
out.println("The vechicle is parked at "+Enterlot1+" lot");
con.close();}
else
{%>
	<p style="text-align:center;"><font size="+2" color="red"></b>
	<% 
	out.println("The Entered lot "+Enterlot1+" is full");
	con.close();
}}
catch(Exception ex){
ex.printStackTrace();
%>
</font></p>
<p style="text-align:center;">
<font size="+2" color="red" ></b>
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
</body> 
</html>




