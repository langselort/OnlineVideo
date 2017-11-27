<%@ page language="java" import="java.util.*,Mod.*,Dal.*" pageEncoding="UTF-8"%>
<%
	List<ZhuanYe> typelist=new ZhuanYeServer().GetAll();
	request.setAttribute("bm", typelist);
	
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
    <title>类型管理</title>
    <style>
		#addtable {border-collapse: collapse; width:100%;border: 1px solid #02407B;border-collapse:collapse;}
		#addtable td {border: 1px solid #02407B; font-size: 12px; height:30px;}
		.left{ background:#319FEA; width:100px;text-align:center }
		.right{ text-align:left }
		.right input{ margin:10px}
	</style>
	<%
		int id=0;
		MTVType b=new MTVType();
		if(request.getParameter("id")!=null)
		{
			id=Integer.parseInt(request.getParameter("id"));
		    b=new MTVTypeServer().GetByID(id);
		}
	%>
  </head>
  
  <body>
  	<form method="post" action="Ref/mtvtype.jsp?id=<%=request.getParameter("id") %>">
  	<%@ include file="top.jsp"%>
  	<table cellpadding="0" cellspacing="0" style="width:1024px; margin:0px auto; border-bottom:solid 6px #02407B"> 
  	<tr>
  		<td style="width:6px; background:#02407B; font-size:0px"></td>
  		<td style="width:179px; vertical-align:top; background:#319FEA"><%@ include file="left.jsp"%></td>
  		<td style="width:6px; background:#02407B; font-size:0px"></td>
  		<td style="width:827px; vertical-align:top">
  		
  		
  		<table cellpadding="0" cellspacing="0" id="addtable"> 
	  	<tr>
	  		<td class="left">课程名称：</td>
	  		<td class="right"><input type="text" name="type" value="<%=b.getType() %>" /></td>
	  	</tr>
	  	<tr>
	  		<td class="left">课程专业：</td>
	  		<td class="right"><select name="zhuanye" style="width:100">
                					<% 
                						if(typelist!=null&&typelist.size()!=0){
                							for(int i=0;i<typelist.size();i++){
                								ZhuanYe typeBean=(ZhuanYe)typelist.get(i);
                					%>
                					<option value="<%=typeBean.getType()%>"><%=typeBean.getType() %></option>
                					<%
                							}
                						}
                					%>
                				</select></td>
	  	</tr>
	  	<tr>
	  		<td class="left">课程教师：</td>
	  		<td class="right"><select name="teacher" style="width:100">
                					<% 
                						if(ts!=null&&ts.size()!=0){
                							for(int i=0;i<ts.size();i++){
                								Teacher Bean=(Teacher)ts.get(i);
                					%>
                					<option value="<%=Bean.getId()%>"><%=Bean.getName() %></option>
                					<%
                							}
                						}
                					%>
                				</select></td>
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
