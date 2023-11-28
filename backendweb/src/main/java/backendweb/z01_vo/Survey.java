package backendweb.z01_vo;

public class Survey {
	//조사자명과 선호하는 음식 종류, 평점
	private String name;
	private String food;
	private double grade;
	public Survey() {
		// TODO Auto-generated constructor stub
	}
	public Survey(String name, String food, double grade) {
		this.name = name;
		this.food = food;
		this.grade = grade;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getFood() {
		return food;
	}
	public void setFood(String food) {
		this.food = food;
	}
	public double getGrade() {
		return grade;
	}
	public void setGrade(double grade) {
		this.grade = grade;
	}
	

}
