package Dal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Mod.*;
public class MTVTypeServer extends DB {
	Connection con=null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	
	///添加类别
	public int Add(String type,String zyid,int teacher)
	{
		int count=0;
		try
		{
			con=this.getcon();
			String sql=String.format("insert MTVType (Type,ZhuanYe,Teacher) values ('"+type+"','"+zyid+"','"+teacher+"')");
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
	public int Edit(String type,int id,String zhuanye,int teacher)
	{
		int count=0;
		try
		{
			con=this.getcon();
			String sql=String.format("update MTVType set type=('"+type+"'), zhuanye=('"+zhuanye+"'),teacher=('"+teacher+"') where id=('"+id+"')");
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
			String sql=String.format("delete from MTVType where id=%d",id);
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
	public List<MTVType> GetAll()
	{
		List<MTVType> list=new ArrayList<MTVType>();
		try
		{
			con=this.getcon();
			String sql="";
		    sql=String.format("select * from MTVType");
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next())
			{
				MTVType bt=new MTVType();
				bt.setId(rs.getInt("id"));
				bt.setType(rs.getString("type"));
				bt.setZhuanYe(rs.getString("zhuanye"));
				bt.setTeacher(rs.getInt("teacher"));
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
	public MTVType GetByID(int id)
	{
		
		try
		{
			con=this.getcon();
		    String sql=String.format("select * from [MTVType] where ID=%d",id);
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next())
			{
				MTVType bt=new MTVType();
				bt.setId(rs.getInt("id"));
				bt.setType(rs.getString("type"));
				bt.setZhuanYe(rs.getString("zhuanye"));
				bt.setTeacher(rs.getInt("teacher"));
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
