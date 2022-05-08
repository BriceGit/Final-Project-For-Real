import java.io.File;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Random;
import java.util.stream.IntStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import Util.Constant;

@WebServlet("/SubmitItem")
@MultipartConfig(
		  fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
		  maxFileSize = 1024 * 1024 * 10,      // 10 MB
		  maxRequestSize = 1024 * 1024 * 100   // 100 MB
		  )
public class ItemSubmissionDispatcher extends HttpServlet {
	
	// for retrieving random numbers
	Random RNG = null;
	
	public void init()
	{
		//instantiate rng automatically upon program start
		RNG = new Random();
		System.out.println("initialized");
	}
	
	protected void doPost (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		
			// getting information from form. Pre-validated using jsp
			String itemName = request.getParameter("name");
//			String tag1 = request.getParameter("tag1");
//			String tag2 = request.getParameter("tag2");
//			String tag3 = request.getParameter("tag3");
			String username = request.getParameter("username");
//			String description = request.getParameter("description");
//			Double price = Double.valueOf(request.getParameter("price"));
//			
			// get the image part from the form
			Part imagePart = request.getPart("image");
			
			// create a name for the file this image will be submitted into
			String imageFileName = username + itemName + RNG.nextInt(1000000000) + ".jpg";
			
			// get image as a stream
			InputStream imageStream =  imagePart.getInputStream();
			
//		    String basePath = new File("").getAbsolutePath();
		    
		    System.out.println(System.getProperty("user.dir"));
			
			System.out.println(imageFileName);
			
			File f = new File(imageFileName);
			
			
			if (f.createNewFile())
			{
				System.out.println("Hey");
			}
			else
			{
				System.out.println("Bye");
			}
			
			// create file for the image to be written to 
			FileOutputStream out = new FileOutputStream(f);
			
			// write image to file as a stream
			imageStream.transferTo(out);
			
			// Kritin here
			
			String queryString = "";
			
			// database persisting logic
			try {
				Class.forName("com.mysql.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				// hopefully never an issue
				e.printStackTrace();
			}
			
			// connect to database and execute query
			try(Connection connect = DriverManager.getConnection(Constant.SQLUrl, Constant.SQLuser, Constant.SQLpass);
					Statement st = connect.createStatement();) {
					st.executeUpdate(queryString);
			}
			catch (SQLException e)
			{
				// TODO: decide how we're going to handle exceptions
			}
			
			// If all goes well, we redirect to homepage
			request.getRequestDispatcher("index.jsp").forward(request, response);
			
			
			
			
			
	}
}
