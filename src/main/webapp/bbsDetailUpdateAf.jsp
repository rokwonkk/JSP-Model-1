<%@ page import="dao.BbsDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int seq = Integer.parseInt(request.getParameter("seq"));

    String title = request.getParameter("title");
    String content = request.getParameter("content");

    System.out.println(seq);
    System.out.println(title + "  " + content);

    BbsDao dao = BbsDao.getInstance();
    boolean b = dao.bbsDetailUpdate(seq, title, content);

    if(b){
%>
<script>
    alert("글수정에 성공하였습니다.");
    location.href = "bbsList.jsp";
</script>
<% } else { %>
<script>
    alert("글수정에 실패하였습니다.");
    location.href = "bbsListDetail.jsp?seq=" + <%=seq%>;
</script>
<% } %>