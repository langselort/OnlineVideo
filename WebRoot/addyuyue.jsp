<%@ page language="java" import="java.util.*,Mod.*,Dal.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <link href="css/css.css" rel="stylesheet" type="text/css" />
    <script language="javascript" type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
    <title>My JSP 'index.jsp' starting page</title>
    <script>
    	function sub()
    	{
    		if(document.myform.login.value.length<1)
    		{
    			alert("请填写日期");
    			return false;
    		}
    		if(document.myform.pwd1.value.length<6)
    		{
    			alert("请选择时间段");
    			return false;
    		}
    	}
    </script>
  </head>
  
  <body>
    <%@ include file="top.jsp" %>
    <table cellpadding="0" cellspacing="0" id="main">
        <tr>
            <td style="width:356px; padding:0px 10px">
                <%@ include file="left.jsp" %> 
            </td>
            
            <td style="width:668px; padding:15px 10px">
                <div id="rightdiv">
                    
                    <%
                   		int tid=Integer.parseInt(request.getParameter("tid"));
                   		Teacher t=new TeacherServer().GetByID(tid);
                   	 %>
                    <form method="post" name="myform" action="Ref/yuyue.jsp?tid=<%=tid %>" onsubmit="return sub()">
                    	
						<table cellpadding="0" cellspacing="0" id="addtable">
							<tr>
						  		<td class="left">家教：</td>
						  		<td class="right"><%=t.getName() %></td>
						  	</tr>
						  	<tr>
						  		<td class="left">日期：</td>
						  		<td class="right"><input type="text" name="date" onClick="WdatePicker()"   /></td>
						  	</tr>
						  	<tr>
						  		<td class="left">类型：</td>
						  		<td class="right">
									
									<select name="grade">
										<option value="小学">小学</option>
										<option value="初中">初中</option>
										<option value="高中">高中</option>
									</select>
								</td>
						  	</tr>
						  	<tr>
						  		<td class="left">时间段：</td>
						  		<td class="right">
									
									<select name="time">
										<option value="8:00-9:00">8:00-9:00</option>
										<option value="9:00-10:00">9:00-10:00</option>
										<option value="10:00-11:00">10:00-11:00</option>
										<option value="13:00-14:00">13:00-14:00</option>
										<option value="14:00-15:00">14:00-15:00</option>
										<option value="15:00-16:00">15:00-16:00</option>
										<option value="16:00-17:00">16:00-17:00</option>
									</select>
								</td>
						  	</tr>
						  	<tr>
						  		<td class="left">备注：</td>
						  		<td class="right"><textarea name="content" style="width:98%; height:80px"></textarea></td>
						  	</tr>
						  	
						  	<tr>
						  		<td class="left">&nbsp;</td>
						  		<td class="right"><input type="submit" value="预约"/></td>
						  	</tr>
					  	</table>
						</form>
                    
                </div>
            </td>
        </tr>
    </table>
    
    
    <%@ include file="foot.jsp" %> 
  </body>
</html>
