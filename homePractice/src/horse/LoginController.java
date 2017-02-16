package horse;

import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.TextField;
import javafx.stage.Modality;
import javafx.stage.Stage;

public class LoginController {

	private UserDAO dao = new UserDAO();

	@FXML
	private TextField idField;

	@FXML
	private TextField pwField;
		
	@FXML
	public void login() throws Exception {
		String id = idField.getText();
		String pwd = pwField.getText();
		dao.login(id, pwd);
	}

	@FXML
	public void join() throws Exception {
		FXMLLoader loader = new FXMLLoader();
		loader.setLocation(this.getClass().getResource("SignUp.fxml"));
		Parent page = loader.load();
		Scene scene = new Scene(page);

		Stage dialogStage = new Stage();
		dialogStage.setTitle("회원 등록");
		dialogStage.initModality(Modality.WINDOW_MODAL);
		dialogStage.setScene(scene);

		SignUpController controller = loader.getController();
		controller.setDialogStage(dialogStage);

		dialogStage.showAndWait();
	}
}