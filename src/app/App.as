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
     * [TODO:] ToolbarMediator can lister Toolbar instead stage
     * TODO: Add color picker with foreground and background color settings
     *
     * FIXME: remove link S.stage (save for short time)
     * FIXME: too match mediators and proxies. Proxy must wrap value object.
     * Mediator must connect view layer with MVC.
     *
     *
     * ---
     * TODO: Move toolbar shortcut to KeyMediator
     * TODO: Fill text to toolbar button
     * TODO: Toolbar button, add over|down|selected states
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