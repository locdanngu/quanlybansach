package bo;

import dao.khachhangdao;

public class khachhangbo {
	khachhangdao khdao = new khachhangdao();
	public String getTenKhachHang(String tk, String mk) {
		return khdao.getTenKhachHang(tk, mk);
	}
	public int checkKhachHang(String tk, String mk) {
		return khdao.checkKhachHang(tk, mk);
	}
	public void addKhachHang(String hoTen, String diaChi, String sdt, String email, String tk, String mk) {
		khdao.addKhachHang(hoTen, diaChi, sdt, email, tk, mk);
	}
	public String getMaKhachHang(String un) {
		return khdao.getMaKhachHang(un);
	}
}
