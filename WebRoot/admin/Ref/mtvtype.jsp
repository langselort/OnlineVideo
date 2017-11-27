<%@ page language="java" import="java.util.*,Dal.*" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String name=request.getParameter("type");
	String id= request.getParameter("id");
	String zhuanye= request.getParameter("zhuanye");
	String a= request.getParameter("teacher");
	String param=request.getParameter("param");
	int teacher= Integer.parseInt(a);
	int count=0;
	if(id==null||id.equals("null"))
		count = new MTVTypeServer().Add(name,zhuanye,teacher);
	else if(param==null)
		count=new MTVTypeServer().Edit(name,Integer.parseInt(id),zhuanye,teacher);
	else if(param.equals("del"))
		count=new MTVTypeServer().Del(Integer.parseInt(id));
	if(count==0)
		out.print("<script>alert('操作失败');location.replace('../addmtvtype.jsp');</script>");
	else
		out.print("<script>alert('操作成功');location.replace('../mtvtype.jsp');</script>");
%>
