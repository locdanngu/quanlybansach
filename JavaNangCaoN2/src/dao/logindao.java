package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.dangnhapbean;

public class logindao {

	public int getTaiKhoan(String tendn, String pass){
		try {
			// B1: kết nối csdl
			CoSodao cs = new CoSodao();
			cs.KetNoi();
			String sql = "select count(*) from DangNhap where TenDangNhap = ? and MatKhau = ? and Quyen='True'";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			cmd.setString(1, tendn);
			cmd.setString(2, pass);
			ResultSet rs = cmd.executeQuery();
			// B3: Duyệt qua tập dữ liệu lấy về
			while (rs.next()) {
				return rs.getInt(1);
			}

			// B4: Đóng rs và cn
			rs.close();
			cs.cn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	public String getmakh(String tenkh){
		try {
			// B1: kết nối csdl
			CoSodao cs = new CoSodao();
			cs.KetNoi();
			String sql = "select makh from KhachHang where hoten = ?";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			cmd.setString(1, tenkh);
			ResultSet rs = cmd.executeQuery();
			// B3: Duyệt qua tập dữ liệu lấy về
			while (rs.next()) {
				return rs.getString(1);
			}

			// B4: Đóng rs và cn
			rs.close();
			cs.cn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
