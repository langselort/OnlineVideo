<%@ page language="java" import="java.util.*,Dal.*,Mod.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>编辑</title>
<style>
		#addtable {border-collapse: collapse; width:100%;border: 1px solid #02407B;border-collapse:collapse;}
		#addtable td {border: 1px solid #02407B; font-size: 12px; height:30px;}
		.left{ background:#319FEA; width:100px;text-align:center }
		.right{ text-align:left }
		.right input,.right select,.right textarea{ margin:10px}
	</style>
	<%
		int id=0;
		MTV b=new MTV();
		if(request.getParameter("id")!=null)
		{
			id=Integer.parseInt(request.getParameter("id"));
		    b=new MTVServer().GetByID(id);
		}
	%>
<script type="text/javascript">
    	function sub()
    	{
    		if(document.myForm.title.value=="")
    		{
    			alert("请输入标题");
    			return false;
    		}
    		if(document.myForm.content.value=="")
    		{
    			alert("请输入字慕");
    			return false;
    		}
    		if(document.myForm.file1.value.length==0&&QueryString("id")=="")
    		{
    			alert("请上传您要上传的视频");
    			return false;
    		}
    		if(document.myForm.file1.value.length>0)
    		{
    			var filename=document.myForm.file1.value;
    			var Ext=filename.substr(filename.lastIndexOf(".")).toLowerCase();//获得文件后缀名
    			if(Ext!=".flv")
    			{
    				alert("视频格式只能为flv格式");
    				return false;
    			}
    		}
    	}
    	function QueryString(name) {
		    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
		    var r = window.location.search.substr(1).match(reg);
		    if (r != null)
		        return unescape(r[2]);
		    return "";
		}
    </script>
  </head>
  
  <body>
  	<form action='Ref/mtv.jsp?id=<%=id %>' enctype="multipart/form-data" method='post' name='myForm' onsubmit="return sub()">
  	<%@ include file="top.jsp"%>
  	<table cellpadding="0" cellspacing="0" style="width:1024px; margin:0px auto; border-bottom:solid 6px #02407B"> 
  	<tr>
  		<td style="width:6px; background:#02407B; font-size:0px"></td>
  		<td style="width:179px; vertical-align:top; background:#319FEA"><%@ include file="left.jsp"%></td>
  		<td style="width:6px; background:#02407B; font-size:0px"></td>
  		<td style="width:827px; vertical-align:top">
  		
  		
  		<table cellpadding="0" cellspacing="0" id="addtable"> 
	  	<tr>
	  		<td class="left">标题：</td>
	  		<td class="right"><input type="text" name="title" value="<%=b.getTitle() %>" /></td>
	  	</tr>
	  	<tr>
	  		<td class="left">类型：</td>
	  		<td class="right">
				<%
					List<MTVType> bm=new MTVTypeServer().GetAll();
					request.setAttribute("bm", bm);
				 %>
				 <select name="mtvtype">
					<c:forEach items="${ bm }" var="b">
					<option value="${b.id}">
					${b.type}
					</option>
					</c:forEach>
				</select>
			</td>
	  	</tr>
	  	<tr>
	  		<td class="left">视频文件：</td>
	  		<td class="right"><input type="file" name="file1"/></td>
	  	</tr>
	  	<tr>
	  		<td class="left">字慕：</td>
	  		<td class="right"><textarea name="content" style="width:98%; height:300px"><%=b.getContent() %></textarea></td>
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
