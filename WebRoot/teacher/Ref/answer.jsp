<%@ page language="java" import="java.util.*,Dal.*,Mod.*" pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	
	
	String aid=request.getParameter("aid");
	String score=request.getParameter("score");
	int count=new AnswerServer().EditScore(Integer.parseInt(aid),Double.valueOf(score));
	if(count==0)
		out.print("<script>alert('操作失败');location.replace('../answer.jsp?id="+aid+"');</script>");
	else
		out.print("<script>alert('操作成功');location.replace('../answer.jsp?id="+aid+"');</script>");
%>
