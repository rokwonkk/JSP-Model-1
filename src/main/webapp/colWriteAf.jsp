<%@ page import="dao.CalendarDao" %>
<%@ page import="dto.CalendarDto" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

    String id = request.getParameter("id");
    String title = request.getParameter("title");
    String content = request.getParameter("content");

    String date = request.getParameter("date").replace("-", "");
    String time = request.getParameter("time").replace(":", "");

    String rdate = date + time;

    System.out.println(rdate);

    CalendarDao dao = CalendarDao.getInstance();
    boolean b = dao.addCalendar(new CalendarDto(id, title, content, rdate));

    if (b) {
%>
<script>
    alert("일정이 추가되었습니다");
    location.href = "calendarList.jsp";
</script>
<%
} else {
%>
<script>
    alert("일정이 추가되지 않았습니다");
    location.href = "calendarList.jsp";
</script>
<%
    }
%>
