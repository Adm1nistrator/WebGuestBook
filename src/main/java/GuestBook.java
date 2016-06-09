import javax.sql.DataSource;
import java.io.IOException;
import java.sql.DriverManager;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

/**
 * Created by Adm1n on 08.06.2016.
 */
public class GuestBook implements GuestBookController {
    private DataSource ds;

    PreparedStatement insert;
    PreparedStatement selectAll;

    public GuestBook(DataSource ds) throws SQLException {
        Connection c = ds.getConnection();
        insert = c.prepareStatement("insert into posts (postdate, message) values(?, ?)");
        selectAll = c.prepareStatement("select * from posts");
    }

    public void addRecord(String message) throws SQLException {
        Timestamp date = new Timestamp(System.currentTimeMillis());
        // SimpleDateFormat simpleDateFormat = new SimpleDateFormat("YYYY.MM.dd hh:mm:ss");
        //  Date date = new Date(System.currentTimeMillis());

        insert.setTimestamp(1, date);
        // insert.setDate(1, date);
        insert.setString(2, message);
        insert.execute();
    }

    public List<Record> getRecords() throws SQLException {
        List<Record> list = new ArrayList<>();
        try (ResultSet rs = selectAll.executeQuery()) {
            while (rs.next()) {
                Record r = new Record(
                        rs.getInt("id"),
                        rs.getString("message"),
                        rs.getTimestamp("postdate")
                );
                list.add(r);
            }
        }
        Collections.reverse(list);
        return list;
    }


    public void close() throws IOException {
        try {
            insert.close();
            selectAll.close();
        } catch (SQLException e) {
            throw new IOException(e);
        }
    }
}
