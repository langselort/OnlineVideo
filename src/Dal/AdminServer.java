package Dal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import Mod.*;
public class AdminServer extends DB {
	
	Connection con=null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	
	///π‹¿Ì‘±µ«¬Ω
	public Admin Login(String login)
	{
		
		try
		{
			con=this.getcon();
		    String sql=String.format("select * from [admin] where login='%s'",login);
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next())
			{
				Admin a=new Admin();
				a.setId(rs.getInt("id"));
				a.setLogin(rs.getString("login"));
				a.setPass(rs.getString("pass"));
				return a;
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
