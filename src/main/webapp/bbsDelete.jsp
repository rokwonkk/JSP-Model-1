<%@ page import="dao.BbsDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int seq = Integer.parseInt(request.getParameter("seq"));

    BbsDao dao = BbsDao.getInstance();
    boolean b = dao.bbsDelite(seq);
    if(b){
%>
<script>
    alert("글삭제에 성공하였습니다.");
    location.href = "bbsList.jsp";
</script>
<% } else { %>
<script>
    alert("글삭제에 실패하였습니다.");
    location.href = "bbsList.jsp";
</script>
<% } %>