<%@ page import="dao.CalendarDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int seq = Integer.parseInt(request.getParameter("seq"));

    String title = request.getParameter("title");
    String content = request.getParameter("content");

    System.out.println(seq);
    System.out.println(title + "  " + content);

    CalendarDao dao = CalendarDao.getInstance();
    boolean b = dao.calDetailUpdate(seq, title, content);

    if(b){
%>
<script>
    alert("글수정에 성공하였습니다.");
    location.href = "calendarList.jsp";
</script>
<% } else { %>
<script>
    alert("글수정에 실패하였습니다.");
    location.href = "calendarDetail.jsp?seq=" + <%=seq%>;
</script>
<% } %>