package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

import bean.dagiaobean;
import bean.xacnhanbean;

public class dagiaodao {
	public ArrayList<dagiaobean> getdanhsach(){
    	try {
    		//B1: Ket noi vao csdl
 		   CoSodao cs=new CoSodao();
 		   cs.KetNoi();
 		   //B2: Lay du lieu ve
 		  ArrayList<dagiaobean> ds= new ArrayList<dagiaobean>();
 		   String sql="SELECT dbo.KhachHang.makh, dbo.KhachHang.hoten, dbo.sach.tensach, dbo.ChiTietHoaDon.SoLuongMua, dbo.sach.gia, dbo.ChiTietHoaDon.SoLuongMua * dbo.sach.gia AS ThanhTien, dbo.hoadon.NgayMua, dbo.ChiTietHoaDon.damua, \r\n"
 		   		+ "                  dbo.ChiTietHoaDon.MaChiTietHD, dbo.hoadon.MaHoaDon\r\n"
 		   		+ "FROM     dbo.ChiTietHoaDon INNER JOIN\r\n"
 		   		+ "                  dbo.hoadon ON dbo.ChiTietHoaDon.MaHoaDon = dbo.hoadon.MaHoaDon INNER JOIN\r\n"
 		   		+ "                  dbo.KhachHang ON dbo.hoadon.makh = dbo.KhachHang.makh INNER JOIN\r\n"
 		   		+ "                  dbo.sach ON dbo.ChiTietHoaDon.MaSach = dbo.sach.masach\r\n"
 		   		+ "WHERE  (dbo.ChiTietHoaDon.damua = 1) order by MaChiTietHD ASC";
 		   PreparedStatement cmd= cs.cn.prepareStatement(sql);
 		   ResultSet rs=cmd.executeQuery();
 		   //B3: Duyet qua tap du lieu lay ve
 		   while(rs.next()) {
 			  
 			   long MaChiTietHD=rs.getLong("MaChiTietHD");
 	 		   long MaHoaDon=rs.getLong("MaHoaDon");
 			   long makh=rs.getLong("makh");
			  String hoten=rs.getString("hoten");; 
 			  String tensach=rs.getString("tensach");
 			  Date ngayMua=rs.getDate("NgayMua");
 			  long soLuongMua=rs.getLong("SoLuongMua");
 			  long gia=rs.getLong("gia");
 			  long thanhTien=rs.getLong("ThanhTien");
 			  boolean damua=rs.getBoolean("damua");
 			  ds.add(new dagiaobean(MaChiTietHD, MaHoaDon, makh, hoten, tensach, soLuongMua, gia, thanhTien, ngayMua, damua));
 		   }
 		   //b4: Dong rs va cn
 		   rs.close();cs.cn.close();
 		   return ds;
		} catch (Exception e) {
			e.printStackTrace();return null;
		}
    }
	
	public int updateds(long mcthd){
    	try {
    		//B1: Ket noi vao csdl
 		   CoSodao cs=new CoSodao();
 		   cs.KetNoi();
 		   //B2: Lay du lieu ve
 		  
 		   String sql="update Vxacnhan Set damua = 'True' where MaChiTietHD = ?";
 		   PreparedStatement cmd= cs.cn.prepareStatement(sql);
 		   cmd.setLong(1, mcthd);
 		   int rs=cmd.executeUpdate();
 		   //B3: Duyet qua tap du lieu lay ve
 		   
 		   //b4: Dong rs va cn
 		   cs.cn.close();
 		   return rs;
		} catch (Exception e) {
			e.printStackTrace();return 0;
		}
    }
}
