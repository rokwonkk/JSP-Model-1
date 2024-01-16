<%@ page import="dao.BbsDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

    String title = request.getParameter("title");
    String content = request.getParameter("content");

    System.out.println(title + "  " + content);

    BbsDao dao = BbsDao.getInstance();

%>