<%@ page import="dao.BbsDao" %>
<%@ page import="dto.BbsDto" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<% request.setCharacterEncoding("utf-8");%>

<%
    int seq = Integer.parseInt(request.getParameter("seq"));

    String id = request.getParameter("id");
    String title = request.getParameter("title");
    String content = request.getParameter("content");

    BbsDao dao = BbsDao.getInstance();

    dao.answerUpdate(seq);

    boolean b = dao.answerInsert(seq, new BbsDto(id, title, content));
    if (b) {
%>
<script>
    alert("답글입력 성공~!");
    location.href = "bbsList.jsp";
</script>
<%
} else {
%>
<script>
    alert("답글입력 성공~!");
    location.href = "answer.jsp?seq=" + <%=seq%>;
</script>
<%
    }
%>