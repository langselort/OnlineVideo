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
	String key="";
	int rcount=new DownServer().GetCount(key);
	
    List<Down> ls=new DownServer().GetAll(startindex,pagesize,key);
	request.setAttribute("ls", ls);
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
                
                
                    <div style="width:668px; border-bottom:solid 2px #F5B7CE"><b style="display:block; padding-left:30px">课件下载</b></div>
                    <ul id="downlist" style="width: 633px; ">
						<c:forEach items="${ ls }" var="l">
                          <li><a href="${l.url }">${l.title }</a><br />
                          <span>[上传老师：${l.teacher.name }]</span></li>
                          </c:forEach>
                    </ul>
                    
                    <div style="width:626px; margin-left:24px; background:white; text-align:center" id="pagediv">
					<style>
					#pagediv a,#pagediv a:visited{ color:#A51010; margin:5px; font-size:12px}
					</style>
			  		<%
			  			String pagename="down.jsp";
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
