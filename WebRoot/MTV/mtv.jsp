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
	if(request.getParameter("type")!=null)
	key="MTVType_ID="+request.getParameter("type");
	int rcount=new MTVServer().GetCount(key);
	
    List<MTV> ls=new MTVServer().GetAll(startindex,pagesize,key);
	request.setAttribute("ls", ls);
%>
    <style>
    a,a:visited{ color:lightslategray; text-decoration:none}
	#sqltable {border-collapse: collapse; width:100%;border: 1px solid #02407B;border-collapse:collapse;}
	#sqltable td {border: 1px solid #02407B; font-size: 12px; padding: 2px; height:30px; text-align:center}
	.title td {text-align: center; background: #319FEA; height:30px; border:solid 1px lightslategray; border-collapse:collapse; }
	.rows:hover{ background:#EAF4FD}
	</style>
  </head>
  
  <body>
    <%@ include file="top.jsp" %>		
	<table cellpadding="0" cellspacing="0" style="width:1024px; margin:0px auto; border-bottom:solid 6px #02407B"> 
  	<tr>
  		<td style="width:6px; background:#02407B; font-size:0px"></td>
  		<td style="width:179px; vertical-align:top; background:#319FEA"><%@ include file="left.jsp"%></td>
  		<td style="width:6px; background:#02407B; font-size:0px"></td>
  		<td style="width:827px; vertical-align:top">
            <table id="sqltable">
            <td style="width:668px; padding:15px 10px">
                <div >
                
                
                    <div style="width:668px; border-bottom:solid 2px #F5B7CE"><b style="display:block; padding-left:30px">教学视频</b></div>
                    <ul id="main_newsul">
						<c:forEach items="${ ls }" var="l">
                          <li><a href="mtvshow.jsp?id=${l.id }">${l.title }</a>
                          <span>[${l.intime }]</span></li>
                          </c:forEach>
                    </ul>
                    
                    <div style="width:626px; margin-left:24px; background:white; text-align:center" id="pagediv">
					<style>
					#pagediv a,#pagediv a:visited{ color:#A51010; margin:5px; font-size:12px}
					</style>
			  		<%
			  			String pagename="blog.jsp";
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
  	</table>
  </body>
</html>
