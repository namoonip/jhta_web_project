package horse;

import javafx.beans.property.SimpleIntegerProperty;
import javafx.beans.property.SimpleStringProperty;

public class HorseStatus {

	private SimpleStringProperty horseName = new SimpleStringProperty();
	private SimpleIntegerProperty firstforce = new SimpleIntegerProperty();
	private SimpleIntegerProperty pushforce = new SimpleIntegerProperty();
	private SimpleIntegerProperty speed = new SimpleIntegerProperty();
	
	public String getHorseName(){
		return horseName.get();
	}
	
	public void setHorseName(String name){
		this.horseName.set(name);
	}
	
	public SimpleStringProperty horseName(){
		return horseName;
	}
	
	public Integer getFirstforce(){
		return firstforce.get();
	}
	public void setFirstforce(int force1){
		this.firstforce.set(force1);
	}
	public SimpleIntegerProperty firstforce(){
		return firstforce;
	}
	
	public Integer getPushforce(){
		return pushforce.get();
	}
	public void setPushforce(int force2){
		this.pushforce.set(force2);
	}
	public SimpleIntegerProperty pushforce(){
		return pushforce;
	}
	
	public Integer getSpeed(){
		return speed.get();
	}
	public void setSpeed(int force3){
		this.speed.set(force3);
	}
	public SimpleIntegerProperty speed(){
		return speed;
	}
	
	
}