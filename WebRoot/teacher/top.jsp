<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<%
	if(session.getAttribute("teacher")==null)
	{
		out.print("<script>alert('登陆超时');location.replace('../index.jsp');</script>");
		return;
	}
 %>
    <style>
    	#top{ margin:0px auto; width:1024px; height:96px; background:url(images/top.jpg)}
    	#top b{ display:block; padding-top:30px; padding-left:50px; color:white; font-size:30px}
    </style>

    <div id="top"><b>精品课程网站的设计与实现</b></div>
