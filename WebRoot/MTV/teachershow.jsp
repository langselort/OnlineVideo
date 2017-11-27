<%@ page language="java" import="java.util.*,Mod.*,Dal.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <link href="css/css.css" rel="stylesheet" type="text/css" />
    <title>My JSP 'index.jsp' starting page</title>
    <%
	int id=0;
	if(request.getParameter("teacher")!=null)
		id=Integer.parseInt(request.getParameter("teacher"));
	Teacher t=new TeacherServer().GetByID(id);
%>
  </head>
  
  <body>
    <%@ include file="top.jsp" %>
<table cellpadding="0" cellspacing="0" style="width:1024px; margin:0px auto; border-bottom:solid 6px #02407B"> 
  	<tr>
  		<td style="width:6px; background:#02407B; font-size:0px"></td>
  		<td style="width:179px; vertical-align:top; background:#319FEA"><%@ include file="left.jsp"%></td>
  		<td style="width:6px; background:#02407B; font-size:0px"></td>
  		<td style="width:827px; vertical-align:top">
                
            
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
    
    

  </body>
</html>
