<%@ page language="java" import="java.util.*,Dal.*,Mod.*" pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	
	String filename = "";
	String title="";
	int mtvtype=0;
	String content="";
	if(request.getParameter("param")==null)
	{
		//上传代码
		com.jspsmart.upload.SmartUpload smart=new com.jspsmart.upload.SmartUpload();
		
		
		
		//初始化的方法必须先执行
		//参数：config,request,response都是jsp内置对象
		smart.initialize(config,request,response);
		smart.upload(); 
		//取得整个web应用的物理根路径（注意不是jsp项目根路径）
		String root = request.getSession().getServletContext().getRealPath("/");
		//设置上传文件的保存路径（绝对路径/物理路径）
		String savePath = root + "file\\";
		//声明SmartUpload类对象
		try { 
			if(!smart.getFiles().getFile(0).isMissing())
			{
			//将全部上传文件保存到指定目录下
			smart.save(savePath);
			//取得文件名(因为只上传一个文件，所以用getFile(0))
			filename = smart.getFiles().getFile(0).getFileName();
			}
		} catch (Exception e){
	    	System.out.println("Error : " + e.toString());   
		}    
		//上传结束
		title=smart.getRequest().getParameter("title");
		mtvtype=Integer.parseInt(smart.getRequest().getParameter("mtvtype"));
		content=smart.getRequest().getParameter("content");
	}
	
	
	String id=request.getParameter("id");
	String param=request.getParameter("param");
	MTV p=new MTV();
	Teacher t=(Teacher)session.getAttribute("teacher");
	if(param==null)
	{
		p.setId(Integer.parseInt(id));
		p.setTitle(title);
		p.setContent(content);
		p.setTeacher(t);
		if(!"".equals(filename))
			p.setUrl("file/"+filename);
		else if(!id.equals("0"))
		{
			MTV pp=new MTVServer().GetByID(Integer.parseInt(id));
			p.setUrl(pp.getUrl());
		}
	}
	
	int count=0;
	if(id.equals("0"))
		count = new MTVServer().Add(p,mtvtype);
	else if(param==null)
		count=new MTVServer().Edit(p,mtvtype);
	else if(param.equals("del"))
		count=new MTVServer().Del(Integer.parseInt(id));
	if(count==0)
		out.print("<script>alert('操作失败');location.replace('../addmtv.jsp');</script>");
	else
		out.print("<script>alert('操作成功');location.replace('../mtv.jsp');</script>");
%>
