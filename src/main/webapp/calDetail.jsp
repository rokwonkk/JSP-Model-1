<%@ page import="dto.MemberDto" %>
<%@ page import="dao.CalendarDao" %>
<%@ page import="dto.CalendarDto" %>
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
<h2>일정상세정보</h2>

<div align="center">
    <table border="1">
        <col width="200"/>
        <col width="500"/>
        <tr>
            <th>아이디</th>
            <td aria-readonly="true">
                <%=login.getId()%>
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
                    <%=dto.getTitle()%>
                </label>
            </td>
        </tr>
        <tr>
            <th>내용</th>
            <td>
                <textarea rows="15" cols="80" name="content" readonly><%=dto.getContent()%></textarea>
            </td>
        </tr>
    </table>
    <br/>
    <%
        if (login.getId().equals(dto.getId())) {
    %>
    <button type="button" onclick="updateCalendar(<%=dto.getSeq()%>)" class="btn btn-primary">일정수정</button>
    <button type="button" onclick="deleteCalendar(<%=dto.getSeq()%>)" class="btn btn-primary">일정삭제</button>
    <%
        }
    %>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>
    function updateCalendar(seq){
        location.href = "calDetailUpdate.jsp?seq=" + seq;
    }

    function deleteCalendar(seq){
        let Yn = confirm("정말 일정을 삭제하시겠습니까?");
        if(!Yn){
            alert("삭제를 취소합니다");
            return;
        }
        location.href = "calDelete.jsp?seq=" + seq;
    }
</script>
</body>
</html>
