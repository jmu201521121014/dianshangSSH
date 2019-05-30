package lib;

import java.util.List;

public interface CartDao {
	public void save(Cart cart);
	public List<Cart> findById(String username,String goods_name);
	public void Update(Cart oldCart,Cart newCart);
	public void Delete(Cart cart);
	public List<Cart> findByHql(String hql);
	public List<String> findByUsername(String username);
}
