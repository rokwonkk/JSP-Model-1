<%@ page import="dto.MemberDto" %>
<%@ page import="dto.CalendarDto" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="util.CalendarUtil" %>
<%@ page import="dao.CalendarDao" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: rokwon
  Date: 1/19/24
  Time: 10:11 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    MemberDto login = (MemberDto) session.getAttribute("login");
%>
<html>
<head>
    <title>Title</title>
</head>
<body>

<h1>일정관리</h1>
<br/>

<%
    Calendar cal = Calendar.getInstance();
    cal.set(Calendar.DATE, 1);

    String syear = request.getParameter("year");
    String smonth = request.getParameter("month");

    //현재 연도와 월을 구한다 -> 처음 이 페이지가 실행시에 적용
    int year = cal.get(Calendar.YEAR);
    if (CalendarUtil.nvl(syear) == false) { //넘어 온 파라미터 값이 있음.
        year = Integer.parseInt(syear);
    }
    int month = cal.get(Calendar.MONTH) + 1;
    if (CalendarUtil.nvl(smonth) == false) {
        month = Integer.parseInt(smonth);
    }

    if(month < 1){
        month = 12;
        year--;
    }
    if (month > 12) {
        month = 1;
        year++;
    }

    cal.set(year, month-1, 1);

    //요일
    int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);

    // <<   year--
    String pp = String.format("<a href='calendarList.jsp?year=%d&month=%d' style='text-decoration:none'>" +
            "<img src='./images/left.png' width='20px' height='20px'>" +
            "</a>", year-1, month);

    // <    month--
    String p = String.format("<a href='calendarList.jsp?year=%d&month=%d' style='text-decoration:none'>" +
            "<img src='./images/prec.png' width='20px' height='20px'>" +
            "</a>", year, month-1);

    // >    month++
    String n = String.format("<a href='calendarList.jsp?year=%d&month=%d' style='text-decoration:none'>" +
            "<img src='./images/next.png' width='20px' height='20px'>" +
            "</a>", year, month+1);

    // >>   year++
    String nn = String.format("<a href='calendarList.jsp?year=%d&month=%d' style='text-decoration:none'>" +
            "<img src='./images/last.png' width='20px' height='20px'>" +
            "</a>", year+1, month);

    CalendarDao dao = CalendarDao.getInstance();                // 2023 01
    List<CalendarDto> list = dao.getCalendarList(login.getId(), year + CalendarUtil.two(month + ""));
%>

<div align="center">
    <table border="1">
        <col width="120"/>
        <col width="120"/>
        <col width="120"/>
        <col width="120"/>
        <col width="120"/>
        <col width="120"/>
        <col width="120"/>

        <tr height="80">
            <td colspan="7" align="center">
                <%=pp%>&nbsp;<%=p%>&nbsp;&nbsp;&nbsp;&nbsp;

                <font style="color: #3c3c3c; font-size: 40px; font-family: fantasy; vertical-align: middle">
                <%=String.format("%d년&nbsp;%2d월", year, month)%></font>

                &nbsp;&nbsp;&nbsp;&nbsp;<%=n%>&nbsp;<%=nn%>
            </td>
        </tr>
    </table>
</div>

</body>
</html>
