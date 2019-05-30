package lib;

import java.util.*;

public interface GoodsDao {
	public void save(Goods good);
	public Goods findById(String goods_name);
	public int Update(Goods oldGood,Goods newGood);
	public void Delete(Goods good);
	public List<Goods> findByHql(String hql);
}
