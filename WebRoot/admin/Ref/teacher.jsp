<%@ page language="java" import="java.util.*,Dal.*,Mod.*" pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	
	String filename = "";
	String name="";
	int age=0;
	String xueli="";
	String tel="";
	int zyID=0;
	String content="";
	String login="";
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
		name=smart.getRequest().getParameter("name");
		age=Integer.parseInt(smart.getRequest().getParameter("age"));
		xueli=smart.getRequest().getParameter("xueli");
		tel=smart.getRequest().getParameter("tel");
		content=smart.getRequest().getParameter("content");
		login=smart.getRequest().getParameter("login");
		zyID=Integer.parseInt(smart.getRequest().getParameter("zhuanye"));
	}
	
	
	String id=request.getParameter("id");
	
	String param=request.getParameter("param");
	Teacher t=new Teacher();
	if(param==null)
	{
		t.setId(Integer.parseInt(id));
		t.setName(name);
		t.setAge(age);
		t.setTel(tel);
		t.setContent(content);
		t.setImg("file/untitled.bmp");
		t.setXueli(xueli);
		t.setLogin(login);
		if(!"".equals(filename))
			t.setImg("file/"+filename);
		else if(id!=null&&!"null".equals(id)&&!id.equals("0"))
		{
			Teacher o_j=new TeacherServer().GetByID(Integer.parseInt(id));
			t.setImg(o_j.getImg());
		}
	}
	
	int count=0;
	if(id==null||id.equals("null")||id.equals("0"))
		count = new TeacherServer().Add(t,zyID);
	else if(param==null)
		count=new TeacherServer().Edit(t,zyID);
	else if(param.equals("del"))
		count=new TeacherServer().Del(Integer.parseInt(id));
	if(count==0)
		out.print("<script>alert('操作失败');location.replace('../addteacher.jsp');</script>");
	else
		out.print("<script>alert('操作成功');location.replace('../teacher.jsp');</script>");
%>
