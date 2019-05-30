package lib;

import java.util.List;


import org.hibernate.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class CartDaoImpl implements CartDao{
	HibernateTemplate template;
	SessionFactory sessionFactory;
	@Autowired
	public CartDaoImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
		template = new HibernateTemplate(sessionFactory);
	}
	public void save(Cart cart) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		session.save(cart);
		tx.commit();
		session.close();
	}

	public List<Cart> findById(String username, String goods_name) {
		String hql = "from Cart c where c.username=\'" + username + "\' and c.goodname=\'" + goods_name +"\'";
		return (List<Cart>)template.find(hql);
	}

	public void Update(Cart oldCart,Cart newCart) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		String hql ="update Cart c set c.goodname='"+newCart.getGoodname()+"' where c.username='"
				+oldCart.getUsername()+"' and c.goodname='"+oldCart.getGoodname()+"'";
		Query query = session.createQuery(hql);
		int res = query.executeUpdate();
		tx.commit();
		session.close();
	}

	public void Delete(Cart cart) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		String hql ="delete from Cart c where username='"+cart.getUsername()+
				"' and goodname='"+cart.getGoodname()+"'";
		Query query = session.createQuery(hql);
		int res = query.executeUpdate();
		tx.commit();
		session.close();
	}
	
	public List<Cart> findByHql(String hql) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		Query query = session.createQuery(hql);
		List<Cart> list = (List<Cart>)query.getResultList();
//		for(int i = 0;i< list.size();i++) {
//			System.out.println(i+":"+list.get(i).getGoodname());
//		}
		return list;
	}
	
	public List<String> findByUsername(String username) {
		Session session = sessionFactory.openSession();
		Transaction transaction = session.beginTransaction();
		/*Query query = session.createSQLQuery(sql);*/
		Query query = session.createSQLQuery("select goodname from cart where username='"+username+"'");
		List<String> list = (List<String>)query.getResultList();
//		for(int i = 0;i<list.size();i++) {
//			System.out.println(list.get(i));
//		}
		return list;
	}
}
