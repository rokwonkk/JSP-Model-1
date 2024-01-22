<%@ page import="util.CalendarUtil" %>
<%@ page import="dto.MemberDto" %>
<%@ page import="dao.CalendarDao" %>
<%@ page import="dto.CalendarDto" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String year = request.getParameter("year");
    String month = request.getParameter("month");
    String day = request.getParameter("day");

    //20240117
    String yyyymmdd = year + CalendarUtil.two(month + "") + CalendarUtil.two(day + "");

    String id = ((MemberDto) session.getAttribute("login")).getId();

    CalendarDao dao = CalendarDao.getInstance();
    List<CalendarDto> list = dao.calDayList(id, yyyymmdd);
%>
<html>
<head>
    <title>Title</title>
    <style>
        .center {
            margin: auto;
            width: 1000px;
            text-align: center;
        }

        th {
            background-color: lightblue;
            color: white;
        }

        tr {
            line-height: 12px;
        }
    </style>
</head>
<body>

<h2>일별일정</h2>

<br/>

<h3><%=year%>년<%=month%>월<%=day%>일의 일정</h3>

<div class="center"></div>

<table border="1">
    <col width="100"/>
    <col width="450"/>
    <col width="300"/>
    <thead>
    <tr>
        <th>제목</th>
        <th>번호</th>
        <th>시간</th>
    </tr>
    </thead>
    <tbody>
    <%
        for (int i = 0; i < list.size(); i++) {

            CalendarDto dto = list.get(i);
    %>
    <tr>
        <th><%=(i + 1)%>
        </th>
        <td align="left">
            <a href="calDetail.jsp?seq=<%=dto.getSeq()%>"><%=dto.getTitle()%></a>
        </td>
        <td>
            <%=CalendarUtil.toDates(dto.getRdate())%>
        </td>
    </tr>
    <%
        }
    %>
    </tbody>
</table>
</body>
</html>
