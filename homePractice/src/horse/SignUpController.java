package horse;

import java.io.IOException;

import javafx.fxml.FXML;
import javafx.scene.control.TextField;
import javafx.stage.Stage;

public class SignUpController {
	
	private UserDAO dao = new UserDAO();
    private Stage dialogStage;
    
    public void setDialogStage(Stage dialogStage) {
		this.dialogStage = dialogStage;
	}

	@FXML
	private TextField idField;
	@FXML
	private TextField pwField;
	@FXML
	private TextField nameField;
	@FXML
	public void join() throws Exception{
		dao.join(idField.getText(), pwField.getText(), nameField.getText());
        dialogStage.close();
	}
	
	@FXML
	public void cancle() throws IOException {
		dialogStage.close();
	}
}