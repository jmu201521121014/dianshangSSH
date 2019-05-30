package lib;

import javax.persistence.*;

@Entity
@Table(name="cart",catalog="test")
public class Cart {
	@Id
	@Column(name="username")
	private String username;
	@Column(name="goodname")
	private String goodname;
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getGoodname() {
		return goodname;
	}
	public void setGoodname(String goodname) {
		this.goodname = goodname;
	}
	
}
