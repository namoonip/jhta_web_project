package puzzle;

import java.awt.event.*;
import java.util.*;

import javafx.animation.*;
import javafx.application.*;
import javafx.geometry.*;
import javafx.scene.*;
import javafx.scene.layout.*;
import javafx.scene.paint.*;
import javafx.scene.shape.*;
import javafx.scene.text.*;
import javafx.stage.*;
import javafx.util.*;

public class MemoryPuzzle extends Application{
	
	private static final int NUM_OF_PAIRS = 8;
	private static final int NUM_PER_ROW = 4; 
	
	private Tile selected = null;
	private int clickCount = 2;
	
	private Parent createContent() {
		Pane root = new Pane();
		root.setPrefSize(250, 250);
		
		char c = 'A';
		List<Tile> tiles = new ArrayList<>();
		for ( int i=0; i<NUM_OF_PAIRS; i++) {
			// ½ÖÀ¸·Î Áõ°¡
			tiles.add(new Tile(String.valueOf(c)));
			tiles.add(new Tile(String.valueOf(c)));
			c++;
		}
		
		Collections.shuffle(tiles);
		
		for ( int i=0; i<tiles.size(); i++) {
			Tile tile = tiles.get(i);
			tile.setTranslateX(50 * (i % NUM_PER_ROW));
			tile.setTranslateY(50 * (i / NUM_PER_ROW));
			root.getChildren().add(tile);
		}
		
		return root;
	}
	
	
	public void start(Stage Stage) throws Exception {
		Stage.setScene(new Scene(createContent()));
		Stage.show();
		
	}
	
	private class Tile extends StackPane {
		private Text text = new Text();
		
		
		public Tile(String value) {
			Rectangle border = new Rectangle(50, 50);
			border.setFill(null);
			border.setStroke(Color.BLACK);
			
			text.setText(value);
			text.setFont(Font.font(30));
			
//			Text text = new Text(value);
//			text.setFont(Font.font(30));
			
			setAlignment(Pos.CENTER);
			getChildren().addAll(border, text);
			
			setOnMouseClicked(event -> {
				if(isOpen() || clickCount == 0)
					return;
				
				clickCount--;
				
				if (selected == null) {
					selected = this;
					open(() -> {});
				}
				else {
					open(() -> {
						if (!hasSameValue(selected)) {
							selected.close();
							this.close();
						}
						selected = null;
						clickCount = 2;
					});
				}			
			});
			
			close();
		}
		
		public boolean isOpen() {
			return text.getOpacity() == 1;
		}
		
		public void open(Runnable action) {
			FadeTransition ft = new FadeTransition(Duration.seconds(0.5), text);
			ft.setToValue(1);
			ft.setOnFinished(e -> action.run());
			ft.play();
		}
		
		public void close() {
			FadeTransition ft = new FadeTransition(Duration.seconds(0.5), text);
			ft.setToValue(0);
			ft.play();
		}
		
		public boolean hasSameValue(Tile other) {
			return text.getText().equals(other.text.getText());
		}
	}
	
	public static void main(String[] args) {
		launch(args);
	}
}
