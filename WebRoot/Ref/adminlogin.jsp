<%@ page language="java" import="Dal.*,Mod.*" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String loginname=request.getParameter("name");
	String author=request.getParameter("author");
	String PWD= request.getParameter("pwd");
	if(author.equals("管理员"))
	{
		Admin a=new AdminServer().Login(loginname);
		
		if(a==null)
				out.print("<script>alert('没有该用户');location.replace('../index.jsp');</script>");
		else if(!a.getPass().equals(PWD))
			out.print("<script>alert('您输入的密码有误');location.replace('../index.jsp');</script>");
		else
		{
			session.setAttribute("admin",a);
			out.print("<script>location.replace('../admin/teacher.jsp');</script>");
		}
	}
	else if(author.equals("学生")){
	
	Client a=new ClientServer().Login(loginname);
		
		if(a==null)
				out.print("<script>alert('没有该用户');location.replace('../index.jsp');</script>");
		else if(!a.getPass().equals(PWD))
			out.print("<script>alert('您输入的密码有误');location.replace('../index.jsp');</script>");
		else
		{
			session.setAttribute("client",a);
			out.print("<script>location.replace('../student/ass.jsp');</script>");
		}
	}
	else
	{
		Teacher a=new TeacherServer().Login(loginname);
		
		if(a==null)
				out.print("<script>alert('没有该用户');location.replace('../index.jsp');</script>");
		else if(!a.getPass().equals(PWD))
			out.print("<script>alert('您输入的密码有误');location.replace('../index.jsp');</script>");
		else
		{
			session.setAttribute("teacher",a);
			out.print("<script>location.replace('../teacher/down.jsp');</script>");
		}
	}
%>
