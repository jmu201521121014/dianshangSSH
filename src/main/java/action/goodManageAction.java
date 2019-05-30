package action;

import java.util.*;

import org.hibernate.loader.plan.exec.process.spi.ReturnReader;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import lib.Goods;
import lib.GoodsDao;
/*管理员对商品进行增加，删除，修改操作的action*/
public class goodManageAction extends ActionSupport {
	@Autowired
	GoodsDao goodsDao;
	public GoodsDao getGoodsDao() {
		return goodsDao;
	}
	public void setGoodsDao(GoodsDao goodsDao) {
		this.goodsDao = goodsDao;
	}
	
	private String newGoodname,newsrc;
	private double newGoodprice;
	public String getNewGoodname() {
		return newGoodname;
	}
	public void setNewGoodname(String newGoodname) {
		this.newGoodname = newGoodname;
	}
	public double getNewGoodprice() {
		return newGoodprice;
	}
	public void setNewGoodprice(double newGoodprice) {
		this.newGoodprice = newGoodprice;
	}
	public String getNewsrc() {
		return newsrc;
	}
	public void setNewsrc(String newsrc) {
		this.newsrc = newsrc;
	}
	public String execute(){
		return "res";
	}
	
	public String goodInsert() {
		Map<String, Object> session = ActionContext.getContext().getSession();
		//System.out.println(newGoodname+" "+newGoodprice+" "+newsrc);
		Goods good = new Goods();
		
		//将图片路径img/前的所有路径去掉
		int index = 0;
		//查找newsrc中img的索引
		index = newsrc.indexOf("img");
		if(index == -1){
			session.put("goodManageRes", "fail");
			return "res";
		}
		//img/共四个字符，下标index+4
		index = index + 4;
		//通过subString得到相对路径
		newsrc = newsrc.substring(index);
		good.setGoods_name(newGoodname);
		good.setValue(newGoodprice);
		good.setSrc(newsrc);
		//System.out.println(newsrc);
		//将新增商品存入数据库
		goodsDao.save(good);
		//从session中取出商品列表
		List<Goods> GoodList = (List<Goods>)session.get("GoodList");
		//将新增商品放入所有商品列表中
		GoodList.add(good);
		//将所有商品列表GoodList放回session中
		session.put("GoodList", GoodList);
		//增加操作结果放入session中
		session.put("goodManageRes", "success");
		return "res";
	}
	
	public String goodUpdate() {
		//获取session
		Map<String, Object> session = ActionContext.getContext().getSession();
		//获取所有商品信息
		List<Goods> GoodList = (List<Goods>)session.get("GoodList");
		//获取要修改的商品的信息
		Goods oldgood = (Goods)session.get("oldgood");
		if(oldgood == null) {
			session.put("goodManageRes", "fail");
			return "res";
		}
		System.out.println(oldgood.getGoods_name()+","+oldgood.getValue()+","+oldgood.getSrc());
		
		Goods newgood = new Goods();
		//将图片路径img/前的所有路径去掉
		int index = 0;
		//查找newsrc中img的索引
		index = newsrc.indexOf("img");
		if(index == -1){
			session.put("goodManageRes", "fail");
			return "res";
		}
		//img/共四个字符，下标index+4
		index = index + 4;
		//通过subString得到相对路径
		newsrc = newsrc.substring(index);
		newgood.setGoods_name(newGoodname);
		newgood.setValue(newGoodprice);
		newgood.setSrc(newsrc);
		System.out.println(newGoodname+","+newGoodprice+","+newsrc);
		//修改数据库中商品信息
		int res = goodsDao.Update(oldgood, newgood);
		System.out.println(res);
		if(res == 0) {
			//若修改失败
			session.put("goodManageRes", "fail");
			return "res";
		}
		//修改session中商品信息
		for(int i = 0;i < GoodList.size();i++) {
			if(GoodList.get(i).getGoods_name().compareTo(oldgood.getGoods_name()) == 0) {
				GoodList.remove(i);
				GoodList.add(newgood);
				break;
			}
		}
		//重新放回session中
		session.put("GoodList", GoodList);
		session.put("goodManageRes", "success");
		return "res";
	}
	
	public String goodDelete() {
		//获取session
		Map<String, Object> session = ActionContext.getContext().getSession();
		//获取所有商品信息
		List<Goods> GoodList = (List<Goods>)session.get("GoodList");
		//获取要修改的商品的商品名
		String oldgoodname = (String)session.get("oldgoodname");
		//获取要修改的商品的所有信息
		Goods oldGood = (Goods)goodsDao.findById(oldgoodname);
		System.out.println(oldGood.getGoods_name());
		//将该商品从数据库中删除
		goodsDao.Delete(oldGood);
		//将该商品从商品列表中删除
		for(int i = 0;i < GoodList.size();i++) {
			if(GoodList.get(i).getGoods_name().compareTo(oldgoodname) == 0) {
				GoodList.remove(i);
				break;
			}
		}
		session.put("goodManageRes", "success");
		return "res";
	}
}
