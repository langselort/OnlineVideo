package Dal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Mod.*;
public class ZhuanYeServer extends DB {
	Connection con=null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	String tablename="ZhuanYe";
	///添加类别
	public int Add(String type)
	{
		int count=0;
		try
		{
			con=this.getcon();
			String sql=String.format("insert %s values('%s')",tablename,type);
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
	public int Edit(String type,int id)
	{
		int count=0;
		try
		{
			con=this.getcon();
			String sql=String.format("update %s set type='%s' where id=%d",tablename,type,id);
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
	
	///根据日志类型获取日志信息
	public List<ZhuanYe> GetAll()
	{
		List<ZhuanYe> list=new ArrayList<ZhuanYe>();
		try
		{
			con=this.getcon();
			String sql="";
		    sql=String.format("select * from %s",tablename);
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next())
			{
				ZhuanYe bt=new ZhuanYe();
				bt.setId(rs.getInt("id"));
				bt.setType(rs.getString("type"));
				list.add(bt);
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
	
	
	
	///根据日志类型获取照片信息
	public ZhuanYe GetByID(int id)
	{
		
		try
		{
			con=this.getcon();
		    String sql=String.format("select * from [%s] where ID=%d",tablename,id);
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next())
			{
				ZhuanYe bt=new ZhuanYe();
				bt.setId(rs.getInt("id"));
				bt.setType(rs.getString("type"));
				return bt;
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
