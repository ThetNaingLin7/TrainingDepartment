package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ReadSheet;

public class TrainingSessionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public TrainingSessionServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	
		
		// Create the CoursesAccess class Object
		ReadSheet readSheet = new ReadSheet();
		
		//Call the Method to get a list of course
		List<String> coursesFromExcel = readSheet.readCourses();
		
		
		request.setAttribute("mycourses", coursesFromExcel);
		
		RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
		rd.forward(request, response); 
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	

}
