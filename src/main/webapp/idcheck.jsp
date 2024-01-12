<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String id = request.getParameter("id");
	System.out.println("id:" + id);

	MemberDao dao = MemberDao.getInstance();
	int count = dao.idcheck(id);
	if(count == 1){
		out.println("NO");
	}else{	// count = 0
		out.println("YES");
	}
%>