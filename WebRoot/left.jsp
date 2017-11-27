<%@ page language="java" import="java.util.*,Mod.*,Dal.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'left.jsp' starting page</title>
    
	<link href="css/css.css" rel="stylesheet" type="text/css" />
	<style>
    #leftmenu{ width:179px; height:27px; background:url(images/menutop.jpg);}
    #leftmenu b{ font-size:13px; color:white; display:block; padding-top:5px; padding-left:35px}
    #menuul{list-style:none; margin:0px; padding:0px}
    #menuul li{ width:179px; height:29px; background:url(images/menubg.jpg)}
    #menuul a,#menuul a:visited{ color:white; text-decoration:none; font-size:13px; font-weight:bold; display:block; padding-left:30px; padding-top:7px}
    </style>

  </head>
  
  <body>
    <div class="left_top"><b>登录</b></div>
                <div class="left_text"><div>
                	<%if(session.getAttribute("client")==null){ %>
                	<form method="post" name="myform" action="Ref/adminlogin.jsp" onsubmit="return sub()">
                    <!-- <table cellpadding="0" cellspacing="0" id="logintable">
                        <tr>
                            <td class="login_left">登陆名：</td>
                            <td class="login_right"><input id="Text1" name="login" type="text" /></td>
                        </tr>
                        <tr>
                            <td class="login_left">登陆密码：</td>
                            <td class="login_right"><input id="Text2" name="pass" type="password" /></td>
                        </tr>
                        <tr>
                            <td class="login_center" colspan="2"><a href="reg.jsp">注册</a></td>
                        </tr>
                        <tr>
                            <td class="login_center" colspan="2">
                                <input id="Button1" type="submit" value="登陆" />
                            </td>
                        </tr>
                    </table>
                    </form> -->
              <table cellSpacing="0" cellPadding="0" width="100%" border="0" id="table211" height="50">
                  <tr>
                    <td height="164" colspan="2" align="middle">
                        <table cellSpacing="0" cellPadding="0" width="100%" border="0" height="143" id="table212">
                          <tr>
                            <td width="20%" height="35" class="top_hui_text" align="right">用户名：</td>
                            <td height="38" colspan="2" class="top_hui_text" align="left"><input type="text" name="name" class="editbox4"/>                          </td>
                          </tr>
                          <tr>
                            <td width="13%" height="35" class="top_hui_text" align="right" valign="top" style="width: 115px; "> 密 码： &nbsp;&nbsp; </span></td>
                            <td height="35" colspan="2" class="top_hui_text" align="left"><input type="password" name="pwd" class="editbox4"/>
                            	 <br />
                                <input type="radio" value="管理员" id="admin" name="author" checked="true"/>
                                <label for="admin">管理员</label>
                                <input type="radio" value="教师" id="teacher" name="author" />
                                <label for="teacher">教师</label> 
                                <input type="radio" value="学生" id="client" name="author"/>
                                <label for="client">学生</label>
                            </td>
                          </tr>
                          
                          <tr>
                            <td height="35" >&nbsp;</td>
                            <td width="20%" height="35" ><input type="submit" value="登陆" />
                                                        <input type="button" value="注册" onClick="window.location.href='reg.jsp'"></td>
                            <td width="67%" class="top_hui_text" align="left"></td>
                          </tr>
                        </table>
                        
                    </td>
                  </tr>
              </table>
             </form>

                        
                    <%}else{
					   	Client c=(Client)session.getAttribute("client");
					%>
					<table cellpadding="0" cellspacing="0" id="logintable">
                        <tr>
                            <td class="login_left">登陆名：</td>
                            <td class="login_right"><%=c.getLogin() %><a href="Ref/reg.jsp?param=exit" style="color:#6AA5C7">退出系统</a></td>
                        </tr>
                        <tr>
                            <td class="login_left">姓名：</td>
                            <td class="login_right"><%=c.getName() %></td>
                        </tr>
                        <!-- <tr>
                            <td class="login_center" colspan="2"><li><a href="ass.jsp">作业查看</a></li>
                                                                 <li><a href="myanswer.jsp">作业记录</a></li></td>
                        </tr>
                        <tr>
                            <td class="login_center" colspan="2"><li><a href="edit.jsp">修改资料</a></li>
                                                                 <li><a href="editpass.jsp">修改密码</a></li></td>
                        </tr> -->
                    </table>
					<%} %>
                </div></div>
<%--                 <div class="left_btm">&nbsp;</div>
                
                <div class="left_top"><b>课程模块</b></div>
                <div class="left_text"><div>
                    <ul class="left_newsul">
                    <%
                    	List<MTVType> left_bs=new MTVTypeServer().GetAll();
						request.setAttribute("left_bs", left_bs);
                     %>
                     	<c:forEach items="${ left_bs }" var="b">
                        <li><a href="mtv.jsp?type=${b.id }">${b.type }</a></li>
                        </c:forEach>
                    </ul>
                </div></div>
                <div class="left_btm">&nbsp;</div> --%>
  </body>
</html>
