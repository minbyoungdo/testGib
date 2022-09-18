package mvc.database;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.DriverManager;
public class DBConnection1 
{
	public static Connection getConnection()throws SQLException, ClassNotFoundException  
	{		
		Connection conn = null;		
		
		/*String url = "jdbc:oracle:thin:@localhost:1521:orcl";
		String user ="market";
		String password ="market";*/
		String url = "jdbc:oracle:thin:@WIN-U920QAV753C:1522:xe";
		String user = "sc";
		String password = "1234";
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn =DriverManager.getConnection(url,user, password);
		return conn;
	}
		
}
