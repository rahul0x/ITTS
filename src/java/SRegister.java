import java.io.IOException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletResponse;


/**
 *
 * @author Rahul
 */
public class SRegister extends HttpServlet{
    private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String id = request.getParameter("id");
        String contact = request.getParameter("contact");
        String address = request.getParameter("address");
        
        if(name.isEmpty() || id.isEmpty() || contact.isEmpty() || address.isEmpty()) {
            RequestDispatcher req = request.getRequestDispatcher("register.jsp");
            req.include(request, response);
        } else {
            RequestDispatcher req = request.getRequestDispatcher("registerSuccessful.jsp");
            req.forward(request, response);
        }
        
    }
}
