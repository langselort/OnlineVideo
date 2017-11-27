<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	if(session.getAttribute("teacher")!=null)
		session.removeAttribute("teacher");
	if(session.getAttribute("admin")!=null)
		session.removeAttribute("admin");
	if(session.getAttribute("client")!=null)
		session.removeAttribute("client");
		
	out.print("<script>location.replace('../../index.jsp');</script>");
%>