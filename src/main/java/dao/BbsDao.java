package dao;

import db.DBClose;
import db.DBConnection;
import dto.BbsDto;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BbsDao {

    private static final BbsDao dao = new BbsDao();

    private BbsDao() {
    }

    public static BbsDao getInstance() {
        return dao;
    }

    public List<BbsDto> getBbsList() {
        String sql = "select seq, id, ref, step, depth, "
                + " title, content, wdate, del, readcount "
                + " from bbs "
                + " order by ref desc, step asc ";

        Connection conn = null;
        System.out.println("BbsDao.getBbsList 1/4 success");

        PreparedStatement pstmt = null;
        System.out.println("BbsDao.getBbsList 2/4 success");

        ResultSet rs = null;
        System.out.println("BbsDao.getBbsList 3/4 success");

        List<BbsDto> list = new ArrayList<>();

        try {
            conn = DBConnection.getConnection();

            pstmt = conn.prepareStatement(sql);

            rs = pstmt.executeQuery();

            while (rs.next()) {

//                int seq = rs.getInt("seq");
//                String id = rs.getString("id");
//
//                int ref = rs.getInt("ref");
//                int step = rs.getInt("step");
//                int depth = rs.getInt("depth");
//
//                String title = rs.getString("title");
//                String content = rs.getString("content");
//                String wdate = rs.getString("wdate");
//
//                int del = rs.getInt("del");
//                int readcount = rs.getInt("readcount");
//
//                BbsDto dto = new BbsDto(seq, id, ref, step, depth, title, content, wdate, del, readcount);

                int i = 1;
                BbsDto dto = new BbsDto(
                        rs.getInt(i++),       //seq
                        rs.getString(i++),    //id
                        rs.getInt(i++),       //ref
                        rs.getInt(i++),       //step
                        rs.getInt(i++),       //depth
                        rs.getString(i++),    //title
                        rs.getString(i++),    //content
                        rs.getString(i++),    //wdate
                        rs.getInt(i++),       //del
                        rs.getInt(i));         //readcount
                list.add(dto);
            }
            System.out.println("BbsDao.getBbsList 4/4 success");


        } catch (SQLException e) {
            System.out.println("BbsDao.getBbsList fail");
            throw new RuntimeException(e);
        } finally {
            DBClose.close(conn, pstmt, rs);
        }
        return list;
    }

    public List<BbsDto> getBbsSearchList(String choice, String search) {
        String sql = "select seq, id, ref, step, depth, "
                + " title, content, wdate, del, readcount "
                + " from bbs ";
        //검색
        if (choice.equals("title")) {
            sql += " where title like '%" + search + "%' ";
        } else if (choice.equals("content")) {
            sql += " where content like '%" + search + "%' ";
        } else if (choice.equals("writer")) {
            sql += " where writer id = '" + search + "' ";
        }
        sql += " order by ref desc, step asc ";

        Connection conn = null;
        System.out.println("BbsDao.getBbsList 1/4 success");

        PreparedStatement pstmt = null;
        System.out.println("BbsDao.getBbsList 2/4 success");

        ResultSet rs = null;
        System.out.println("BbsDao.getBbsList 3/4 success");

        List<BbsDto> list = new ArrayList<>();

        try {
            conn = DBConnection.getConnection();

            pstmt = conn.prepareStatement(sql);

            rs = pstmt.executeQuery();

            while (rs.next()) {

//                int seq = rs.getInt("seq");
//                String id = rs.getString("id");
//
//                int ref = rs.getInt("ref");
//                int step = rs.getInt("step");
//                int depth = rs.getInt("depth");
//
//                String title = rs.getString("title");
//                String content = rs.getString("content");
//                String wdate = rs.getString("wdate");
//
//                int del = rs.getInt("del");
//                int readcount = rs.getInt("readcount");
//
//                BbsDto dto = new BbsDto(seq, id, ref, step, depth, title, content, wdate, del, readcount);

                int i = 1;
                BbsDto dto = new BbsDto(
                        rs.getInt(i++),       //seq
                        rs.getString(i++),    //id
                        rs.getInt(i++),       //ref
                        rs.getInt(i++),       //step
                        rs.getInt(i++),       //depth
                        rs.getString(i++),    //title
                        rs.getString(i++),    //content
                        rs.getString(i++),    //wdate
                        rs.getInt(i++),       //del
                        rs.getInt(i));         //readcount
                list.add(dto);
            }
            System.out.println("BbsDao.getBbsList 4/4 success");


        } catch (SQLException e) {
            System.out.println("BbsDao.getBbsList fail");
            throw new RuntimeException(e);
        } finally {
            DBClose.close(conn, pstmt, rs);
        }
        return list;
    }

    public boolean bbsWrite(BbsDto dto) {
        String sql = "insert into bbs(id, ref, step, depth, title, content, wdate, del, readcount) "
                + " values(?, (select ifnull(max(ref), 0) + 1 from bbs b), 0, 0, ?, ?, now(), 0, 0 )";

        Connection conn = null;
        PreparedStatement pstmt = null;

        int count = 0;

        try {
            conn = DBConnection.getConnection();
            System.out.println("bbsWrite 1/3 success");

            pstmt = conn.prepareStatement(sql);
            System.out.println("bbsWrite 2/3 success");

            pstmt.setString(1, dto.getId());
            pstmt.setString(2, dto.getTitle());
            pstmt.setString(3, dto.getContent());

            count = pstmt.executeUpdate();
            System.out.println("bbsWrite 3/3 success");

        } catch (SQLException e) {
            System.out.println("BbsDao.bbsWrite fail");
            throw new RuntimeException(e);
        } finally {
            DBClose.close(conn, pstmt, null);
        }
        return count > 0 ? true : false;
    }

    //글의 총수
    public int getAllBbs(String choice, String search) {
        String sql = "select count(*) from bbs ";
        //검색
        switch (choice) {
            case "title":
                sql += " where title like '%" + search + "%' ";
                break;
            case "content":
                sql += " where content like '%" + search + "%' ";
                break;
            case "writer":
                sql += " where writer id = '" + search + "' ";
                break;
        }

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        int count = 0;

        try {
            conn = DBConnection.getConnection();
            pstmt = conn.prepareStatement(sql);

            rs = pstmt.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            DBClose.close(conn, pstmt, rs);
        }
        return count;
    }

    //글 목록
    public List<BbsDto> getBbsPageList(String choice, String search, int pageNumber) {

        String sql = "select seq, id, ref, step, depth, title, content, wdate, del, readcount from bbs ";

        if (choice.equals("title")) {
            sql += " where title like '%" + search + "%' ";
        } else if (choice.equals("content")) {
            sql += " where content like '%" + search + "%' ";
        } else if (choice.equals("writer")) {
            sql += " where writer id = '" + search + "' ";
        }

        sql += "order by ref desc, step asc ";
        sql += "limit " + (pageNumber * 10) + ", 10 ";

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        List<BbsDto> list = new ArrayList<>();
        try {
            conn = DBConnection.getConnection();
            System.out.println("BbsDao.getBbsPageList 1/4 success");

            pstmt = conn.prepareStatement(sql);
            System.out.println("BbsDao.getBbsPageList 2/4 success");

            rs = pstmt.executeQuery();
            System.out.println("BbsDao.getBbsPageList 3/4 success");
            while (rs.next()) {
                int i = 1;
                BbsDto dto = new BbsDto(
                        rs.getInt(i++),       //seq
                        rs.getString(i++),    //id
                        rs.getInt(i++),       //ref
                        rs.getInt(i++),       //step
                        rs.getInt(i++),       //depth
                        rs.getString(i++),    //title
                        rs.getString(i++),    //content
                        rs.getString(i++),    //wdate
                        rs.getInt(i++),       //del
                        rs.getInt(i));         //readcount
                list.add(dto);
            }
            System.out.println("BbsDao.getBbsPageList 4/4 success");

        } catch (SQLException e) {
            System.out.println("BbsDao.getBbsPageList fail");
            throw new RuntimeException(e);
        } finally {
            DBClose.close(conn, pstmt, rs);
        }
        return list;
    }
}
