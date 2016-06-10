import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

/**
 * Created by Adm1n on 08.06.2016.
 */

@WebServlet(name = "SimpleServlet", urlPatterns = {"/guestbook"})
public class GuestBookServlet extends HttpServlet {
    GuestBook guestBook;


    @Resource(name = "jdbc/GuestBook")
    private DataSource ds;

    @PostConstruct
    public void init() {
        try {
            guestBook = new GuestBook(ds);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            List<Record> list = guestBook.getRecords();

            if (list == null) {
                return;
            }
            req.setCharacterEncoding("UTF-8");
            req.setAttribute("ListRecords", list);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        req.getRequestDispatcher("WEB-INF/guestbook.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String message;
        req.setCharacterEncoding("UTF-8");
        message = req.getParameter("textfield");
        try {
            guestBook.addRecord(message);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        doGet(req, resp);
    }

}