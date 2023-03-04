package bo;

import java.sql.Date;
import java.util.ArrayList;

import bean.sachbean;

import dao.sachdao;


public class sachbo {

	sachdao sdao = new sachdao();
	
	ArrayList<sachbean> ds;
	public ArrayList<sachbean> getsach(){
		ds = sdao.getsach();
		return ds;
	}
	
	public ArrayList<sachbean> Tim(String key) {
		ArrayList<sachbean> tam = new ArrayList<sachbean>();
		for (sachbean s : ds)
			if (s.getTensach().toLowerCase().trim().contains(key.toLowerCase().trim())
					/* || x.getNgaynhap().toLowerCase().trim().contains(key.toLowerCase().trim()) */
					|| s.getMaloai().toLowerCase().trim().contains(key.toLowerCase().trim())
					|| s.getMasach().toLowerCase().trim().contains(key.toLowerCase().trim()))
				tam.add(s);
		return tam;
	}
	
	public void deleteSach(String ms) {
		sdao.deleteSach(ms);
	}
	
	
	public int getTotalBook() {
		return sdao.getTotalBooks();
	}
	
	public int countBooksByMaLoai(String ml) {
		return sdao.countBooksByMaLoai(ml);
	}
	
	public int countBooksBySearchValue(String giaTriTimKiem) {
		return sdao.countBooksBySearchValue(giaTriTimKiem);
	}
	
	public ArrayList<sachbean> pagingBooksByMaSach(int offset, String ml){
		return sdao.pagingBooksByMaSach(offset, ml);
	}
	
	public ArrayList<sachbean> pagingBooksBySearchValue(int offset, String giaTriTimKiem){
		return sdao.pagingBooksBySearchValue(offset, giaTriTimKiem);
	}
	
	public ArrayList<sachbean> pagingBooks(int offset){
		return sdao.pagingBooks(offset);
	}
	public void addSach(String ms, String ts, long sl, long g, String ml, int st, String anh, Date nn, String tg ){
		sdao.addSach(ms, ts, sl, g, ml, st, anh, nn, tg);
	}
	
	public void editSach(String msm, String tsm, long slm, long gm, String mlm, int stm,String anhm, Date nnm, String tgm, String ms) {
		sdao.editSach(msm, tsm, slm, gm, mlm, stm, anhm, nnm, tgm, ms);
	}
}
