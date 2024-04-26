package model;

import java.io.Serializable;
public class UserModel implements Serializable{
	
	
	
	private static final long serialVersRionUID= 1L;
	private String name;
	private String email;
	private String gender;
	private String phoneNumber;
	private String password;
	private String address;
	private String userrole;
	
	public UserModel(String name, String email,String gender,String phoneNumber,String password,String address, String userrole) {
		this.name=name;
		this.email=email;
		this.gender=gender;
		this.phoneNumber= phoneNumber;
		this.password=password;
		this.address=address;
		this.userrole=userrole;
		
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name){
		this.name=name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email=email;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender=gender;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber=phoneNumber;
	
	}public String getPassword() {
		return password;
	}
	public void setPassword(String password)
	{
		this.password=password;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address=address;
	}
	public String getUserRole() {
		return userrole;
	}
	public void setUserRole(String address) {
		this.userrole=userrole;
	}
}