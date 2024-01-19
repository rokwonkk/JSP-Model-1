package dao;

import db.DBClose;
import db.DBConnection;
import dto.CalendarDto;
import org.checkerframework.checker.units.qual.A;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CalendarDao {

    private static final CalendarDao dao = new CalendarDao();

    private CalendarDao() {
    }

    public static CalendarDao getInstance() {
        return dao;
    }

    public List<CalendarDto> getCalendarList(String id, String yyyyMM){

        String sql = "select seq,id,title, content, rdate, wdate from "
                + "    ( select row_number() over (partition by substr(rdate, 1 ,8) order by rdate asc) as rnum, "
                + "    seq, id, title, content, rdate, wdate from calendar "
                + "    where id=? and substr(rdate, 1 , 6)=? ) a "
                + "where rnum between 1 and 5 ";

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        List<CalendarDto> list = new ArrayList<>();
        try {
            conn = DBConnection.getConnection();
            System.out.println("CalendarDao.getCalendarList 1");


            pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, id);
            pstmt.setString(2, yyyyMM);
            System.out.println("CalendarDao.getCalendarList 2");

            rs = pstmt.executeQuery();

            while (rs.next()){

                CalendarDto dto = new CalendarDto(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6)
                );
                list.add(dto);
            }

            System.out.println("CalendarDao.getCalendarList 3");

        } catch (SQLException e) {
            System.out.println("CalendarDao.getCalendarList fail");
            throw new RuntimeException(e);
        } finally {
            DBClose.close(conn,pstmt,rs);
        }

        return list;
    }
}
