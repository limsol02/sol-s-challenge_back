package backendweb.z01_vo;

// backendweb.z01_vo.BSPlayer

public class BSPlayer {
	private String player;
	private double gameCnt;
	private double hitCnt;
	public BSPlayer() {
		// TODO Auto-generated constructor stub
	}
	public BSPlayer(String player, double gameCnt, double hitCnt) {
		this.player = player;
		this.gameCnt = gameCnt;
		this.hitCnt = hitCnt;
	}
	public String getPlayer() {
		return player;
	}
	public void setPlayer(String player) {
		this.player = player;
	}
	public double getGameCnt() {
		return gameCnt;
	}
	public void setGameCnt(double gameCnt) {
		this.gameCnt = gameCnt;
	}
	public double getHitCnt() {
		return hitCnt;
	}
	public void setHitCnt(double hitCnt) {
		this.hitCnt = hitCnt;
	}
	public double getHitAgv() {
		return gameCnt==0?0:hitCnt/gameCnt;
	}
}
