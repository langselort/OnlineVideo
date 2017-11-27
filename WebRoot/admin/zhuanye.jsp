<%@ page language="java" import="java.util.*,Dal.*,Mod.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	List<ZhuanYe> bm=new ZhuanYeServer().GetAll();
	request.setAttribute("bm", bm);
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>专业类型管理</title>
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
			<td>编号</td>
			<td>专业名称</td>
			<td>操作</td>
		</tr>
		<c:forEach items="${ bm }" var="b">
		
			<tr class="rows">
				<td>${ b.id }</td>
				<td>${ b.type }</td>
				<td>
					<a href='addzhuanye.jsp?param=edit&&id=${ b.id }'>编辑</a>
					<a href='Ref/zhuanye.jsp?param=del&&id=${ b.id }'>删除</a>
				</td>
			</tr>
		</c:forEach>
	</table>
  		
  		
  		
  		</td>
  		<td style="width:6px; background:#02407B; font-size:0px"></td>
  	</tr>
  	</table>
  	
    
  </body>
</html>
