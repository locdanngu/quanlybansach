package bean;

public class khachhangbean {
	public String Makh;
	public String hoten;
	public String diachi;
	public String sodt;
	public String email;
	public String tendn;
	public String pass;
	public khachhangbean() {
		super();
	}
	public khachhangbean(String makh, String hoten, String diachi, String sodt, String email, String tendn,
			String pass) {
		super();
		Makh = makh;
		this.hoten = hoten;
		this.diachi = diachi;
		this.sodt = sodt;
		this.email = email;
		this.tendn = tendn;
		this.pass = pass;
	}
	public String getMakh() {
		return Makh;
	}
	public void setMakh(String makh) {
		Makh = makh;
	}
	public String getHoten() {
		return hoten;
	}
	public void setHoten(String hoten) {
		this.hoten = hoten;
	}
	public String getDiachi() {
		return diachi;
	}
	public void setDiachi(String diachi) {
		this.diachi = diachi;
	}
	public String getSodt() {
		return sodt;
	}
	public void setSodt(String sodt) {
		this.sodt = sodt;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTendn() {
		return tendn;
	}
	public void setTendn(String tendn) {
		this.tendn = tendn;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
}
