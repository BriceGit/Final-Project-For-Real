import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import Util.Constant;
import Util.DatabaseStuff;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.Serial;
import java.util.Scanner;

/**
 * Servlet implementation class SearchDispatcher
 */
@WebServlet("/Search")
public class SearchDispatcher extends HttpServlet {
    @Serial
    private static final long serialVersionUID = 1L;

    public SearchDispatcher() {
    }

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        ServletContext servletContext = getServletContext();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	System.out.println("Searching");
    	String search = request.getParameter("term");
    	request.getRequestDispatcher("item.jsp").forward(request, response);

    	if (search == "")
		{
			request.setAttribute("error", "lnullsearch");
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
    	else
		{
			// check if in database with jdbc

    		String queryString = "select * from items where name=" + Integer.parseInt(search);
    		try(Connection connect = DriverManager.getConnection(Constant.SQLUrl, Constant.SQLuser, Constant.SQLpass);
					Statement st = connect.createStatement();) {
					st.executeUpdate(queryString);
			}
			catch (SQLException e)
			{

			}

		}
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}