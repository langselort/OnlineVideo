package Dal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import Mod.*;

public class BoardServer extends DB {
	Connection con=null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	String tablename="Board";
	
	///根据日志类型获取日志信息
	public List<Board> GetAll(int startindex,int pagesize)
	{
		List<Board> list=new ArrayList<Board>();
		try
		{
			con=this.getcon();
			String sql=DB.SetPageSQL(tablename, startindex, pagesize, "", "id", " id desc");
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next())
			{
				Board b=new Board();
				b.setId(rs.getInt("id"));
				b.setTitle(rs.getString("title"));
				b.setInTime(rs.getDate("intime"));
				b.setContent(rs.getString("content"));
				b.setClient(new ClientServer().GetByID(rs.getInt("Client_ID")));
				b.setHuifu(rs.getString("huifu"));
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
	public int GetCount()
	{
		int count=0;
		try
		{
			con=this.getcon();
			String sql=DB.SetCountSQL(tablename, "","count(*)");
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
	public int Add(Board b)
	{
		int count=0;
		try
		{
			con=this.getcon();
			String sql=String.format("insert %s values(%d,'%s','%s',getdate(),'')",tablename,b.getClient().getId(),b.getTitle(),b.getContent());
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
	
	///删除照片信息
	public int Edit(int id,String huifu)
	{
		int count=0;
		try
		{
			con=this.getcon();
			String sql=String.format("update %s set huifu='%s' where id=%d",tablename,huifu,id);
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
	public Board GetByID(int id)
	{
		
		try
		{
			con=this.getcon();
		    String sql=String.format("select * from %s where ID=%d",tablename,id);
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next())
			{
				Board b=new Board();
				b.setId(rs.getInt("id"));
				b.setTitle(rs.getString("title"));
				b.setInTime(rs.getDate("intime"));
				b.setContent(rs.getString("content"));
				b.setClient(new ClientServer().GetByID(rs.getInt("Client_ID")));
				b.setHuifu(rs.getString("huifu"));
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
