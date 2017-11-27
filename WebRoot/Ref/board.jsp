<%@ page language="java" import="java.util.*,Dal.*,Mod.*" pageEncoding="UTF-8"%>
<%@ page import="java.text.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	String title=request.getParameter("title");
	String content=request.getParameter("content");
	if(session.getAttribute("client")==null)
	{
		out.print("<script>alert('请先登陆再进行操作');location.replace('../index.jsp');</script>");
		return;
	}
	Client c=(Client)session.getAttribute("client");
	
	Board b=new Board();
	b.setTitle(title);
	b.setContent(content);
	b.setClient(c);
	
	int count = new BoardServer().Add(b);
	if(count==0)
		out.print("<script>alert('操作失败');location.replace('../board.jsp');</script>");
	else
		out.print("<script>alert('提交成功');location.replace('../board.jsp');</script>");
	
%>
