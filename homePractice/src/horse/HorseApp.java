package horse;

import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;

public class HorseApp extends Application {
	
//	private static HorseClient horseClient = new HorseClient();
//	@Override
//	public void init() throws Exception {
//		Thread t = new Thread() {
//			@Override
//			public void run() {
//				horseClient.startClient();	
//			}
//		};
//		t.start();
//	}
	
	@Override
	public void start(Stage primaryStage) {
		try {
	        FXMLLoader loader = new FXMLLoader();
	        loader.setLocation(this.getClass().getResource("Login.fxml"));
	        Parent rootLayout = loader.load();
	 
	        Scene scene = new Scene(rootLayout);
	 
	        primaryStage.setTitle("경마 게임!");
	        primaryStage.setScene(scene);
	        primaryStage.show();
	        
	        
			} catch (Exception e) {
				System.err.println(e.getMessage());
			}
	}

	public static void main(String[] args) {
		launch(args);
	}
}