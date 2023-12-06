package backendweb.z01_vo;
// backendweb.z01_vo.Calculator
public class Calculator {
	private int num01;
	private int num02;
	private String formula;
	public Calculator() {
		// TODO Auto-generated constructor stub
	}
	public Calculator(int num01, int num02, String formula) {
		this.num01 = num01;
		this.num02 = num02;
		this.formula = formula;
	}
	public int getNum01() {
		return num01;
	}
	public void setNum01(int num01) {
		this.num01 = num01;
	}
	public int getNum02() {
		return num02;
	}
	public void setNum02(int num02) {
		this.num02 = num02;
	}
	public String getFormula() {
		return formula;
	}
	public void setFormula(String formula) {
		this.formula = formula;
	}
	
}
