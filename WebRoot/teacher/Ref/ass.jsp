<%@ page language="java" import="java.util.*,Dal.*,Mod.*" pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	
	String filename = "";
	String title="";
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
	}
	
	
	String id=request.getParameter("id");
	String param=request.getParameter("param");
	Ass d=new Ass();
	Teacher t=(Teacher)session.getAttribute("teacher");
	if(param==null)
	{
		d.setTitle(title);
		d.setUrl("");
		d.setTeacher(t);
		if(!"".equals(filename))
			d.setUrl("file/"+filename);
		else if(id!=null&&!"null".equals(id)&&!id.equals("0"))
		{
			Ass o_d=new AssServer().GetByID(Integer.parseInt(id));
			d.setUrl(o_d.getUrl());
		}
	}
	
	int count=0;
	if(id.equals("0"))
		count = new AssServer().Add(d);
	else if(param==null)
	{
		d.setId(Integer.parseInt(id));
		count=new AssServer().Edit(d);
	}
	else if(param.equals("del"))
		count=new AssServer().Del(Integer.parseInt(id));
	if(count==0)
		out.print("<script>alert('操作失败');location.replace('../addass.jsp');</script>");
	else
		out.print("<script>alert('操作成功');location.replace('../ass.jsp');</script>");
%>
