package backendweb.z01_vo;

public class Food {
	private String fname;
	private int cnt;
	private int price;
	public Food() {
		// TODO Auto-generated constructor stub
	}
	public Food(String fname, int cnt, int price) {
		this.fname = fname;
		this.cnt = cnt;
		this.price = price;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
}
