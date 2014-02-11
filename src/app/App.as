/**
 * Created by cfe on 11.12.13.
 */
package app {
import app.appMvc.AppFacade;
import app.appMvc.Notes;

import flash.display.Sprite;

public class App extends Sprite {
    public function App(){
        AppFacade.getInstance().sendNotification(Notes.STARTUP, this.stage);
    }
}
}