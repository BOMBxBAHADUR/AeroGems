package model;

import controller.DbConnection.DbConnection;

public class userDetail {
	public static int userId(String userName) {
		DbConnection conn = new DbConnection();
		int userId = conn.getUserId(userName);
		return userId;
	}
}
