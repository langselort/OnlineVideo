<%@ page language="java" import="java.util.*,Mod.*,Dal.*" pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>专业管理</title>
    <style>
		#addtable {border-collapse: collapse; width:100%;border: 1px solid #02407B;border-collapse:collapse;}
		#addtable td {border: 1px solid #02407B; font-size: 12px; height:30px;}
		.left{ background:#319FEA; width:100px;text-align:center }
		.right{ text-align:left }
		.right input{ margin:10px}
	</style>
	<%
		int id=0;
		ZhuanYe b=new ZhuanYe();
		if(request.getParameter("id")!=null)
		{
			id=Integer.parseInt(request.getParameter("id"));
		    b=new ZhuanYeServer().GetByID(id);
		}
	%>
  </head>
  
  <body>
  	<form method="post" action="Ref/zhuanye.jsp?id=<%=request.getParameter("id") %>">
  	<%@ include file="top.jsp"%>
  	<table cellpadding="0" cellspacing="0" style="width:1024px; margin:0px auto; border-bottom:solid 6px #02407B"> 
  	<tr>
  		<td style="width:6px; background:#02407B; font-size:0px"></td>
  		<td style="width:179px; vertical-align:top; background:#319FEA"><%@ include file="left.jsp"%></td>
  		<td style="width:6px; background:#02407B; font-size:0px"></td>
  		<td style="width:827px; vertical-align:top">
  		
  		
  		<table cellpadding="0" cellspacing="0" id="addtable"> 
	  	<tr>
	  		<td class="left">专业名称：</td>
	  		<td class="right"><input type="text" name="type" value="<%=b.getType() %>" /></td>
	  	</tr>
	  	<tr>
	  		<td class="left">&nbsp;</td>
	  		<td class="right"><input type="submit" value="提交"/></td>
	  	</tr>
	  	</table>
  		
  		
  		
  		</td>
  		<td style="width:6px; background:#02407B; font-size:0px"></td>
  	</tr>
  	</table>
	</form>
  </body>
</html>
