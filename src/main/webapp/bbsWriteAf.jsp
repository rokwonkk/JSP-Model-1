<%@ page import="dao.BbsDao" %>
<%@ page import="dto.BbsDto" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //id, title, content
    String id = request.getParameter("id");
    String title = request.getParameter("title");
    String content = request.getParameter("content");
//    System.out.println(id + " " + title + " " + content);

    //db 접근
    BbsDao dao = BbsDao.getInstance();
    BbsDto dto = new BbsDto(id, title, content);
    boolean b = dao.bbsWrite(dto);

    if (b){
%>
<script>
    alert("글작성에 성공하였습니다.");
    location.href = "bbsList.jsp";
</script>
<% } else { %>
<script>
    alert("글작성에 실패하였습니다.");
    location.href = "bbsWrite.jsp";
</script>
<% } %>