<%@ page language="java" import="java.util.*,Mod.*,Dal.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% int teacher=0;
	if(request.getParameter("teacher")!=null)
	teacher=Integer.parseInt(request.getParameter("teacher"));	

%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>菜单</title>
    <style>
    #leftmenu{ width:179px; height:27px; background:url(images/menutop.jpg);}
    #leftmenu b{ font-size:13px; color:white; display:block; padding-top:5px; padding-left:35px}
    #menuul{list-style:none; margin:0px; padding:0px}
    #menuul li{ width:179px; height:29px; background:url(images/menubg.jpg)}
    #menuul a,#menuul a:visited{ color:white; text-decoration:none; font-size:13px; font-weight:bold; display:block; padding-left:30px; padding-top:7px}
    </style>
  </head>
  
  <body>
    <div id="leftmenu"><b>功能菜单</b></div>
    <ul id="menuul">
    	<li><a href="mtv.jsp?type=<%= teacher-2 %>&&teacher=<%= teacher %>">课程介绍</a></li>
    	<li><a href="teachershow.jsp?type=<%= teacher-2 %>&&teacher=<%= teacher %>">教师介绍</a></li>
    	<li><a href="mtv.jsp?type=<%= teacher-2 %>&&teacher=<%= teacher %>">课件</a></li>
    	<li><a href="mtvshow.jsp?type=<%= teacher-2 %>&&teacher=<%= teacher %>">视频</a></li>
    	<li><a href="../index.jsp">网站首页</a></li>
    </ul>
  </body>
</html>
