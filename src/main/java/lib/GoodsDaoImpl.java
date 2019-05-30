package lib;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class GoodsDaoImpl implements GoodsDao{
	HibernateTemplate template;
	SessionFactory sessionFactory;
	@Autowired
	public GoodsDaoImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
		template = new HibernateTemplate(sessionFactory);
	}
	public void save(Goods good) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		session.save(good);
		tx.commit();
		session.close();
	}

	public Goods findById(String goods_name) {
		return template.get(Goods.class, goods_name);
	}

	public int Update(Goods oldGood,Goods newGood) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
//		session.update(good);
		String hql = "update Goods g set g.goods_name='"+newGood.getGoods_name()+"',g.value='"
				+newGood.getValue()+"',g.src='"+newGood.getSrc()+"' where g.goods_name='"+oldGood.getGoods_name()+"'";
		Query query = session.createQuery(hql);
		int res = query.executeUpdate();
		tx.commit();
		session.close();
		return res;
	}

	public void Delete(Goods good) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		session.delete(good);
		tx.commit();
		session.close();
	}
	public List<Goods> findByHql(String hql) {
		return (List<Goods>)template.find(hql);
	}

}
