/**
 * Created by cfe on 11.12.13.
 */
package app {
import app.appMvc.AppFacade;
import app.appMvc.Notes;

import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageScaleMode;

    /**
     * TODO: AppManagerProxy must save and control only it own properties
     * TODO: Add open/save function on toolbar
     * TODO: ToolbarMediator can lister Toolbar instead stage
     * TODO: hightlight selected tool on toolbar
     * TODO: Add color picker with foreground and background color settings
     *
     * FIXME: remove link S.stage
     * FIXME: too match mediators and proxies. Proxy must wrap value object.
     * Mediator must connect view layer with MVC.
     *
     */
public class App extends Sprite {
    public function App(){
        stage.scaleMode = StageScaleMode.NO_SCALE;
        stage.align = StageAlign.TOP_LEFT;
        S.stage = this.stage;

        AppFacade.getInstance().sendNotification(Notes.STARTUP, this.stage);
    }
}
}