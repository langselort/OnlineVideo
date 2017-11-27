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
    		if(document.myform.login.value.length<1)
    		{
    			alert("请填写用户名");
    			return false;
    		}
    		if(document.myform.pwd1.value.length<6)
    		{
    			alert("密码长度不能小于6位");
    			return false;
    		}
    		if(document.myform.pwd1.value!=ocument.myform.pwd2.value)
    		{
    			alert("两次输入的密码一不至");
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
                    
                    <form method="post" name="myform" action="Ref/reg.jsp?param=reg" onsubmit="return sub()">
						<table cellpadding="0" cellspacing="0" id="addtable">
							<tr>
						  		<td class="left">用户名：</td>
						  		<td class="right"><input type="text" name="login"  /></td>
						  	</tr>
						  	<tr>
						  		<td class="left">密码：</td>
						  		<td class="right"><input type="password" name="pwd1"  /></td>
						  	</tr>
						  	<tr>
						  		<td class="left">确认密码：</td>
						  		<td class="right"><input type="password" name="pwd2"  /></td>
						  	</tr>
						  	<tr>
						  		<td class="left">姓名：</td>
						  		<td class="right"><input type="text" name="name"  /></td>
						  	</tr>
						  	<tr>
						  		<td class="left">年龄：</td>
						  		<td class="right"><input type="text" name="age"  /></td>
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
						  		<td class="right"><input type="text" name="tel"  /></td>
						  	</tr>
						  	<tr>
						  		<td class="left">学历：</td>
						  		<td class="right">
						  			<select name="xueli">
										<option value="初中及以下">初中及以下</option>
										<option value="高中">高中</option>
										<option value="大专">大专</option>
										<option value="本科">本科</option>
										<option value="博士">博士</option>
									</select>
								</td>
						  	</tr>
						  	<tr>
						  		<td class="left">地址：</td>
						  		<td class="right"><input type="text" name="address"  /></td>
						  	</tr>
						  	<tr>
						  		<td class="left">邮箱：</td>
						  		<td class="right"><input type="text" name="mail"  /></td>
						  	</tr>
						  	<tr>
						  		<td class="left">&nbsp;</td>
						  		<td class="right"><input type="submit" value="注册"/></td>
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
