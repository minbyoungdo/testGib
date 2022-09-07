package dto;
import java.io.Serializable;
public class Food implements Serializable
{
	private int number;
	private String name;
	private String address;
	private String kakaomap;
	private String phone;
	private String bestfood;
	private String foods;
	private float grade;
	private String filename;
	
	public Food()
	{
		super();
	}
	public Food(int number, String name)
	{
		this.name = name;
		this.number = number;
	}
	public int getNumber()
	{
		return number;
	}
	public String getName()
	{
		return name;
	}
	public String getAddress()
	{
		return address;
	}
	public String getKakaomap()
	{
		return kakaomap;
	}
	public String getPhone()
	{
		return phone;
	}
	public String getBestfood()
	{
		return bestfood;
	}
	public String getFoods()
	{
		return foods;
	}
	public float getGrade()
	{
		return grade;
	}
	public void setNumber(int number)
	{
		this.number = number;
	}
	public void setName(String name)
	{
		this.name = name;
	}
	public void setAddress(String address)
	{
		this.address = address;
	}
	public void setKakaomap(String kkomap)
	{
		this.kakaomap=kkomap;
	}
	public void setPhone(String phone)
	{
		this.phone =phone;
	}
	public void setBestfood(String bestfood)
	{
		this.bestfood=bestfood;
	}
	public void getFoods(String foods)
	{
		this.foods = foods;
	}
}
