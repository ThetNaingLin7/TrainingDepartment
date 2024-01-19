package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class courseListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		  PrintWriter out=response.getWriter();
		  
		  
		  out.println("<html>");
		  out.println("<title>Student List Page</title>");
		  out.println("<body bgcolor=lightpink style='color: black;'> ");
		  out.println("<h2>List of Users:</h2> <a href=\"admin.jsp\">\n"
		  		+ "		<button>\n"
		  		+ "			Back\n"
		  		+ "		</button>\n"
		  		+ "	</a>");
		  out.println("<hr>");
		  out.println("<br>");
		  out.println("<br>");
		  
		  out.println("<center>");
		  out.println("<br>");
		  out.println("<br>");
		  try {
          //JDBC Connection
		     Class.forName("com.mysql.jdbc.Driver"); // registration mysql thin driver class
		     Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/studentDB","root","abcdefg12345"); //getConnection
		        
		        String sql="select * from registerCourse";
		        
		        PreparedStatement ps = con.prepareStatement(sql);
		        
           ResultSet rs =ps.executeQuery(); // for select the data from database..
			 
           out.println("<table border=1 width=25% height=25%>");  
        
          out.println("<tr>"
          		+ "<th>User Name</th>"
          		+ "<th>Email</th>"
          		+ "<th>City</th>"
          		+ "<th>Selected Course</th>"
          		+ "<th>Delete</th>"
          		+ "<tr>"); 
      
        while(rs.next()){
            out.println("<tr> "
            		
            		+ "<td>" + rs.getString(2)+ "</td> "
            		+ "<td>"+rs.getString(3)+" </td> "
            		+ "<td>"+rs.getString(4)+"</td> "
            		+ "<td>"+rs.getString(5)+ "</td>"
            		+ "<td><a style='color:red;' href='student_delete.jsp?studentid=" + rs.getString(1) + "' onclick='return confirmDelete()'>Delete</a></td>"
            		
            		+ "</tr>");
        }
                out.println("</table");
        con.close();
                
        
    }catch(ClassNotFoundException e){
        out.println("Error "+e);
        
    } catch (SQLException e) {
			 
			e.printStackTrace();
		}
		 out.println("</center>");
     out.println("</body>");
     out.println("<script src='delete.js'></script>");
     out.println("</html>");
    

	}

}
