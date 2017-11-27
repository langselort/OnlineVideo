<%@ page language="java" import="java.util.*,Dal.*,Mod.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	List<MTVType> typelist=new MTVTypeServer().GetAll();
	request.setAttribute("bm", typelist);
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>视频类型管理</title>
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
			<td>类型名称</td>
			<td>专业</td>
			<td>操作</td>
		</tr>

		
			<tr class="rows">
					<% 
                						if(typelist!=null&&typelist.size()!=0){
                							for(int i=0;i<typelist.size();i++){
                								MTVType typeBean=(MTVType)typelist.get(i);
                					%>
				<td><%=typeBean.getId() %></td>
				<td><%=typeBean.getType() %></td>                					
				<td><%=typeBean.getZhuanYe() %></td>
				<td>
					<a href='addmtvtype.jsp?param=edit&&id=<%=typeBean.getId() %>'>编辑</a>
					<a href='Ref/mtvtype.jsp?param=del&&id=<%=typeBean.getId() %>'>删除</a>
				</td>
			</tr>
				<%
                							}
                						}
                					%>
	</table>
  		
  		
  		
  		</td>
  		<td style="width:6px; background:#02407B; font-size:0px"></td>
  	</tr>
  	</table>
  	
    
  </body>
</html>
