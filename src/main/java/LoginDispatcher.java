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
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.sql.ResultSet;

/**
 * Servlet implementation class LoginDispatcher
 */

public class LoginDispatcher extends HttpServlet {
    @Serial
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //TODO
    	
    	System.out.println("INITIALIZATION HERE");
    	
		String email = request.getParameter("login-email");
		String password = request.getParameter("login-password");

		if (email == "")
		{
			request.setAttribute("error", "lnullemail");
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		else if (password == "")
		{
			request.setAttribute("error", "lnullpassword");
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		else
		{
			// check if email is valid with regex. adapted from Baeldung
			Pattern emailPattern = Pattern.compile("(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])");
			Matcher emailMatcher = emailPattern.matcher(email);
			boolean matchFound = emailMatcher.find();
			
			if (!matchFound)
			{
				request.setAttribute("error", "lbadEmail");
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}
			else
			{
				try
				{
					if (DatabaseStuff.checkPassword(email, password))
					{
						String name = DatabaseStuff.getUserName(email);
						Cookie username = new Cookie ("username", name.replace(" ", "="));
						response.addCookie(username);
						System.out.println("A");
						response.sendRedirect("index.jsp");
				  
					}
					else
					{
						System.out.println("B");
				    	request.setAttribute("error","usernotfound");
				    	request.getRequestDispatcher("index.jsp").forward(request, response);
					}
				}
				catch (Exception e)
				{
					System.out.println(e.getMessage());
				}
					

			}
		}
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
