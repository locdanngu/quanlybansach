package bean;

import java.sql.Date;

public class lichsubean {

	private int makh;
	private String masach;
	private long soluong;
	private Date ngaymua;
	private String anh;
	private String tensach;
	private long gia;
	public lichsubean() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public lichsubean(int makh, String masach, long soluong, Date ngaymua, String anh, String tensach, long gia) {
		super();
		this.makh = makh;
		this.masach = masach;
		this.soluong = soluong;
		this.ngaymua = ngaymua;
		this.anh = anh;
		this.tensach = tensach;
		this.gia = gia;
	}

	public int getMakh() {
		return makh;
	}
	public void setMakh(int makh) {
		this.makh = makh;
	}
	public String getMasach() {
		return masach;
	}
	public void setMasach(String masach) {
		this.masach = masach;
	}
	public long getSoluong() {
		return soluong;
	}
	public void setSoluong(long soluong) {
		this.soluong = soluong;
	}
	public Date getNgaymua() {
		return ngaymua;
	}
	public void setNgaymua(Date ngaymua) {
		this.ngaymua = ngaymua;
	}

	public String getAnh() {
		return anh;
	}

	public String getTensach() {
		return tensach;
	}

	public long getGia() {
		return gia;
	}
	
	
}
