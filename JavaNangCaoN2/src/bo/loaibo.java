package bo;

import dao.loaidao;

import java.util.ArrayList;

import bean.loaibean;
import bean.sachbean;
public class loaibo {
	loaidao ldao= new loaidao();
	ArrayList<loaibean> ds;
	public ArrayList<loaibean> getloai(){
		ds = ldao.getloai();
		return ds;
	}
	public void addLoai(String ml, String tl) {
		ldao.addLoai(ml, tl);
	}
	
	public void editLoai(String mlm, String tlm, String ml) {
		ldao.editLoai(mlm, tlm, ml);
	}
	
	public void deleteLoai(String ml) {
		ldao.deleteLoai(ml);
	}
	
	public String getTenLoai(String ml) {
		return ldao.getTenLoai(ml);
	}
	
	public ArrayList<loaibean> Tim(String key) {
		ArrayList<loaibean> tam = new ArrayList<loaibean>();
		for (loaibean l : ds)
			if (l.getMaloai().toLowerCase().trim().contains(key.toLowerCase().trim())
					/* || x.getNgaynhap().toLowerCase().trim().contains(key.toLowerCase().trim()) */
					|| l.getTenloai().toLowerCase().trim().contains(key.toLowerCase().trim()))
				tam.add(l);
		return tam;
	}
}