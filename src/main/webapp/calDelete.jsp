<%@ page import="dao.BbsDao" %>
<%@ page import="dao.CalendarDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int seq = Integer.parseInt(request.getParameter("seq"));

    CalendarDao dao = CalendarDao.getInstance();
    boolean b = dao.calDelete(seq);
    if(b){
%>
<script>
    alert("글삭제에 성공하였습니다.");
    location.href = "calendarList.jsp";
</script>
<% } else { %>
<script>
    alert("글삭제에 실패하였습니다.");
    location.href = "calendarList.jsp";
</script>
<% } %>