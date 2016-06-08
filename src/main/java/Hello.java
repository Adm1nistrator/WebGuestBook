import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import java.io.IOException;

/**
 * Created by Adm1n on 08.06.2016.
 */

@WebServlet(name = "SimpleServlet", urlPatterns = {"/simple"})
public class Hello extends HttpServlet {

    @Resource(name = "jdbc/testDS")
    private DataSource ds;

    @Override

    protected void doGet(HttpServletRequest req, HttpServletResponse resp)

            throws ServletException, IOException {

        //resp.getOutputStream().println("Hello");
        req.getRequestDispatcher("/WEB-INF/test.jsp").forward(req, resp);


    }

}