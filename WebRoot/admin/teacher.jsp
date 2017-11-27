<%@ page language="java" import="java.util.*,Dal.*,Mod.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	int startindex=0;
 	if(request.getParameter("startindex")!=null)
 		startindex =  Integer.parseInt(request.getParameter("startindex"));
	int pagesize=20;
	int rcount=new TeacherServer().GetCount();
	
    List<Teacher> ts=new TeacherServer().GetAll(startindex,pagesize);
	request.setAttribute("ts", ts);
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>教师管理</title>
    <style>
    a,a:visited{ color:lightslategray; text-decoration:none}
	#sqltable {border-collapse: collapse; width:100%;border: 1px solid #02407B;border-collapse:collapse;}
	#sqltable td {border: 1px solid #02407B; font-size: 12px; padding: 2px; height:30px; text-align:center}
	.title td {text-align: center; background: #319FEA; height:30px; border:solid 1px lightslategray; border-collapse:collapse; }
	.rows:hover{ background:#EAF4FD}
</style>
  </head>
  
  <body>
  	<%@ include file="top.jsp"%>
  	<table cellpadding="0" cellspacing="0" style="width:1024px; margin:0px auto; border-bottom:solid 6px #02407B"> 
  	<tr>
  		<td style="width:6px; background:#02407B; font-size:0px"></td>
  		<td style="width:179px; vertical-align:top; background:#319FEA"><%@ include file="left.jsp"%></td>
  		<td style="width:6px; background:#02407B; font-size:0px"></td>
  		<td style="width:827px; vertical-align:top">
  		
  		
  		<table id="sqltable">
		<tr class="title">
			<td>教师号</td>
			<td>姓名</td>
			<td>年龄</td>
			<td>学历</td>
			<td>专业</td>
			<td>电话</td>
			<td>操作</td>
		</tr>
		<c:forEach items="${ ts }" var="t">
		
			<tr class="rows">
				<td>${ t.login }</td>
				<td>${ t.name }</td>
				<td>${ t.age }</td>
				<td>${ t.xueli }</td>
				<td>${ t.zhuanye.type }</td>
				<td>${ t.tel }</td>
				<td>
					<a href='addteacher.jsp?id=${ t.id }'>编辑</a>
					<a href='Ref/teacher.jsp?param=del&&id=${ t.id }'>删除</a>
				</td>
			</tr>
		</c:forEach>
	</table>
		<div style="width:626px; margin-left:24px; background:white; text-align:center" id="pagediv">
		<style>
		#pagediv a,#pagediv a:visited{ color:#A51010; margin:5px; font-size:12px}
		</style>
  		<%
			int sumcount=0;
			String pagename="teacher.jsp";
			if(rcount%pagesize==0)
				sumcount=rcount/pagesize;
			else
				sumcount=rcount/pagesize+1;
			if(startindex==0)//判断是否是第一页
				out.print("<a style=''>首页</a><a style=''>上一页</a>");
			else
				out.print("<a style='' href='"+pagename+"?startindex=0'>首页</a><a style='' href='"+pagename+"?startindex="+Integer.toString(startindex-1)+"'>上一页</a>");
			if(sumcount-1==startindex)//判断是否是最后一页
				out.print("<a style=''>下一页</a><a style=''>尾页</a>");
			else
				out.print("<a style='' href='"+pagename+"?startindex="+Integer.toString(startindex+1)+"'>下一页</a><a style='' href='"+pagename+"?startindex="+Integer.toString(sumcount-1)+"'>尾页</a>");
		 %>
  		</div>
  		
  		</td>
  		<td style="width:6px; background:#02407B; font-size:0px"></td>
  	</tr>
  	</table>
  	
    
  </body>
</html>
