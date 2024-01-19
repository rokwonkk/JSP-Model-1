<%@ page import="dao.CalendarDao" %>
<%@ page import="dto.CalendarDto" %>
<%@ page import="dto.MemberDto" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    MemberDto login = (MemberDto) session.getAttribute("login");

    int seq = Integer.parseInt(request.getParameter("seq"));

    CalendarDao dao = CalendarDao.getInstance();
    CalendarDto dto = dao.getCalendar(seq);
%>
<html>
<head>
    <title>Title</title>
</head>
<body>

<h1>글수정</h1>

<div align="center">

    <form action="calDetailUpdateAf.jsp" method="post">

        <input type="hidden" name="seq" value="<%=seq%>">

        <table border="1">
            <col width="200"/><col width="500"/>
            <tr>
                <th>아이디</th>
                <td>
                    <%=login.getId()%>
                    <input type="hidden" name="id" value="<%=login.getId()%>">
                </td>
            </tr>
            <tr>
                <th>일정</th>
                <td>
                    <%=dto.getWdate()%>
                </td>
            </tr>
            <tr>
                <th>제목</th>
                <td>
                    <label>
                        <input type="text" name="title" size="80" value="<%=dto.getTitle()%>">
                    </label>
                </td>
            </tr>
            <tr>
                <th>내용</th>
                <td>
                    <textarea rows="15" cols="80" name="content"><%=dto.getContent()%></textarea>
                </td>
            </tr>
        </table>
        <br/>
        <input type="submit" value="수정완료">
    </form>
</div>

</body>
</html>
