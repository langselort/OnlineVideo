package Dal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import Mod.*;

public class AnswerServer extends DB {
	Connection con=null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	String tablename="Answer";
	
	///根据信息
	public List<Answer> GetAll(int startindex,int pagesize,String key)
	{
		List<Answer> list=new ArrayList<Answer>();
		try
		{
			con=this.getcon();
			String sql=DB.SetPageSQL(tablename, startindex, pagesize, key, "id", " id desc");
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next())
			{
				Answer b=new Answer();
				b.setId(rs.getInt("id"));
				b.setScore(rs.getDouble("score"));
				b.setAss(new AssServer().GetByID(rs.getInt("Ass_ID")));
				b.setClient(new ClientServer().GetByID(rs.getInt("Client_ID")));
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
	public int Add(int aid,int cid,String url)
	{
		int count=0;
		try
		{
			con=this.getcon();
			String sql=String.format("insert %s values(%d,%d,0,'%s')",
					tablename,aid,cid,url);
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
	public int EditScore(int id,double score)
	{
		int count=0;
		try
		{
			con=this.getcon();
			String sql=String.format("update %s set score=%f where id=%d",tablename,score,id);
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
	public Answer GetByID(int id)
	{
		
		try
		{
			con=this.getcon();
		    String sql=String.format("select * from %s where ID=%d",tablename,id);
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next())
			{
				Answer b=new Answer();
				b.setId(rs.getInt("id"));
				b.setScore(rs.getDouble("score"));
				b.setAss(new AssServer().GetByID(rs.getInt("Ass_ID")));
				b.setClient(new ClientServer().GetByID(rs.getInt("Client_ID")));
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
