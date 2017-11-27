<%@ page language="java" import="java.util.*,Dal.*,Mod.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>发布作业</title>
<style>
		#addtable {border-collapse: collapse; width:100%;border: 1px solid #02407B;border-collapse:collapse;}
		#addtable td {border: 1px solid #02407B; font-size: 12px; height:30px;}
		.left{ background:#319FEA; width:100px;text-align:center }
		.right{ text-align:left }
		.right input,.right select,.right textarea{ margin:10px}
	</style>
	<script>
    	function sub()
    	{
    		if(document.myform.file1.value.length<1)
    		{
    			alert("请选择您要提交的作业");
    			return false;
    		}
    	}
    </script>
    <%
    	int id=0;
    	Ass d=new Ass();
    	if(request.getParameter("id")!=null)
    	{
    		id=Integer.parseInt(request.getParameter("id"));
    		d=new AssServer().GetByID(id);
    	}
     %>
  </head>
  
  <body>
  	<%@ include file="top.jsp"%>
  	<table cellpadding="0" cellspacing="0" style="width:1024px; margin:0px auto; border-bottom:solid 6px #02407B"> 
  	<tr>
  		<td style="width:6px; background:#02407B; font-size:0px"></td>
  		<td style="width:179px; vertical-align:top; background:#319FEA"><%@ include file="left.jsp"%></td>
  		<td style="width:6px; background:#02407B; font-size:0px"></td>
  		<td style="width:827px; vertical-align:top">
  		
  		
  		<form method="post" name="myform" action="Ref/answer.jsp?id=<%=id %>" onsubmit="return sub()" enctype="multipart/form-data">
						<table cellpadding="0" cellspacing="0" id="addtable">
							<tr>
						  		<td class="left">作业主题：</td>
						  		<td class="right"><%=d.getTitle() %></td>
						  	</tr>
						  	<tr>
						  		<td class="left">作业附件：</td>
						  		<td class="right"><input type="file" name="file1"  /></td>
						  	</tr>
						  	<tr>
						  		<td class="left">&nbsp;</td>
						  		<td class="right"><input type="submit" value="提交"/></td>
						  	</tr>
					  	</table>
						</form>
  		
  		
  		
  		</td>
  		<td style="width:6px; background:#02407B; font-size:0px"></td>
  	</tr>
  	</table>
  </body>
</html>
