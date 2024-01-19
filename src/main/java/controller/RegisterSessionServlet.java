package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Course;
import model.SelectedCourseDao;
import model.SendEmail;

public class RegisterSessionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@SuppressWarnings("static-access")
	@Override	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String register_name = request.getParameter("name");
		String register_email = request.getParameter("email");
		String register_city = request.getParameter("city");
		String register_course = request.getParameter("course");
	
		SelectedCourseDao courseReg = new SelectedCourseDao();

		// Call the Method to save the register course
		Course reg_course = courseReg.saveRegisterCourse(register_name, register_email, register_city, register_course	);

		
		// Send Email To User
		SendEmail mm=new SendEmail();
		String sub="Registered Course Information";
				
		if(register_course.equals("Adobe Photoshop (Morning) (30000ks)") || 
		   register_course.equals("Adobe Premiere Pro (Morning) (40000ks)") || 
		   register_course.equals("Computer Basic (Morning) (15000ks)") ||
		   register_course.equals("Basic Programming (Morning) (20000ks)")){
			
			String message="Dear Student "+ register_name +",\n"
					+ "\nThis is from IT Training Department. Thank You for your registering."
					+ "You have selected " + register_course + " course."
					+ "Your schedule is from 9:00 AM to 11:00 AM morning as you have decided to attend the morning session.\n"
					+ "\nBest Regards,\n"
					+ "IT Training Department Team";
			 mm.send("thetnainglinn.tnl97@gmail.com","hlgdbciugfsoxfcs"


			 		+ "",register_email,sub,message); 
		}
		else{
			String message="Dear Student "+ register_name +",\n"
					+ "\nThis is from IT Training Department. Thank You for your registering."
					+ "You have selected " + register_course + " course."
					+ "Your schedule is from 4:00 PM to 6:00 PM evening as you have decided to attend the evening session.\n"
					+ "\nBest Regards,\n"
					+ "IT Training Department Team";
			 mm.send("thetnainglinn.tnl97@gmail.com","hlgdbciugfsoxfcs"
			 		+ "",register_email,sub,message); 
		}
	
		request.setAttribute("register_course", reg_course);

		// Dispatch the JSP
		RequestDispatcher rd = request.getRequestDispatcher("thankYou.jsp");
		rd.forward(request, response);		
	}
}
