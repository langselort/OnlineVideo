<%@ page language="java" import="java.util.*,Mod.*,Dal.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <link href="css/css.css" rel="stylesheet" type="text/css" />
    <title>My JSP 'index.jsp' starting page</title>
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
						<form method="post" name="myform" action="Ref/reg.jsp?param=edit" >
						<table cellpadding="0" cellspacing="0" id="addtable">
							<tr>
						  		<td class="left">用户名：</td>
						  		<td class="right"><input type="text" name="login" value="<%=c.getLogin() %>" readonly="readonly"  /></td>
						  	</tr>
						  	<tr>
						  		<td class="left">姓名：</td>
						  		<td class="right"><input type="text" name="name" value="<%=c.getName() %>"  /></td>
						  	</tr>
						  	<tr>
						  		<td class="left">年龄：</td>
						  		<td class="right"><input type="text" name="age" value="<%=c.getAge() %>"  /></td>
						  	</tr>
						  	<tr>
						  		<td class="left">性别：</td>
						  		<td class="right">
									<input type="radio" checked="checked" value="男" id="nan" name="sex" />
					       			<label for="nan">男</label>
					       			<input type="radio"  value="女" id="nv" name="sex" />
					       			<label for="nv">女</label>
								</td>
						  	</tr>
						  	<tr>
						  		<td class="left">电话：</td>
						  		<td class="right"><input type="text" name="tel"  value="<%=c.getTel() %>" /></td>
						  	</tr>
						  	<tr>
						  		<td class="left">学历：</td>
						  		<td class="right">
						  			<select name="xueli">
										
										<option value="大专">专科</option>
										<option value="本科">本科</option>
										<option value="研究生">研究生</option>
										<option value="博士">博士</option>
									</select>
								</td>
						  	</tr>
						  	<tr>
						  		<td class="left">地址：</td>
						  		<td class="right"><input type="text" name="address" value="<%=c.getAddress() %>"  /></td>
						  	</tr>
						  	<tr>
						  		<td class="left">邮箱：</td>
						  		<td class="right"><input type="text" name="mail" value="<%=c.getMail() %>" /></td>
						  	</tr>
						  	<tr>
						  		<td class="left">&nbsp;</td>
						  		<td class="right"><input type="submit" value="修改"/></td>
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
