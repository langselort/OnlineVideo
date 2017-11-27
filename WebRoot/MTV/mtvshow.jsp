<%@ page language="java" import="java.util.*,Mod.*,Dal.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <link href="css/css.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../flv/FLV.js"></script>
    <title>My JSP 'index.jsp' starting page</title>
    <%
	int id=1;
	if(request.getParameter("id")!=null)
		id=Integer.parseInt(request.getParameter("id"));
	MTV b=new MTVServer().GetByID(id);
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
                
                
                    <div style="width:668px; border-bottom:solid 2px #F5B7CE"><b style="display:block; padding-left:30px"><%=b.getTitle() %></b></div>
                    <div style="width:668px; text-align:center; padding:0px 0px; color:#808080">发表于：<%=b.getIntime() %></div>
                    <div style="width:668px; text-align:left; padding:10px 0px; color:#808080; line-height:22px; text-indent: 2em">
                    <div id="CuPlayer" style="margin-top:20px;">
							</div>
							<script type="text/javascript">
							var so = new SWFObject("flv/CuPlayerMiniV10_Black_S.swf","CuPlayer","476","300","9","#000000");
							so.addParam("allowfullscreen","true");
							so.addParam("allowscriptaccess","always");
							so.addParam("wmode","opaque");
							so.addParam("quality","high");
							so.addParam("salign","lt");
							so.addVariable("CuPlayerFile","../<%=b.getUrl() %>");
							so.addVariable("CuPlayerImage","Images/flashChangfa2.jpg");
							so.addVariable("CuPlayerShowImage","true");
							so.addVariable("CuPlayerWidth","476");
							so.addVariable("CuPlayerHeight","300");
							so.addVariable("CuPlayerAutoPlay","true");
							so.addVariable("CuPlayerAutoRepeat","true");
							so.addVariable("CuPlayerShowControl","true");
							so.addVariable("CuPlayerAutoHideControl","false");
							so.write("CuPlayer");	
							</script>
                    <%=b.getContent() %></div>
                    
                    
                </div>
            </td>
        </tr>
    </table>
    
    

  </body>
</html>
