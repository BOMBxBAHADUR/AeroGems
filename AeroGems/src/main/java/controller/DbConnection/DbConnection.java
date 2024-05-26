package controller.DbConnection;

import java.sql.*;

import com.mysql.cj.xdevapi.Result;

import resources.Constants;


public class DbConnection {
		public static Connection getConnection()
		{
			try {
				
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/coursework", "root", "");
				
				return connection;
				
			}catch(SQLException e) {
				e.printStackTrace();
				return null;
			}catch(ClassNotFoundException e) {
				e.printStackTrace();
				return null;
			}
		}
		//method to for the user to log in
		public boolean isUserRegistered(String username, String password) throws Exception {
			Connection conn = getConnection();
			if(conn != null) {
				try {
					PreparedStatement statement = conn.prepareStatement(Constants.checkUserLoginInfo);
					statement.setString(1, username);
					ResultSet result = statement.executeQuery();
					if(result.next()) {
						String dbPasswordEncrypt = result.getString("password");
						String dbPasswordDecrypt = Constants.decrypt(dbPasswordEncrypt, "my-secret-key-is");
						if(dbPasswordDecrypt != null && dbPasswordDecrypt.equals(password)) {
							System.out.println("Data Matched");
							return true;
						}
						else {
							System.out.println("data not matched");
							return false;
						
						}
					}
					else {
						System.out.println("No Data In DatabAse");
						return false;
					}
				}
				catch(SQLException e) {
					System.out.println("Login SQL Exception");
					return false;
				}
				catch(Exception e) {
					System.out.println("Login Exception");
					return false;
				}
			}
			return false;
			
			
		}
		public ResultSet dataForCookies(String username)throws Exception {
			Connection conn = getConnection();
			if(conn !=null) {
				try {
					PreparedStatement statement = conn.prepareStatement(Constants.userDetailCookies);
					statement.setString(1, username);
					ResultSet result = statement.executeQuery();
					return result;
					
				}catch(Exception e) {
					e.printStackTrace();
					return null;
					
				}
				
			}
			return null;
		}
		
