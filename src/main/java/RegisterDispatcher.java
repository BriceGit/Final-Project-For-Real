import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Util.Constant;
import Util.DatabaseStuff;

import java.io.IOException;
import java.io.Serial;
import java.sql.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Servlet implementation class RegisterDispatcher
 */
public class RegisterDispatcher extends HttpServlet {

    /**
     * Default constructor.
     */
    public RegisterDispatcher() {
    }


    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
		// get registration fields 
		String email = request.getParameter("register-email");
		String name = request.getParameter("register-name");
		String password = request.getParameter("register-password");
		String confirmationPassword = request.getParameter("confirm-password");
		
		// check for missing registration fields
		if (email == "")
		{
			request.setAttribute("error", "nullemail");
			request.getRequestDispatcher("signup.jsp").forward(request, response);
		}
		else if (name == "")
		{
			request.setAttribute("error", "nullname");
			request.getRequestDispatcher("signup.jsp").forward(request, response);
		}
		else if (password == "")
		{
			request.setAttribute("error", "nullpassword");
			request.getRequestDispatcher("signup.jsp").forward(request, response);
		}
		else if (confirmationPassword == "")
		{
			request.setAttribute("error", "nullconfirmation");
			request.getRequestDispatcher("signup.jsp").forward(request, response);
		}
		
		// check if password matches confirmation
		else if (!password.equals(confirmationPassword))
		{
			request.setAttribute("error", "passwordMismatch");
			request.getRequestDispatcher("signup.jsp").forward(request, response);
		}
		else
		{
			// check if email is valid with regex. adapted from Baeldung
			Pattern emailPattern = Pattern.compile("(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])");
			Matcher emailMatcher = emailPattern.matcher(email);
			boolean matchFound = emailMatcher.find();
			
			if (!matchFound)
			{
				request.setAttribute("error", "badEmail");
				request.getRequestDispatcher("signup.jsp").forward(request, response);
			}
		}
		
		if (DatabaseStuff.insertUser(email,name, password))
		{
			
			Cookie username = new Cookie ("username", name.replace(" ", "="));
			response.addCookie(username);
			request.getRequestDispatcher("index.jsp").include(request, response);

		}
		else
		{
			request.setAttribute("error", "emailInUse");
			request.getRequestDispatcher("signup.jsp").forward(request, response);
		}
		
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
  
    }


}
