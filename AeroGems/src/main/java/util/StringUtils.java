package util;

public class StringUtils {

	public static final String INSERT_STUDENT = "INSERT INTO user"
			+ "(name, password, gender, email, address, phone)"
			+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
	
	public static final String GET_LOGIN_STUDENT_INFO = "SELECT * FROM user WHERE email = ?";
	public static final String GET_ALL_STUDENT_INFO = "SELECT * FROM user";
	public static final String GET_USERNAME = "SELECT COUNT(*) FROM user WHERE name = ?";
	public static final String GET_PHONE = "SELECT COUNT(*) FROM user WHERE phone = ?";
	public static final String GET_EMAIL = "SELECT COUNT(*) FROM user WHERE email = ?";
	
	
	// Start Parameter names
	
	public static final String EMAIL = "email";
	public static final String PHONE_NUMBER = "phone";
	public static final String ADDRESS = "address";
	public static final String PASSWORD = "password";
	public static final String RETYPE_PASSWORD = "retype-password";
	
	
	// Start messages FOR REGISTER
	public static final String SUCCESS_REGISTER_MESSAGE = "Successfully Registered";
	public static final String REGISTER_ERROR_MESSAGE = "Please correct the form data";
	public static final String SERVER_ERROR_MESSAGE = "An unexpected server error occured";
	public static final String SUCCESS_MESSAGE = "successMessage";
	public static final String ERROR_MESSAGE = "errorMessage";
	public static final String USERNAME_ERROR_MESSAGE = "Username is already registered.";
	public static final String EMAIL_ERROR_MESSAGE = "Email is already registered";
	public static final String PHONE_NUMBER_ERROR_MESSAGE = "Phone Number is already registered";
	public static final String PASSWORD_UNMATCHED_MESSAGE = "Password is not matched";
	//End Messages
	
	
	//Start messages FOR LOGIN
	public static final String SUCCESS_LOGIN_MESSAGE = "Successfully Logged in";
	public static final String LOGIN_ERROR_MESSAGE ="Please correct the login credentials";
	
	
	// Start JSP Route
	public static final String WELCOME_PAGE = "/pages/welcome.jsp";
	public static final String LOGIN_PAGE = "/pages/login.jsp";
	public static final String REGISTER_PAGE = "/pages/register.jsp";
	// End JSP Route
	
	
	// Start Servlet Route
	public static final String REGISTER_SERVLET = "/RegisterServlet";
	public static final String LOGIN_SERVLET = "/LoginServlet";
	// End Servlet Route
	
	
	public static final String USER = "user";
	public static final String JSESSIONID = "JSESSIONID";
	
	
	
	
	
	
	
}
	