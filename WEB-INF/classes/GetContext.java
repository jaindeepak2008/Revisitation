package CT;
import java.util.Set;
import java.util.HashSet;
import java.sql.*;
import databaseconnection.*;


public class GetContext 
{
	public static Set<String> main(String uid) 
	{
	Set<String> set=new HashSet<String>();
		
		try {
		
		Connection con = databasecon.getconnection();
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery("select * from context2 where uid='"+uid+"' "); 
		while(rs.next()){
			set.add(rs.getString(2));
						set.add(rs.getString(3));
									set.add(rs.getString(4));
		}
		} catch (Exception err) {
		err.printStackTrace();
		}
		return set;
	}

	public static void main(String[] args){
	System.out.println(main("1"));
	} 


}
