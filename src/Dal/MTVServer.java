package Dal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import Mod.*;

public class MTVServer extends DB {
	Connection con=null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	
	///根据日志类型获取日志信息
	public List<MTV> GetAll(int startindex,int pagesize,String key)
	{
		List<MTV> list=new ArrayList<MTV>();
		try
		{
			con=this.getcon();
			String sql=DB.SetPageSQL("MTV", startindex, pagesize, key, "id", " id desc");
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next())
			{
				MTV b=new MTV();
				b.setId(rs.getInt("id"));
				b.setTitle(rs.getString("title"));
				b.setIntime(rs.getDate("intime"));
				b.setContent(rs.getString("content"));
				b.setType(new MTVTypeServer().GetByID(rs.getInt("MTVType_ID")));
				if(rs.getString("content").length()>300)
					b.setContent(rs.getString("content").substring(0, 300));
				b.setUrl(rs.getString("url"));
				b.setTeacher(new TeacherServer().GetByID(rs.getInt("Teacher_ID")));
				list.add(b);
			}
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			this.closeAll(con, ps, rs);
		}
		return list;
	}
	
	///获取日志的总数量
	public int GetCount(String key)
	{
		int count=0;
		try
		{
			con=this.getcon();
			String sql=DB.SetCountSQL("MTV", key,"count(*)");
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			rs.next();
            count = rs.getInt(1);
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			this.closeAll(con, ps, rs);
		}
		return count;
	}
	
	///发布日志
	public int Add(MTV b,int type)
	{
		int count=0;
		try
		{
			con=this.getcon();
			String sql=String.format("insert MTV values('%s',getdate(),'%s',%d,'%s',%d)",
					b.getTitle(),b.getContent(),type,b.getUrl(),b.getTeacher().getId());
			ps=con.prepareStatement(sql);
			count=ps.executeUpdate();
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			this.closeAll(con, ps, rs);
		}
		return count;
	}
	
	///修改照片信息
	public int Edit(MTV b,int type)
	{
		int count=0;
		try
		{
			con=this.getcon();
			String sql=String.format("update MTV set title='%s',content='%s',MTVType_ID=%d,url='%s' where id=%d",b.getTitle(),b.getContent(),type,b.getUrl(),b.getId());
			ps=con.prepareStatement(sql);
			count=ps.executeUpdate();
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			this.closeAll(con, ps, rs);
		}
		return count;
	}
	
	///删除照片信息
	public int Del(int id)
	{
		int count=0;
		try
		{
			con=this.getcon();
			String sql=String.format("delete from MTV where id=%d",id);
			ps=con.prepareStatement(sql);
			count=ps.executeUpdate();
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			this.closeAll(con, ps, rs);
		}
		return count;
	}
	
	///根据日志类型获取照片信息
	public MTV GetByID(int id)
	{
		
		try
		{
			con=this.getcon();
		    String sql=String.format("select * from [MTV] where ID=%d",id);
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next())
			{
				MTV p=new MTV();
				p.setId(rs.getInt("id"));
				p.setTitle(rs.getString("title"));
				p.setContent(rs.getString("content"));
				p.setIntime(rs.getDate("intime"));
				p.setType(new MTVTypeServer().GetByID(rs.getInt("MTVType_ID")));
				p.setContent(p.getContent().replace("\r\n", "<br>"));
				p.setUrl(rs.getString("url"));
				p.setTeacher(new TeacherServer().GetByID(rs.getInt("Teacher_ID")));
				return p;
			}
			
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			this.closeAll(con, ps, rs);
		}
		return null;
	}
}
