package net;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ChatMgr3 
{
	private DBConnectionMgr pool;
	
	public ChatMgr3()
	{
		pool=DBConnectionMgr.getInstance();
	}
	//login - 성공 true 반환
	public boolean loginChk(String id, String pwd)
	{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "select count(id) from tblRegister where id=? and pwd=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();
			//flag = rs.next();// if문과 같은 결과가 나온다??
			if(rs.next() && rs.getInt(1)==1)
			{
				flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
	}

}
