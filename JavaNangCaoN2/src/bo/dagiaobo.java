package bo;

import java.util.ArrayList;

import bean.dagiaobean;
import bean.xacnhanbean;
import dao.dagiaodao;
import dao.xacnhandao;

public class dagiaobo {
	dagiaodao dgdao= new dagiaodao();
	  public ArrayList<dagiaobean> getdanhsach(){
		return  dgdao.getdanhsach();
	  }
	  
	  
	  public void updateds(long mcthd) {
		  dgdao.updateds(mcthd);
	  }
}
