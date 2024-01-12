<%@page import="dto.MemberDto" %>
<%@page import="dao.MemberDao" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<% request.setCharacterEncoding("utf-8"); %>

<%
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");
    String name = request.getParameter("name");
    String email = request.getParameter("email");

    System.out.println(id + " " + pw + " " + name + " " + email);

    MemberDao dao = MemberDao.getInstance();
    boolean isS = dao.addMember(new MemberDto(id, pw, name, email, 0));

    if (isS) {
%>
<script>
    alert("성공적으로 가입되었습니다");
    location.href = "login.jsp";
</script>
<%
} else {
%>
<script>
    alert("다시 가입해 주십시오");
    location.href = "regi.jsp";
</script>
<%
    }
%>