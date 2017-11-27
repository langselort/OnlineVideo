<%@ page language="java" import="java.util.*,Mod.*,Dal.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <link href="css/css.css" rel="stylesheet" type="text/css" />
    <title>My JSP 'index.jsp' starting page</title>
    <%
	int startindex=0;
 	if(request.getParameter("startindex")!=null)
 		startindex =  Integer.parseInt(request.getParameter("startindex"));
	int pagesize=20;
	int rcount=new TeacherServer().GetCount();
	
    List<Teacher> ts=new TeacherServer().GetAll(startindex,pagesize);
	request.setAttribute("ts", ts);
%>
  </head>
  <style>
	    a,a:visited{ color:lightslategray; text-decoration:none}
		#listul li { float:left; width:100px; text-align:center; padding:10px}
		#listul li img{ padding:2px; border:solid 1px #DCDCDC; width:80px;}
	</style>
  <body>
    <%@ include file="top.jsp" %>
    <table cellpadding="0" cellspacing="0" id="main">
        <tr>
            <td style="width:356px; padding:0px 10px">
                <%@ include file="left.jsp" %> 
            </td>
            
            <td style="width:668px; padding:15px 10px">
                <div id="rightdiv">
                
                
                    <div style="width:668px; border-bottom:solid 2px #F5B7CE"><b style="display:block; padding-left:30px">家教信息查看</b></div>
                    
                    
                    <ul id="listul">
					<c:forEach items="${ ts }" var="t">
						<li><a href="teachershow.jsp?id=${t.id }"><img src="${t.img }" /><br />${t.name }</a></li>
					</c:forEach>
                    </ul>
                    
                    <div style="width:626px; margin-left:24px; background:white; text-align:center" id="pagediv">
					<style>
					#pagediv a,#pagediv a:visited{ color:#A51010; margin:5px; font-size:12px}
					</style>
			  		<%
			  			String pagename="teacher.jsp";
						int sumcount=0;
						if(rcount%pagesize==0)
							sumcount=rcount/pagesize;
						else
							sumcount=rcount/pagesize+1;
						if(startindex==0)//判断是否是第一页
							out.print("<a style=''>首页</a><a style=''>上一页</a>");
						else
							out.print("<a style='' href='"+pagename+"?startindex=0'>首页</a><a style='' href='"+pagename+"?startindex="+Integer.toString(startindex-1)+"'>上一页</a>");
						if(sumcount-1==startindex)//判断是否是最后一页
							out.print("<a style=''>下一页</a><a style=''>尾页</a>");
						else
							out.print("<a style='' href='"+pagename+"?startindex="+Integer.toString(startindex+1)+"'>下一页</a><a style='' href='"+pagename+"?startindex="+Integer.toString(sumcount-1)+"'>尾页</a>");
					 %>
			  		</div>
                    
                    
                </div>
            </td>
        </tr>
    </table>
    
    
    <%@ include file="foot.jsp" %> 
  </body>
</html>
