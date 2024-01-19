<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
    <%@ page import = "java.util.*" %>
    <%@ page import = "java.sql.*" %>
    <%@ page import = "java.util.ArrayList" %>
    <%@ page import = "controller.deleteServlet" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User List Page</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
        integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background: url('./background.jpg') no-repeat;
            background-size: cover;
            background-position: center;
        }

        /* Nav bar start */

        header {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            padding: 20px 100px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            z-index: 99;
        }

        .logo {
            font-size: 2rem;
            color: #fff;
            user-select: none;
        }

        .navigation a {
            position: relative;
            font-size: 1.1em;
            text-decoration: none;
            margin-left: 40px;
            color: #fff;
            font-weight: 1000;
        }

        .navigation a::after {
            content: '';
            position: absolute;
            left: 0;
            bottom: -7px;
            width: 100%;
            height: 3px;
            background: #fff;
            border-radius: 5px;
            transform-origin: right;
            transform: scaleX(0);
            transition: transform .5s;
        }

        .navigation a:hover::after {
            transform-origin: left;
            transform: scaleX(1);
        }

        /* Nav Bar end  */
        .wrapper {
            position: relative;
            background: transparent;
            border: 2px solid rgba(255, 255, 255, .5);
            border-radius: 20px;
            backdrop-filter: blur(20px);
            box-shadow: 0 0 30px rgba(0, 0, 0, .5);
        }
    </style>

</head>

<body>
    <div class="w-75 py-4">

        <div class="text-white text-center">
            <h2>User List</h2>
        </div>
       
        <!-- Retrieve and display the deletion message -->
		  <%
		  HttpSession sess = request.getSession();
		  String message = (String) sess.getAttribute("message");
		  if (message != null) { %>
			<div class="d-flex justify-content-center">
	        	<p class="wrapper text-white text-center px-3"><%= message %> </p>
       		</div>
			<%
		     session.removeAttribute("message"); 
		  }
		  %>
        
		<%
		try {
	          //JDBC Connection
				Class.forName("com.mysql.jdbc.Driver"); // registration mysql thin driver class
				Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/studentDB","root","abcdefg12345"); //getConnection
			        
				String sql="select * from registerCourse";
			        
				PreparedStatement ps = con.prepareStatement(sql);
			        
	           	ResultSet rs =ps.executeQuery(); // for select the data from database..
		%>

        <table class="table table-striped table-dark table-bordered table-hover">
            <thead class="text-center">
                <tr>
                    <th scope="col">User Name</th>
                    <th scope="col">Email</th>
                    <th scope="col">City</th>
                    <th scope="col">Selected Course</th>
                   <!--  <th scope="col">Delete User</th> -->
                    <th scope="col">Delete User</th>
                </tr>
            </thead>
    	<%
    		while(rs.next()){
    	%>  
            <tbody>
                <tr>
                    <td><%= rs.getString(2) %></td>
                    <td><%= rs.getString(3) %></td>
                    <td><%= rs.getString(4) %></td>
                    <td><%= rs.getString(5) %></td>
                    
<%--                      <td class="text-center"><a class="text-decoration-none text-danger" href="student_delete.jsp?studentid=<%= rs.getString(1) %>" onclick="return confirmDelete()">Delete</a></td>
 --%>               	
                	<td class="text-center" onclick="return confirmDelete()"> 
                	
                		<form action="delete" method="post" >
                			<input type="hidden" name="userID" value="<%= rs.getString(1) %>">
                			<input type="hidden" name="userNAME" value="<%= rs.getString(2) %>">
                			<button type="submit" class="btn text-danger">Delete</button>
                		</form>
                	</td>
                </tr>
            </tbody>
		<% } %>
        </table>
       	<% 
		}catch(ClassNotFoundException e){
			e.printStackTrace();
		}catch(SQLException e){
			e.printStackTrace();
		}
    	%>
        <div class="col-3 mx-auto">
            <a class="btn btn-info btn-lg" href="admin.jsp" role="button">Back to Admin Panel</a>
        </div>
    </div>
</body>

<script src='delete.js'></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
    crossorigin="anonymous"></script>

</html>