<%@ page language="java" import="java.util.*,Mod.*,Dal.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <link href="css/css.css" rel="stylesheet" type="text/css" />
    <title>My JSP 'index.jsp' starting page</title>
    <%
	int id=0;
	if(request.getParameter("id")!=null)
		id=Integer.parseInt(request.getParameter("id"));
	Teacher t=new TeacherServer().GetByID(id);
%>
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
                
            
            <style>
			#pinglist{border-collapse:collapse; margin:10px 0px; font-size:12px}
			#pinglist img{width:100px; height:100px; border:solid 1px gainsboro}
			#pinglist td{ border-top:solid 1px #DCDCDC; border-bottom:solid 1px #DCDCDC; border-collapse:collapse; padding:5px 0px}
			#pinglist td a{ text-decoration:none}
		</style>
                    <table cellpadding="0" cellspacing="0" style="width:600px; margin:20px 30px" id="pinglist">
                    	<tr>
                    		<td rowspan="4" style="width:120px; text-align:center"><img src="<%=t.getImg() %>" style="padding:2px; border:solid 1px #DCDCDC; width:80px; height:80px" /></td>
                    		<td align="left"><b style="color:orange"><%=t.getName() %></b></td>
                    	</tr>
                    	<tr>
                    		<td align="left">年龄：<%=t.getAge() %></td>
                    	</tr>
                    	<tr>
                    		<td align="left">学历：<%=t.getXueli() %></td>
                    	</tr>
                    	<tr>
                    		<td align="left">专业：<%=t.getZhuanye().getType() %></td>
                    	</tr>
                    	<tr>
                    		<td align="left" colspan="2" style="line-height:22px"><%=t.getContent() %></td>
                    	</tr>
                    </table>
                    
                    
                </div>
            </td>
        </tr>
    </table>
    
    
    <%@ include file="foot.jsp" %> 
  </body>
</html>
