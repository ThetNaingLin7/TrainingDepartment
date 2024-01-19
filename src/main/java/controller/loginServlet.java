package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		try (PrintWriter out = response.getWriter())
		{
            String name=request.getParameter("userName");  
            String password=request.getParameter("userPassword");  

            if(name.equals("adminXin") && password.equals("admin"))
             {  
                    RequestDispatcher rd=(RequestDispatcher)request.getRequestDispatcher("/admin.jsp");  
                    rd.forward(request, response);   //admin page 
             }  
                 else
             {  
               	  RequestDispatcher rd=(RequestDispatcher) request.getRequestDispatcher("/home.html");  
               	  rd.forward(request, response);   //user page                    
             }     
                 
      }
	}

}
