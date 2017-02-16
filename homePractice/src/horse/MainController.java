package horse;


import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.stage.Modality;
import javafx.stage.Stage;

public class MainController {

	private UserDAO dao = new UserDAO();
	private String userId;
	void setUserIdByLogin(String userId) {
		this.userId = userId;
	}
	
	@FXML
	private TableView<HorseVO> horseTable;
	
	@FXML
	private TableView<HorseStatus> horseStatus;
	
	@FXML
	private TableColumn<HorseVO, String> horseNameColumn;
	
	@FXML
	private TableColumn<HorseVO, Number> horseRateColumn;
	
	@FXML
	private TableColumn<HorseStatus, Number> horseFirstForce;
	
	@FXML
	private TableColumn<HorseStatus, Number> horsePushForce;
	
	@FXML
	private TableColumn<HorseStatus, Number> horseSpeed;
	
	private ObservableList<HorseStatus> horseStatusData = FXCollections.observableArrayList();
	private ObservableList<HorseVO> horseData = FXCollections.observableArrayList();
	
	public void initialize()throws SQLException{
		horseNameColumn.setCellValueFactory(celldata -> celldata.getValue().horseName());
		horseRateColumn.setCellValueFactory(celldata -> celldata.getValue().rate());
		horseFirstForce.setCellValueFactory(celldata -> celldata.getValue().firstforce());
		horsePushForce.setCellValueFactory(celldata -> celldata.getValue().pushforce());
		horseSpeed.setCellValueFactory(celldata -> celldata.getValue().speed());
		
		ArrayList<HorseVO> horseList = dao.getAllHorse();
		horseData.addAll(horseList);
		horseTable.setItems(horseData);
		
		horseTable.getSelectionModel().selectedItemProperty().addListener((obserable, oldValue, newValue) -> {
			
			horseStatusData.clear();
			String hname = newValue.getHorseName();
			ArrayList<HorseStatus> horseStatusList = dao.getStatus(hname);
			horseStatusData.addAll(horseStatusList);
					
		});
		horseStatus.setItems(horseStatusData);
	}
	
	@FXML
	public void chargeButton() throws IOException{
		FXMLLoader loader = new FXMLLoader();
		loader.setLocation(this.getClass().getResource("Allocate.fxml"));
		Parent page = loader.load();
		
		Scene scene = new Scene(page);
		Stage dialogStage = new Stage();
		dialogStage.setTitle("배당하기");
		dialogStage.initModality(Modality.WINDOW_MODAL);
		dialogStage.setScene(scene);
		
		AllocateController allocateController = loader.getController();
		allocateController.setDialogStage(dialogStage);
		allocateController.setUserIdByLogin(userId);
		
		dialogStage.showAndWait();
	}
	
	
}