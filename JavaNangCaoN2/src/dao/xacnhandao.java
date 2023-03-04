package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

import bean.lichsubean;
import bean.xacnhanbean;

public class xacnhandao {
    public ArrayList<xacnhanbean> getdanhsach(){
    	try {
    		//B1: Ket noi vao csdl
 		   CoSodao cs=new CoSodao();
 		   cs.KetNoi();
 		   //B2: Lay du lieu ve
 		  ArrayList<xacnhanbean> ds= new ArrayList<xacnhanbean>();
 		   String sql="select * from VXacNhan where damua='False' order by MaHoaDon ASC";
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
 			  ds.add(new xacnhanbean(MaChiTietHD, MaHoaDon, makh, hoten, tensach, soLuongMua, gia, thanhTien, ngayMua, damua));
 		   }
 		   //b4: Dong rs va cn
 		   rs.close();cs.cn.close();
 		   return ds;
		} catch (Exception e) {
			e.printStackTrace();return null;
		}
    }
    
    
    
    
}
