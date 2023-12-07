package backendweb.z01_vo;

public class Calcul {
	private int num01;
	private int num02;
	private int cal;
	
	
	public Calcul() {
		// TODO Auto-generated constructor stub
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


	public int getCal() {
		return cal;
	}


	public void setCal(int cal) {
		this.cal = cal;
	}


	public Calcul(int num01, int num02, int cal) {
		this.num01 = num01;
		this.num02 = num02;
		this.cal = cal;
	}


	public String getalStr() {
		String [] calS = {"+","-","/","*"};
		// jsp상 select value 값이 -1~3 까지 있으니까(-1은 전체보기) 0부터 3까지 배열에 맞춰 값 가져오기
		return calS[cal];
	}
	public int getTot() {
		int[] tot = {num01+num02,num01-num02,num01*num02,num02==0?0:num01/num02};
		return tot[cal];
	}

}
