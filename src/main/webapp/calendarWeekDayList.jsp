<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    final int WEEKDAY = 6;
    final int DAYTIME = 24;
%>
<html>
<head>
    <title>Title</title>
</head>
<style>
    body {
        padding: 40px;
    }

    td {
        padding: 5px;
    }
</style>
<body>

<h1>주/일 일정관리</h1>
<br/>
<form action="WeekDayWrite.jsp" method="post">
    <br/>
    <div align="center">
        <button type="button" id="add">일정 추가하기</button>
        <br/><br/>
        <table border="1">
            <col width="120"/>
            <col width="120"/>
            <col width="120"/>
            <col width="120"/>
            <col width="120"/>
            <col width="120"/>
            <col width="120"/>
            <col width="120"/>
            <tr height="30" style="background-color: lightblue; color: white;">
                <th class="text-center">time</th>
                <th class="text-center">일</th>
                <th class="text-center">월</th>
                <th class="text-center">화</th>
                <th class="text-center">수</th>
                <th class="text-center">목</th>
                <th class="text-center">금</th>
                <th class="text-center">토</th>
            </tr>
            <%
                for (int i = 0; i <= DAYTIME; i++) {
            %>
            <tr>
                <th><%=i%>
                </th>
                <%
                    for (int j = 0; j <= WEEKDAY; j++) {
                %>
                                <td><button  id="<%=i%>_<%=j%>" type="button" style="width: 120px">일정추가</button> </td>
<%--                                <td id="<%=i%>_<%=j%>"><%=i%>_<%=j%></td>--%>
<%--                <td id="<%=i%>_<%=j%>"></td>--%>
                <%
                    }
                %>
            </tr>
            <%
                }
            %>
        </table>
    </div>
</form>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>
    $(document).ready(function () {
        $('#add').click(function () {

            alert("ok?");

        });
    });
</script>

</body>
</html>
