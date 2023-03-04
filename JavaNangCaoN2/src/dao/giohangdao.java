package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class giohangdao {
	public int checkSach(String masach) {
		try {
			// B1: kết nối csdl
			CoSodao cs = new CoSodao();
			cs.KetNoi();
			String sql = "select count(*) from GioHang where masach = ?";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			cmd.setString(1, masach);
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
	public void addSach(String masach, String tensach, long gia, String anh, long soluong) {
		try {
			CoSodao cs = new CoSodao();
			cs.KetNoi();
			String sql = "insert into GioHang values (?, ?, ?, ?, ?, ?)";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			cmd.setString(1, masach);
			cmd.setString(2, tensach);
			cmd.setLong(3, gia);
			cmd.setLong(4, gia*soluong);
			cmd.setString(5, anh);
			cmd.setLong(6, soluong);
			ResultSet rs = cmd.executeQuery();
			rs.close();
			cs.cn.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void updateSach(String maSach, long gia, long soLuong) {
		try {
			CoSodao cs = new CoSodao();
			cs.KetNoi();
			String sql = "update GioHang set thanhtien = ?, soluong = ?  where masach = ?";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			cmd.setLong(1, gia*soLuong);
			cmd.setLong(2, soLuong);
			cmd.setString(3, maSach);
			ResultSet rs = cmd.executeQuery();
			rs.close();
			cs.cn.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
}
