<%@ page language="java" import="java.util.*,Mod.*,Dal.*" pageEncoding="UTF-8"%>
<%@ page import="java.text.*"%>

<%
	request.setCharacterEncoding("UTF-8");
	String param=request.getParameter("param");
	if(param.equals("reg"))
	{
		String name=request.getParameter("name");
		String sex=request.getParameter("sex");
		String age=request.getParameter("age");
		String tel=request.getParameter("tel");
		String address=request.getParameter("address");
		String mail=request.getParameter("mail");
		String xueli=request.getParameter("xueli");
		String login=request.getParameter("login");
		String pass=request.getParameter("pwd1");
		//out.print(String.format("姓名：%s,性别:%s,年龄：%s,电话:%s,地址:%s,邮箱:%s,专业：%s,学历：%s,登陆名:%s,密码：%s",name,sex,age,tel,address,mail,zhuanye,xueli,login,pass));
		//return;
		if(new ClientServer().Login(login)!=null)
		{
			out.print("<script>alert('该用户名已存在');location.replace('../reg.jsp');</script>");
			return;
		}
		Client vip=new Client();
		vip.setName(name);
		vip.setSex(sex);
		vip.setAge(Integer.parseInt(age));
		vip.setTel(tel);
		vip.setAddress(address);
		vip.setMail(mail);
		vip.setXueLi(xueli);
		vip.setLogin(login);
		vip.setPass(pass);
		int count=new ClientServer().Add(vip);
		if(count==0)
			out.print("<script>alert('操作失败');location.replace('../reg.jsp');</script>");
		else
			out.print("<script>alert('注册成功');location.replace('../index.jsp');</script>");
		
	}
	else if(param.equals("login"))
	{
		String login=request.getParameter("login");
		String pass=request.getParameter("pass");
		Client v=new ClientServer().Login(login);
		if(v==null)
		{
			out.print("<script>alert('该用户名不存在');location.replace('../index.jsp');</script>");
			return;
		}
		if(!v.getPass().equals(pass))
		{
			out.print("<script>alert('密码错误');location.replace('../index.jsp');</script>");
			return;
		}
		session.setAttribute("client",v);
		out.print("<script>location.replace('../index.jsp');</script>");
		return;
	}
	else if(param.equals("edit"))
	{
		Client v=(Client)session.getAttribute("client");
		String name=request.getParameter("name");
		String sex=request.getParameter("sex");
		String age=request.getParameter("age");
		String tel=request.getParameter("tel");
		String address=request.getParameter("address");
		String mail=request.getParameter("mail");
		String xueli=request.getParameter("xueli");
		//out.print(String.format("姓名：%s,登陆名:%s,密码：%s,性别:%s,年龄:%s,爱好:%s,说说：%s,身高：%s,已婚状态:%s,学历：%s",name,login,pass,sex,age,hobby,shuoshuo,height,hun,xueli));
		//return;
		v.setName(name);
		v.setSex(sex);
		v.setAge(Integer.parseInt(age));
		v.setTel(tel);
		v.setAddress(address);
		v.setMail(mail);
		v.setXueLi(xueli);
		v.setId(v.getId());
		int count=new ClientServer().Edit(v);
		if(count==0)
			out.print("<script>alert('修改失败');location.replace('../edit.jsp');</script>");
		else
		{
			session.removeAttribute("client");
			session.setAttribute("client",v);
			out.print("<script>alert('修改成功');location.replace('../edit.jsp');</script>");
		}
	}
	else if(param.equals("pwd"))
	{
		Client v=(Client)session.getAttribute("client");
		String pass=request.getParameter("pwd1");
		int count=new ClientServer().EditPass(v.getId(),pass);
		if(count==0)
			out.print("<script>alert('修改失败');location.replace('../editpass.jsp');</script>");
		else
			out.print("<script>alert('修改成功');location.replace('../editpass.jsp');</script>");
	}
	else if(param.equals("exit"))
	{
		if(session.getAttribute("client")!=null)
			session.removeAttribute("client");
	out.print("<script>location.replace('../index.jsp');</script>");
	}
%>