		public int getUserId(String username) {
			Connection conn = getConnection();
			if(conn != null) {
				PreparedStatement statement;
				try {
					statement = conn.prepareStatement(Constants.getUserId);

					statement.setString(1, username);
					ResultSet result = statement.executeQuery();
					if(result.next()) {
						return result.getInt("id");
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					return 0;
				}
				
			}
			return 0;
			
		}
		public boolean addItemCart(String username, int productId) {
			DbConnection connection = new DbConnection();
			Connection conn = getConnection();
			int userId = connection.getUserId(username);
			
			if(userId > 0) {
				if(conn != null) {
					try {
						PreparedStatement statement = conn.prepareStatement(Constants.cartAdd);
						System.out.println("UserId: "+ userId + "ProductId"+ productId);
						statement.setInt(1, userId);
						statement.setInt(2, productId);
						int i = statement.executeUpdate();
						if(i>0) {
							return true;
						}
						else {
							return false;
						}
							
						
						
						
						
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
						return false;
					}
				}
			}
			
			
		return false;	
		}
		
		public static boolean deleteCartItem(int id) {
			Connection conn = getConnection();
			if(conn != null) {
				try {
					PreparedStatement statement = conn.prepareStatement(Constants.deleteCart);
					statement.setInt(1,id);
					int i = statement.executeUpdate();
					if(i >0) {
						return true;
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					return false;
				}
				
			}
			return false;
		}
		
		public static boolean purchase(int id) {
			Connection conn = getConnection();
			if(conn != null) {
				try {
					PreparedStatement statement = conn.prepareStatement(Constants.purchaseAdd);
					statement.setInt(1, id);
					System.out.println(Constants.purchaseAdd);
					int i = statement.executeUpdate();
					if(i>0) {
						boolean j = DbConnection.deleteCart(id);
						if(j) {
							return true;
						}
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					return false;
				}
				
			}
			return false;
		}
		public static boolean deleteCart(int id) {
			Connection conn = getConnection();
			if(conn != null) {
				PreparedStatement statement;
				try {
					statement = conn.prepareStatement(Constants.deleteAllCart);
					statement.setInt(1, id);
					int i = statement.executeUpdate();
					if(i > 0) {
						return true;
					}
					else {
						return false;
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					return false;
				}
				
				
			}
			return false;
		}
		public static boolean addProduct(String name, String type, String category, String rating, String price, String stock, String image) {
			Connection conn = getConnection();
			if(conn != null) {
				PreparedStatement statement;
				try {
					statement = conn.prepareStatement(Constants.addCategory);
					statement.setString(1,name);
					statement.setString(2,type);
					statement.setString(3, category);
					statement.setString(4,rating);
					statement.setString(5, price);
					statement.setString(6, stock);
					statement.setString(7,image);
					int i = statement.executeUpdate();
					if(i>0) {
						System.out.println("Data Entered Successfully");
						return true;
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					return false;
				}
				
			}
			
			
			return false;
			
		}
		public static boolean deleteItem(int id) {
			Connection conn = getConnection();
			boolean cartSuccess = DbConnection.deleteCartItemAdmin(id);
			boolean purchaseSuccess = DbConnection.deletePurchaseItemAdmin(id);
			if(conn != null) {
				try {
					PreparedStatement statement = conn.prepareStatement(Constants.deleteItem);
					statement.setInt(1, id);
					int i = statement.executeUpdate();
					if(i>0) {
						return true;
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					return false;
				}
				
			}
			return false;
		}
		
		public static boolean deleteCartItemAdmin(int id) {
			Connection conn = getConnection();
			if(conn != null) {
				PreparedStatement statement;
				try {
					statement = conn.prepareStatement(Constants.deleteCartItem);
					statement.setInt(1, id);
					int i = statement.executeUpdate();
					if(i>0) {
						return true;
					}else {
						return false;
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					return false;
				}
				
				
			}
			return false;
		}
		
		public static boolean deletePurchaseItemAdmin(int id) {
			Connection conn = getConnection();
			if(conn != null) {
				PreparedStatement statement;
				try {
					statement = conn.prepareStatement(Constants.deletePurchaseItem);
					statement.setInt(1, id);
					int i = statement.executeUpdate();
					if(i>0) {
						return true;
					}else {
						return false;
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					return false;
				}
				
				
			}
			return false;
		}
		
		
		public static boolean editItemProduct(int id, String name, String type, String category, int rating, int price, int stock, String image) {
			Connection conn = getConnection();
			if(conn != null) {
				try {
					PreparedStatement statement = conn.prepareStatement(Constants.updateItem);
					statement.setString(1,name );
					statement.setString(2,type );
					statement.setString(3, category );
					statement.setInt(4,rating );
					statement.setInt(5,price );
					statement.setInt(6,stock );
					statement.setString(7,image);
					statement.setInt(8,id);
					int i = statement.executeUpdate();
					if(i > 0) {
						return true;
					}
					else {
						return false;
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					return false;
				}
				
			}
			
			return false;
		}
		
		public static boolean editItemProductImage(int id, String name, String type, String category, int rating, int price, int stock) {
			Connection conn = getConnection();
			if(conn != null) {
				try {
					PreparedStatement statement = conn.prepareStatement(Constants.updateItemPhoto);
					statement.setString(1,name );
					statement.setString(2,type );
					statement.setString(3, category );
					statement.setInt(4,rating );
					statement.setInt(5,price );
					statement.setInt(6,stock );
					statement.setInt(7,id);
					int i = statement.executeUpdate();
					if(i > 0) {
						return true;
					}
					else {
						return false;
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					return false;
				}
				
			}
			
			return false;
		}
		
		public static boolean addRole(int id) {
			Connection conn = getConnection();
			if(conn != null) {
				try {
					PreparedStatement statement = conn.prepareStatement(Constants.addRole);
					statement.setInt(1, id);
					int i = statement.executeUpdate();
					if(i>0) {
						return true;
					}
					} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					return false;
				}
			}
			return false;
		}
		
		
		public static boolean removeRole(int id) {
			Connection conn = getConnection();
			if(conn != null) {
				try {
					PreparedStatement statement = conn.prepareStatement(Constants.removeRole);
					statement.setInt(1, id);
					int i = statement.executeUpdate();
					if(i>0) {
						return true;
					}
					} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					return false;
				}
			}
			return false;
		}
		
		public static boolean deleteUser(int id) {
			Connection conn = getConnection();
			if(conn != null) {
				
					try {
						PreparedStatement statement = conn.prepareStatement(Constants.removeUser);
						statement.setInt(1, id);
						int i = statement.executeUpdate();
						if(i>0) {
							return true;
						}
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
						return false;
					}
					return false;
					
				
			}
			return false;
		}
		
		public static boolean updateUser(int id, String name, String address,  String password, String image) throws Exception {
			Connection conn = getConnection();
			if(conn != null) {
				try {
					PreparedStatement statement = conn.prepareStatement(Constants.editUser);
					statement.setString(1, name);
					statement.setString(2, address);
					statement.setString(3, Constants.encrypt(password, "my-secret-key-is"));
					statement.setString(4, image);
					statement.setInt(5, id);
					int i = statement.executeUpdate();
					if(i > 0) {
						return true;
					}
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					return false;
				}
				return false;
				
			}
			return false;
		}
		
		
		public static boolean updateUserPhoto(int id, String name, String address,  String password) throws Exception {
			Connection conn = getConnection();
			if(conn != null) {
				try {
					PreparedStatement statement = conn.prepareStatement(Constants.editUserPhoto);
					statement.setString(1, name);
					statement.setString(2, address);
					statement.setString(3, Constants.encrypt(password, "my-secret-key-is"));
					statement.setInt(4, id);
					int i = statement.executeUpdate();
					if(i > 0) {
						return true;
					}
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					return false;
				}
				return false;
				
			}
			return false;
		}
}
