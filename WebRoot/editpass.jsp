<%@ page language="java" import="java.util.*,Mod.*,Dal.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <link href="css/css.css" rel="stylesheet" type="text/css" />
    <title>My JSP 'index.jsp' starting page</title>
    <script>
    	function sub()
    	{
    		if(document.myform.pwd1.value=="")
    		{
    			alert("请填写密码");
    			return false;
    		}
    		if(document.myform.pwd1.value!=document.myform.pwd2.value)
    		{
    			alert("两次输入的密码不一至");
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
                    
                    <%Client c=(Client)session.getAttribute("client"); %>
						<form method="post" name="myform" action="Ref/reg.jsp?param=pwd" >
						<table cellpadding="0" cellspacing="0" id="addtable">
                        	<tr>
                        		<td class="left">登陆名：</td>
                        		<td class="right"><%=c.getLogin() %></td>
                        	</tr>
                        	<tr>
                        		<td class="left">密码：</td>
                        		<td class="right"><input type="password" name="pwd1" /></td>
                        	</tr>
                        	<tr>
                        		<td class="left">确认密码：</td>
                        		<td class="right"><input type="password"  name="pwd2" /></td>
                        	</tr>
                        	<tr>
                        		<td class="left">&nbsp;</td>
                        		<td class="right"><input type="submit" value="修改密码" /></td>
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
