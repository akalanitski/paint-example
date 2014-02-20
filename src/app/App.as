/**
 * Created by cfe on 11.12.13.
 */
package app {
import app.appMvc.AppFacade;
import app.appMvc.Notes;

import flash.display.Sprite;
import flash.display.StageScaleMode;

public class App extends Sprite {
    public function App(){
        stage.scaleMode = StageScaleMode.NO_SCALE;
        S._stage = this.stage;

        AppFacade.getInstance().sendNotification(Notes.STARTUP, this.stage);
    }
}
}