<%@ page language="java" import="java.util.*,Dal.*" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String name=request.getParameter("type");
	String id= request.getParameter("id");
	String param=request.getParameter("param");
	int count=0;
	if(id==null||id.equals("null"))
		count = new ZhuanYeServer().Add(name);
	else if(param==null)
		count=new ZhuanYeServer().Edit(name,Integer.parseInt(id));
	else if(param.equals("del"))
		count=new ZhuanYeServer().Del(Integer.parseInt(id));
	if(count==0)
		out.print("<script>alert('操作失败');location.replace('../addzhuanye.jsp');</script>");
	else
		out.print("<script>alert('操作成功');location.replace('../zhuanye.jsp');</script>");
%>
