package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//@WebServlet("/deleteServlet")
public class deleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int userId = Integer.parseInt(request.getParameter("userID"));
		String userName = request.getParameter("userNAME");
			
			deleteRecord(userId, userName);
			
	        boolean deleted = deleteRecord(userId, userName);
	
	        if (deleted) {
	            HttpSession session = request.getSession();
	            session.setAttribute("message", "Register Student \"" + userName + "\" has been deleted successfully.");
	        } else { 
	            HttpSession session = request.getSession();
	            session.setAttribute("message", "No record found with user name " + userName + ". No deletion performed.");
	        }
	
	        response.sendRedirect("userList.jsp");
	    }
	
	private boolean deleteRecord(int userID, String userName) {
		try {
            // Step 1: Register Driver
            Class.forName("com.mysql.jdbc.Driver");

            // Step 2: Create Connection
            String url = "jdbc:mysql://localhost/studentDB";
            Connection con = DriverManager.getConnection(url, "root", "abcdefg12345");

            // Step 3: Create a Statement
            Statement stmt = con.createStatement();

            // Execute SQL DELETE statement
            String deleteSQL = "DELETE FROM `studentDB`.`registerCourse` WHERE userId = " + userID;
            int rowsDeleted = stmt.executeUpdate(deleteSQL);

            if (rowsDeleted > 0) {
                System.out.println("Registeration of user ID " + userID + " deleted successfully!!!");
            } else {
                System.out.println("No record found with user ID " + userID + ". No deletion performed.");
            }

            // Step 4: Close the statement and connection
            stmt.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
		return true;
    }
	


	
	

}
