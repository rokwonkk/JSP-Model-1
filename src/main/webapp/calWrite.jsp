<%@ page import="util.CalendarUtil" %>
<%@ page import="dto.MemberDto" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String year = request.getParameter("year");
    //1자리였을때 앞에 0추가 2024-1-3 -> 2024-01-03
    String month =  CalendarUtil.two(request.getParameter("month"));
    String day = CalendarUtil.two(request.getParameter("day"));

    MemberDto login = (MemberDto) session.getAttribute("login");
%>
<html>
<head>
    <title>Title</title>
</head>
<body>

<h2>일정추가</h2>

<div align="center">

    <form action="colWriteAf.jsp" method="post">
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
<%--                    <input type="date" name="date" id="date" value="<%=year%>-<%=month%>-<%=day%>" style="width: 30%">--%>
                    <input type="date" name="date" id="date" style="width: 30%">
                    <input type="time" name="time" id="time" style="width: 30%">
                </td>
            </tr>
            <tr>
                <th>제목</th>
                <td>
                    <label>
                        <input type="text" name="title" size="80">
                    </label>
                </td>
            </tr>
            <tr>
                <th>내용</th>
                <td>
                    <textarea rows="15" cols="80" name="content"></textarea>
                </td>
            </tr>
        </table>
        <br/>
        <input type="submit" value="일정추가">
    </form>

</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>
    $(document).ready(function () {
        let year = "<%=year%>";
        let month = "<%=month%>";
        let day = "<%=day%>";

        //날짜는 "-" 구분
        $('#date').val(year + "-" + month + '-' + day);

        let d = new Date();
        //시간은 ":" 구분
        $("#time").val(d.getHours() + ":" + d.getMinutes());
    });
</script>

</body>
</html>