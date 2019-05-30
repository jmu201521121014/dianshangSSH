package lib;

import javax.persistence.*;

@Entity
@Table(name="goods",catalog="test")
public class Goods {
	@Id
	@Column(name="goods_name")
	private String goods_name;
	@Column(name="value")
	private double value;
	@Column(name="src")
	private String src;
	public String getGoods_name() {
		return goods_name;
	}
	public void setGoods_name(String goods_name) {
		this.goods_name = goods_name;
	}
	public double getValue() {
		return value;
	}
	public void setValue(double value) {
		this.value = value;
	}
	public String getSrc() {
		return src;
	}
	public void setSrc(String src) {
		this.src = src;
	}
}
