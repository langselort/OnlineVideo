<%@ page language="java" import="java.util.*,Dal.*,Mod.*" pageEncoding="UTF-8"%>
<%@ page import="java.text.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id= request.getParameter("id");
	
	
	int count=new BoardServer().Del(Integer.parseInt(id));
	if(count==0)
		out.print("<script>alert('操作失败');location.replace('../board.jsp');</script>");
	else
		out.print("<script>alert('操作成功');location.replace('../board.jsp');</script>");
	
%>
