package bean;

public class lsbean {
	private int makh;
	private String tensach;
	private long soluong;
	private long gia;
	private boolean damua;
	
	public lsbean() {
		super();
	}
	public lsbean(int makh, String tensach, long soluong, long gia, boolean damua) {
		super();
		this.makh = makh;
		this.tensach = tensach;
		this.soluong = soluong;
		this.gia = gia;
		this.damua = damua;
	}
	public int getMakh() {
		return makh;
	}
	public void setMakh(int makh) {
		this.makh = makh;
	}
	public String getTensach() {
		return tensach;
	}
	public void setTensach(String tensach) {
		this.tensach = tensach;
	}
	public long getSoluong() {
		return soluong;
	}
	public void setSoluong(long soluong) {
		this.soluong = soluong;
	}
	public long getGia() {
		return gia;
	}
	public void setGia(long gia) {
		this.gia = gia;
	}
	public boolean isDamua() {
		return damua;
	}
	public void setDamua(boolean damua) {
		this.damua = damua;
	}
	
}
