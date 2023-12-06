package backendweb.z01_vo;

public class User {
	private String name;
	private String id;
	private String email;
	public User() {
		// TODO Auto-generated constructor stub
	}
	public User(String name, String id, String email) {
		this.name = name;
		this.id = id;
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
}
