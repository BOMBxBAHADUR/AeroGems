package controller.database;

import java.sql.*;

import model.UserModel;
import util.StringUtils;

public class DatabaseController{
	public Connection getConnection() throws SQLException, ClassNotFoundException{
		Class.forName("com.mysql.jbdc.Driver");
		String url = "jdbc:mysql://localhost:3306/AeroGems";
		String user = "root";
		String pass = "";
		return DriverManager.getConnection(url, user, pass);
	}
	
	public int adduser(UserModel usermodel) {
		try (Connection con=getConnection()){
			
			
			PreparedStatement checkEmailSt = con.prepareStatement(StringUtils.GET_EMAIL);
			checkEmailSt.setString(1, UserModel.getEmail());
			ResultSet checkEmailRs = checkEmailSt.executeQuery();
			checkEmailRs.next();
			if (checkEmailRs.getInt(1) > 0) {
				return -3;
			}
		}
			//checking email
		
	}
}