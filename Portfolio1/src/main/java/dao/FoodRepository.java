package dao;
import java.util.ArrayList;
import dto.Food;
public class FoodRepository 
{
	private ArrayList<Food> FoodList = new ArrayList<Food>();
	private static FoodRepository instance = new FoodRepository();
	public static FoodRepository getInstance()
	{
		return instance;
	}
	
	public void addFood(Food food)
	{
		FoodList.add(food);
	}
	public FoodRepository()//기본값으로 넣을게 있으면 넣고 아니면 일단 빼고
	{
		
	}
	
	public ArrayList<Food> getAllFoods()
	{
		return FoodList;
	}
	/*
	 * public Food getFoodById(String foodname) { return a; }
	 */
}
