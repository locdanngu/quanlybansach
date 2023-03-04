package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class khachhangdao {

	public int checkKhachHang(String tk, String mk) {
		try {
			// B1: kết nối csdl
			CoSodao cs = new CoSodao();
			cs.KetNoi();
			String sql = "select count(*) from KhachHang where tendn = ? and pass = ?";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			cmd.setString(1, tk);
			cmd.setString(2, mk);
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

	public String getTenKhachHang(String tk, String mk) {
		try {
			// B1: kết nối csdl
			CoSodao cs = new CoSodao();
			cs.KetNoi();
			String sql = "select hoten from KhachHang where tendn = ? and pass = ?";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			cmd.setString(1, tk);
			cmd.setString(2, mk);
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

	public void addKhachHang(String hoTen, String diaChi, String sdt, String email, String tk, String mk) {
		try {
			CoSodao cs = new CoSodao();
			cs.KetNoi();
			String sql = "insert into KhachHang values (?, ?, ?, ?, ?, ?)";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			cmd.setString(1, hoTen);
			cmd.setString(2, diaChi);
			cmd.setString(3, sdt);
			cmd.setString(4, email);
			cmd.setString(5, tk);
			cmd.setString(6, mk);
			ResultSet rs = cmd.executeQuery();
			rs.close();
			cs.cn.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	public String getMaKhachHang(String tdn) {
		try {
			CoSodao cs = new CoSodao();
			cs.KetNoi();
			String sql = "select makh from KhachHang\r\n"
					+ "where tendn = ?";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			cmd.setString(1, tdn);
			ResultSet rs = cmd.executeQuery();
			while(rs.next())
				return rs.getString(1);
			rs.close();
			cs.cn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}