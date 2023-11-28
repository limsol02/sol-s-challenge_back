package backendweb.z01_vo;

public class GusetBook {
	private String name;
	private int money;
	private String text;
	public GusetBook() {
		// TODO Auto-generated constructor stub
	}
	public GusetBook(String name, int money, String text) {
		this.name = name;
		this.money = money;
		this.text = text;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getMoney() {
		return money;
	}
	public void setMoney(int money) {
		this.money = money;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	
}
