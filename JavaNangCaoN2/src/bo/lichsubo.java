
package bo;

import java.util.ArrayList;

import bean.chitiethoadonbean;
import dao.lichsudao;

public class lichsubo {

	lichsudao ls = new lichsudao();

	public ArrayList<chitiethoadonbean> getChiTietHoaDon(int makh) {
		return ls.getChiTietHoaDon(makh);
	}
	
	
}
