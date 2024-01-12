<%@ page import="dao.MemberDao" %>
<%@ page import="dto.MemberDto" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<% request.setCharacterEncoding("utf-8"); %>

<%
    //id, pw 취득
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");
    System.out.println(id + " " + pw);

    //db 접근
    MemberDao dao = MemberDao.getInstance();
    MemberDto dto = dao.login(id, pw);

    //메세지
    if (dto != null) {
        //세션저장
        session.setAttribute("login", dto);
        //세션기한설정
        session.setMaxInactiveInterval(24 * 60 * 60);
%>
<script>
alert("<%=dto.getId()%>님 환영합니다");
</script>
<%
} else {
%>
<script>
    alert("id나 password를 확인해 주십시오.");
    location.href = "login.jsp";
</script>
<%
    }
%>