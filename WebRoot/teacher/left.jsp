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
    	<li><a href="adddown.jsp">发布课件</a></li>
    	<li><a href="down.jsp">课件管理</a></li>
    	<li><a href="board.jsp">讨论管理</a></li>
    	<li><a href="addmtv.jsp">上传学习视频</a></li>
    	<li><a href="mtv.jsp">学习视频管理</a></li>
    	<li><a href="addass.jsp">发布作业</a></li>
    	<li><a href="ass.jsp">作业管理</a></li>
    	<li><a href="../index.jsp">网站首页</a></li>
    	<li><a href="Ref/exit.jsp">退出</a></li>
    </ul>
  </body>
</html>
