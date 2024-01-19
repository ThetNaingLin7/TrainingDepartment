package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class SelectedCourseDao {

public Course saveRegisterCourse(String register_name, String register_email, String registerCity, String register_course) {
		
		// TODO Auto-generated method stub
		Course reg_course=new Course();
		
		try {
			// step2: Register Driver
			Class.forName("com.mysql.jdbc.Driver");

			// Step 3: Create Connection
			String url = "jdbc:mysql://localhost/studentDB";
			Connection con = DriverManager.getConnection(url, "root", "abcdefg12345");

			

			// step4: Create a Statement
			Statement stmt = con.createStatement();

			// Insert to the database (Used executeUpdate for insert/delete and update)
			int result = stmt.executeUpdate(
					"INSERT INTO `studentDB`.`registerCourse` (userName,userEmail,userCity,userSelectedCourse) values ('"
							+ register_name + "','" + register_email + "','" + registerCity + "','" + register_course + "');");

				// Put the data to access from controller/JSP
				reg_course.setUserName(register_name);
				reg_course.setUserEmail(register_email);
				reg_course.setUserCity(registerCity);
				reg_course.setSelectedCourse(register_course);
				
			// step 7: Close the statement and connection
			stmt.close();
			con.close();

		} catch (Exception e) {
			e.printStackTrace();

		}

		return reg_course;
	}
	
}
