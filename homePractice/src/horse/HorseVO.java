package horse;

import javafx.beans.property.SimpleDoubleProperty;
import javafx.beans.property.SimpleStringProperty;

public class HorseVO {

	private SimpleStringProperty horseName = new SimpleStringProperty();
	private SimpleDoubleProperty rate = new SimpleDoubleProperty();
	
	public String getHorseName(){
		return horseName.get();
	}
	
	public void setHorseName(String name){
		this.horseName.set(name);
	}
	
	public SimpleStringProperty horseName(){
		return horseName;
	}
	
	public Double getRate(){
		return rate.get();
	}
	
	public void setRate(double number){
		this.rate.set(number);
	}
	
	public SimpleDoubleProperty rate(){
		return rate;
	}
	
	
}