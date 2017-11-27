<%@ page language="java" import="java.util.*,Mod.*,Dal.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
    	<li><a href="addteacher.jsp">添加教师</a></li>
    	<li><a href="teacher.jsp">教师管理</a></li>
    	<li><a href="addzhuanye.jsp">添加专业</a></li>
    	<li><a href="zhuanye.jsp">专业管理</a></li>
    	<li><a href="client.jsp">学生查看</a></li>
    	<li><a href="addmtvtype.jsp">添加课程</a></li>
    	<li><a href="mtvtype.jsp">课程管理</a></li>
    	<li><a href="board.jsp">留言管理</a></li>
    	<li><a href="../index.jsp">网站首页</a></li>
    	<li><a href="Ref/exit.jsp">退出</a></li>
    </ul>
  </body>
</html>
