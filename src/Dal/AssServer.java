package Dal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import Mod.*;

public class AssServer extends DB {
	Connection con=null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	String tablename="Ass";
	
	///根据信息
	public List<Ass> GetAll(int startindex,int pagesize,String key)
	{
		List<Ass> list=new ArrayList<Ass>();
		try
		{
			con=this.getcon();
			String sql=DB.SetPageSQL(tablename, startindex, pagesize, key, "id", " id desc");
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next())
			{
				Ass b=new Ass();
				b.setId(rs.getInt("id"));
				b.setTitle(rs.getString("title"));
				b.setIntime(rs.getString("intime"));
				b.setTeacher(new TeacherServer().GetByID(rs.getInt("Teacher_ID")));
				b.setUrl(rs.getString("url"));
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
	
	///获取总数量
	public int GetCount(String key)
	{
		int count=0;
		try
		{
			con=this.getcon();
			String sql=DB.SetCountSQL(tablename, key,"count(*)");
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
	
	///上传资源
	public int Add(Ass a)
	{
		int count=0;
		try
		{
			con=this.getcon();
			String sql=String.format("insert %s values('%s','%s',getdate(),%d)",
					tablename,a.getTitle(),a.getUrl(),a.getTeacher().getId());
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
	
	///修改
	public int Edit(Ass a)
	{
		int count=0;
		try
		{
			con=this.getcon();
			String sql=String.format("update %s set title='%s',url='%s' where id=%d",
					tablename,a.getTitle(),a.getUrl(),a.getId());
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

	
	///删除信息
	public int Del(int id)
	{
		int count=0;
		try
		{
			con=this.getcon();
			String sql=String.format("delete from %s where id=%d",tablename,id);
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
	
	///获取信息
	public Ass GetByID(int id)
	{
		
		try
		{
			con=this.getcon();
		    String sql=String.format("select * from %s where ID=%d",tablename,id);
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next())
			{
				Ass b=new Ass();
				b.setId(rs.getInt("id"));
				b.setTitle(rs.getString("title"));
				b.setIntime(rs.getString("intime"));
				b.setTeacher(new TeacherServer().GetByID(rs.getInt("Teacher_ID")));
				b.setUrl(rs.getString("url"));
				return b;
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
