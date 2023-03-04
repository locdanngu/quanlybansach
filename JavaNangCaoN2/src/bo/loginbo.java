package bo;

import java.util.ArrayList;

import dao.khachhangdao;
import dao.logindao;

public class loginbo {
	logindao ldao = new logindao();
	public int getTaiKhoan(String tk, String mk){
		return ldao.getTaiKhoan(tk, mk);
	}
	khachhangdao khdao = new khachhangdao();
	public int checkKhachHang(String tk, String mk) {
		return khdao.checkKhachHang(tk, mk);
	}
}
