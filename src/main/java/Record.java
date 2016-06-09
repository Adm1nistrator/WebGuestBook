import java.sql.Timestamp;

/**
 * Created by anykey on 08.06.16.
 */
public class Record {
    private long id;
    private String msg;
    private Timestamp postTime;

    public Record(int id, String msg, Timestamp postTime) {
        this.id = id;
        this.msg = msg;
        this.postTime = postTime;
    }

    public long getId() {
        return id;
    }

    public String getMsg() {
        return msg;
    }

    public Timestamp getPostTime() {
        return postTime;
    }

    public void setId(long id) {
        this.id = id;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public void setTimestamp(Timestamp postTime) {
        this.postTime = postTime;
    }

    @Override
    public String toString() {

        String out = "";
            out = "№ "+ getId() + " " + getMsg() + " Добавленно:  " + getPostTime();

        return out;
    }
}
