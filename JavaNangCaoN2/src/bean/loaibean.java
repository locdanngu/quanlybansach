package bean;

public class loaibean {
	private String maloai;
	private String tenloai;
	
	public loaibean() {
	}
	public loaibean(String maloai, String tenloai) {
		this.maloai = maloai;
		this.tenloai = tenloai;
	}
	public String getMaloai() {
		return maloai;
	}
	public void setMaloai(String maloai) {
		this.maloai = maloai;
	}
	public String getTenloai() {
		return tenloai;
	}
	public void setTenloai(String tenloai) {
		this.tenloai = tenloai;
	}
	
	
}
