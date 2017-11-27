<%@ page language="java" import="java.util.*,Mod.*,Dal.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <link href="css/css.css" rel="stylesheet" type="text/css" />
    <title>My JSP 'index.jsp' starting page</title>
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
    <table cellpadding="0" cellspacing="0" id="main">
        <tr>
            <td style="width:356px; padding:0px 10px">
                <%@ include file="left.jsp" %> 
            </td>
            
            <td style="width:668px; padding:15px 10px">
                <div id="rightdiv">
                    
                    <table cellpadding="0" cellspacing="0">
                        <tr>
                            <td style="width:314px; height:201px; padding:10px">
                                <script src="css/jump.js" type="text/javascript"></script>
                            </td>
                            <td>
                                <ul class="main_imgnews">
                                	<%										
									    List<Down> ls1=new DownServer().GetAll(0,6,"");
										request.setAttribute("ls1", ls1);
									%>
									<c:forEach items="${ ls1 }" var="l">
                                    <li><a href="${l.url }">${l.title }</a></li>
                                    </c:forEach>
                                </ul>
                            </td>
                        </tr>
                    </table>
                    
                    <div style="width:668px; border-bottom:solid 2px #0000ff"><b style="display:block; padding-left:30px">课程模块</b></div>
                    <%-- <ul class="main_newsul">
                        <%										
						    List<MTV> ls2=new MTVServer().GetAll(0,6,"");
							request.setAttribute("ls2", ls2);
						%>
						<c:forEach items="${ ls2 }" var="l">
                                 <li><a href="blogshow.jsp?id=${l.id }">${l.title }</a></li>
                                 </c:forEach>
                    </ul> --%>
	<table cellpadding="0" cellspacing="0" style="width: 1024px; margin:0px auto; border-bottom:solid 6px #02407B"> 
  	<tr>


  		<td style="width:6px; background:#02407B; font-size:0px"></td>
  		<td style="width:827px; vertical-align:top">
		<table id="sqltable" style="width: 515px; ">
		<tr class="title">
			<td style="width: 303px; ">类型名称</td>
			<td style="width: 261px; ">专业名称</td>
		</tr>		
			<tr class="rows">
	<% 				List<MTVType> typelist=new MTVTypeServer().GetAll();
					request.setAttribute("bm", typelist);
					if(typelist!=null&&typelist.size()!=0){
					for(int i=0;i<typelist.size();i++){
					MTVType typeBean=(MTVType)typelist.get(i);
	%>

				<td style="width: 217px; "><a href="MTV/mtv.jsp?type=<%=typeBean.getId() %>&&teacher=<%=typeBean.getTeacher() %>"><%=typeBean.getType() %></td>                					
				<td><%=typeBean.getZhuanYe() %></td>

			</tr>
				<%
                							}
                						}
                					%>
	</table>
	</td>
  		<td style="width:6px; background:#02407B; font-size:0px"></td>
  	</tr>
  	</table>
<%--                 <div class="left_text"><div>
                    <ul class="left_newsul">
                    <%
                    	List<MTVType> left_bs=new MTVTypeServer().GetAll();
						request.setAttribute("left_bs", left_bs);
                     %>
                     	<c:forEach items="${ left_bs }" var="b">
                        <li><a href="mtv.jsp?type=${b.id }">${b.type }</a></li>
                        </c:forEach>
                    </ul>
                </div></div> --%>
                </div>
            </td>
        </tr>
    </table>
    
    
    <%@ include file="foot.jsp" %> 
  </body>
</html>
