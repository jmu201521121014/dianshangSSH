package lib;

import java.util.List;

public interface UserDao {
	public void save(User user);
	public User findById(String username);
	public void Update(User user);
	public void Delete(User user);
	public List<User> findByHql(String hql);
}
