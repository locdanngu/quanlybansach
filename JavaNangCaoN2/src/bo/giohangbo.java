package bo;

import java.util.ArrayList;

import bean.giohangbean;
import dao.giohangdao;

public class giohangbo {

	public ArrayList<giohangbean> ds = new ArrayList<giohangbean>();
	public void Them(String maSach, String tenSach, long soluong, long gia, String anh) {
		for(giohangbean g : ds) {
			if(g.getMasach().equals(maSach)) {
				g.setSoluong(soluong+g.getSoluong());
				return;
			}
		}
		ds.add(new giohangbean(maSach, tenSach, soluong, gia, anh));
	}
	
	public long TongTien() {
		long tongtien=0;
		for(giohangbean g : ds) {
			tongtien += g.getThanhtien();
		}
		return tongtien;
	}
	
	public void SuaSoLuong(String maSach, long soluong) {
//		for(giohangbean g : ds) {
//			if(g.getMasach().equals(maSach) && g.getSoluong()!=soluong)
//				g.setSoluong(soluong);
//			if(soluong==0)
//				Xoa(maSach);
//		}
		
		for (int i = 0; i < ds.size(); i++) {
			if(ds.get(i).getMasach().equals(maSach) && ds.get(i).getSoluong()!=soluong)
				ds.get(i).setSoluong(soluong);
			if(soluong<=0)
				Xoa(maSach);
		}
	}
	
	public void Xoa(String maSach) {
		for (int i = 0; i < ds.size(); i++) {
			if (ds.get(i).getMasach().equals(maSach)) {
				ds.remove(i);
			}
		}
	}
	
	public void XoaAll() {
		ds.removeAll(ds);
	}
	public void addSach(String masach, String tensach, long gia, String anh, long soluong) {
		giohangdao gh= new giohangdao();
				gh.addSach(masach, tensach, gia, anh, soluong);
	}
	
}
