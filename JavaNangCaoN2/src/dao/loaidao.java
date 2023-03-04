package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.loaibean;

public class loaidao {
	public ArrayList<loaibean> getloai() {
		try {
			ArrayList<loaibean> dsloai = new ArrayList<loaibean>();
			// b1 : ket noi csdl
			CoSodao cs = new CoSodao();
			cs.KetNoi();
			// b2: Lay du lieu ve
			String sql = "select * from loai";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			ResultSet rs = cmd.executeQuery();
			while (rs.next()) {
				String maloai = rs.getString("maloai");
				String tenloai = rs.getString("tenloai");
				dsloai.add(new loaibean(maloai, tenloai));
			}
			// b3: Dong rs va cn
			rs.close();
			cs.cn.close();
			return dsloai;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public int addLoai(String ml, String tl) {
		try {
			// B1: kết nối csdl
			CoSodao cs = new CoSodao();
			cs.KetNoi();
			String sql = "insert into loai values (?, ?)";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			cmd.setString(1, ml);
			cmd.setString(2, tl);
			int rs = cmd.executeUpdate();
			cs.cn.close();
			return rs;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	public int editLoai(String mlm, String tlm, String ml) {
		try {
			CoSodao cs = new CoSodao();
			cs.KetNoi();
			String sql = "update loai set maloai = ?, tenloai = ? where maloai = ?";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			cmd.setString(1, mlm);
			cmd.setString(2, tlm);
			cmd.setString(3, ml);
			int rs = cmd.executeUpdate();
			cs.cn.close();
			return rs;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	public int deleteLoai(String dltml) {
		try {
			CoSodao cs = new CoSodao();
			cs.KetNoi();
			String sql = "delete from loai where maloai = ?";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			cmd.setString(1, dltml);
			int rs = cmd.executeUpdate();
			cs.cn.close();
			return rs;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	public String getTenLoai(String ml) {
		try {
			CoSodao cs = new CoSodao();
			cs.KetNoi();
			String sql = "select tenloai from loai where maloai = ?";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			cmd.setString(1, ml);
			ResultSet rs = cmd.executeQuery();
			while (rs.next())
				return rs.getString(1);
			rs.close();
			cs.cn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}