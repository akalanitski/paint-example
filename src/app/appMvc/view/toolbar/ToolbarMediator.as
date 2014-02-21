/**
 * Created by cfe on 11.02.14.
 */
package app.appMvc.view.toolbar {
import app.S;
import app.appMvc.Notes;
import app.appMvc.model.applicationSettings.ApplicationSettingsProxy;
import app.appMvc.model.document.Layer;
import app.appMvc.model.tool.ToolHand;
import app.appMvc.model.tool.ToolPencil;
import app.appMvc.model.tool.ToolSquare;
import app.appMvc.model.tool.ToolStencilBrush;

import flash.display.Stage;
import flash.events.Event;
import flash.events.KeyboardEvent;
import flash.ui.Keyboard;

import org.puremvc.as3.patterns.mediator.Mediator;

public class ToolbarMediator extends Mediator {
    public static const NAME:String = "ToolbarMediator";

    public function get toolbar():Toolbar {return viewComponent as Toolbar;}
    public function ToolbarMediator() {
        super(NAME, new Toolbar());
        S.stage.addChild(toolbar);
    }

    private function handleKeyUp(e:KeyboardEvent):void {
        switch (e.keyCode) {
            case Keyboard.T:
                toolbar.toggleVisibility();
                break;
        }
    }

    override public function onRegister():void {
        S.stage.addEventListener(Toolbar.CLICKED_BUTTON, handleClickedToolbarButton);
        S.stage.addEventListener(KeyboardEvent.KEY_UP, handleKeyUp);
    }

    override public function onRemove():void {
        S.stage.removeEventListener(Toolbar.CLICKED_BUTTON, handleClickedToolbarButton);
        S.stage.removeEventListener(KeyboardEvent.KEY_UP, handleKeyUp);
    }

    private function handleClickedToolbarButton(e:Event):void {

        switch (e.target) {
            case toolbar.buttons[0]:
                sendNotification(Notes.SET_TOOL, ToolPencil.NAME);
                break;
            case toolbar.buttons[1]:
                sendNotification(Notes.SET_TOOL, ToolStencilBrush.NAME);
                break;
            case toolbar.buttons[2]:
                sendNotification(Notes.SET_TOOL, ToolSquare.NAME);
                break;
            case toolbar.buttons[3]:
                sendNotification(Notes.SET_TOOL, ToolHand.NAME);
                break;
            case toolbar.buttons[4]:
                var appSettingsProxy:ApplicationSettingsProxy = facade.retrieveProxy(ApplicationSettingsProxy.NAME) as ApplicationSettingsProxy;
                    var activeLayer:Layer = appSettingsProxy.settings.activeLayer;
                    if (activeLayer){activeLayer.graphics.clear()}
                break;
        }
    }
}
}
