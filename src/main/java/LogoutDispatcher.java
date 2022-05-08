import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.Serial;

/**
 * Servlet implementation class LogoutDispatcher
 */
@WebServlet("/Logout")
public class LogoutDispatcher extends HttpServlet {
    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        // TODO Remove userID cookie
    	
    	response.setContentType("text/html");
    	
    	Cookie[] cs = request.getCookies();
    	
    	if(cs != null)
    	{
    		for (Cookie c: cs)
    		{
    			c.setMaxAge(0);
    			response.addCookie(c);
    		}
    	}
    	

		response.sendRedirect("index.jsp");
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        doGet(request, response);
    }

}
