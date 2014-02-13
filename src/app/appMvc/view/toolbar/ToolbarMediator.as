/**
 * Created by cfe on 11.02.14.
 */
package app.appMvc.view.toolbar {
import app.appMvc.Notes;
import app.appMvc.model.canvas.CanvasProxy;

import flash.display.Stage;
import flash.events.Event;
import flash.events.KeyboardEvent;
import flash.ui.Keyboard;

import org.puremvc.as3.patterns.mediator.Mediator;

public class ToolbarMediator extends Mediator {
    public static const NAME:String = "ToolbarMediator";

    public function get toolbar():Toolbar {
        return viewComponent as Toolbar;
    }

    private var _stage:Stage;

    public function ToolbarMediator(stage:Stage) {
        super(NAME, new Toolbar(stage));
        _stage = stage;
    }


    private function handleKeyUp(e:KeyboardEvent):void {
        switch (e.keyCode) {
            case Keyboard.T:
                toolbar.toggleVisibility();
                break;
        }
    }

    override public function onRegister():void {
        _stage.addEventListener(Toolbar.CLICKED_BUTTON, handleClickedToolbarButton);
        _stage.addEventListener(KeyboardEvent.KEY_UP, handleKeyUp);
    }

    override public function onRemove():void {
        _stage.removeEventListener(Toolbar.CLICKED_BUTTON, handleClickedToolbarButton);
        _stage.removeEventListener(KeyboardEvent.KEY_UP, handleKeyUp);
    }

    private function handleClickedToolbarButton(e:Event):void {
        switch (e.target) {
            case toolbar.button_1:
            case toolbar.button_2:
            case toolbar.button_3:
                sendNotification(Notes.SET_TOOL_COMMAND, e);
                break;
            case toolbar.button_clear:
                var canvasProxy:CanvasProxy = facade.retrieveProxy(CanvasProxy.NAME) as CanvasProxy;
                canvasProxy.canvas.clearCanvas();
        }
    }

}
}
