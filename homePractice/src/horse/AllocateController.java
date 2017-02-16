package horse;


import javafx.fxml.FXML;
import javafx.scene.control.*;
import javafx.stage.Stage;

public class AllocateController {
	
	public AllocateController() {	
	}
	
	private UserDAO dao = new UserDAO();
	private Stage dialogStage;
    
    public void setDialogStage(Stage dialogStage) {
		this.dialogStage = dialogStage;
	}
    private String userId;
    void setUserIdByLogin(String userId) {
    	this.userId = userId;
    }
	
	@FXML
	private TextField balanceField;
	
	@FXML
	private RadioButton rb1;
	
	@FXML
	private RadioButton rb2;
	
	@FXML
	private RadioButton rb3;
	
	@FXML
	private RadioButton rb4;
	
	@FXML
	private void initialize() {
		balanceField.setText(String.valueOf(dao.balanceCheck(userId)));
		System.out.println(balanceField.getText());
	}	
	@FXML
	public void charge() {
		ToggleGroup radioGroup = new ToggleGroup();
		rb1.setToggleGroup(radioGroup);
		rb2.setToggleGroup(radioGroup);
		rb3.setToggleGroup(radioGroup);
		rb4.setToggleGroup(radioGroup);
		RadioButton selectedRadioButton = (RadioButton) radioGroup.getSelectedToggle();
		System.out.println(userId);
		
		if(selectedRadioButton.getId().equals(rb1)) {
			dao.charge(1000, userId);			
		} else if(selectedRadioButton.getId().equals("rb2")) {
			dao.charge(5000, userId);			
		} else if(selectedRadioButton.getId().equals("rb3")) {
			dao.charge(10000, userId);			
		} else if(selectedRadioButton.getId().equals("rb4")) {
			dao.charge(50000, userId);
		}
		balanceField.setText(String.valueOf(dao.balanceCheck(userId)));
	}
	
	@FXML
	public void cancle() {
		dialogStage.close();
	}
}