<%@ page language="java" import="java.util.*,Dal.*,Mod.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>添加教师</title>
<style>
		#addtable {border-collapse: collapse; width:100%;border: 1px solid #02407B;border-collapse:collapse;}
		#addtable td {border: 1px solid #02407B; font-size: 12px; height:30px;}
		.left{ background:#319FEA; width:100px;text-align:center }
		.right{ text-align:left }
		.right input,.right select,.right textarea{ margin:10px}
	</style>
	<%
		int id=0;
		Teacher b=new Teacher();
		if(request.getParameter("id")!=null)
		{
			id=Integer.parseInt(request.getParameter("id"));
		    b=new TeacherServer().GetByID(id);
		}
	%>
<script type="text/javascript">
    	function sub()
    	{
    		if(document.myForm.name.value=="")
    		{
    			alert("请输入姓名");
    			return false;
    		}
    		if(document.myForm.age.value=="")
    		{
    			alert("请输入年龄");
    			return false;
    		}
    		if(isNaN(document.myForm.age.value))
    		{
    			alert("年龄输入有误");
    			return false;
    		}
    		if(document.myForm.tel.value=="")
    		{
    			alert("请输入电话");
    			return false;
    		}
    	}
    </script>
  </head>
  
  <body>
  	<form action='Ref/teacher.jsp?id=<%=id %>' enctype="multipart/form-data" method='post' name='myForm' onsubmit="return sub()">
  	<%@ include file="top.jsp"%>
  	<table cellpadding="0" cellspacing="0" style="width:1024px; margin:0px auto; border-bottom:solid 6px #02407B"> 
  	<tr>
  		<td style="width:6px; background:#02407B; font-size:0px"></td>
  		<td style="width:179px; vertical-align:top; background:#319FEA"><%@ include file="left.jsp"%></td>
  		<td style="width:6px; background:#02407B; font-size:0px"></td>
  		<td style="width:827px; vertical-align:top">
  		
  		
  		<table cellpadding="0" cellspacing="0" id="addtable"> 
  		<tr>
	  		<td class="left">教师号：</td>
	  		<td class="right"><input type="text" name="login" value="<%=b.getLogin() %>" /></td>
	  	</tr>
	  	<tr>
	  		<td class="left">姓名：</td>
	  		<td class="right"><input type="text" name="name" value="<%=b.getName() %>" /></td>
	  	</tr>
	  	<tr>
	  		<td class="left">年龄：</td>
	  		<td class="right"><input type="text" name="age" value="<%=b.getAge() %>" /></td>
	  	</tr>
	  	<tr>
	  		<td class="left">学历：</td>
	  		<td class="right">
				<select name="xueli">
					<option value="大专">大专</option>
					<option value="本科">本科</option>
					<option value="博士">博士</option>
					<option value="研究生">研究生</option>
				</select>
			</td>
	  	</tr>
	  	<tr>
	  		<td class="left">电话：</td>
	  		<td class="right"><input type="text" name="tel" value="<%=b.getTel() %>" /></td>
	  	</tr>
	  	<tr>
	  		<td class="left">专业：</td>
	  		<td class="right">
				<%
					List<ZhuanYe> bm=new ZhuanYeServer().GetAll();
					request.setAttribute("bm", bm);
				 %>
				 <select name="zhuanye">
					<c:forEach items="${ bm }" var="b">
					<option value="${b.id}">
					${b.type}
					</option>
					</c:forEach>
				</select>
			</td>
	  	</tr>
	  	<tr>
	  		<td class="left">最近照片：</td>
	  		<td class="right"><input type="file" name="file1"  /></td>
	  	</tr>
	  	<tr>
	  		<td class="left">内容：</td>
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
