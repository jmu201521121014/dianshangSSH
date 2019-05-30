package lib;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class UserDaoImpl implements UserDao{
	private HibernateTemplate template;
	private SessionFactory sessionFactory;
	@Autowired
	public UserDaoImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
		template = new HibernateTemplate(sessionFactory);
	}
	
	public void save(User user) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		session.save(user);
		tx.commit();
		session.close();
	}

	public User findById(String username) {
		//System.out.println("FindByUsername:" + username);
		return template.get(User.class, username);
	}

	public void Update(User user) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		session.update(user);
		tx.commit();
		session.close();
	}

	public void Delete(User user) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		session.delete(user);
		tx.commit();
		session.close();
	}
	
	public List<User> findByHql(String hql) {
		return (List<User>)template.find(hql);
	}
}
