/**
 * Created by cfe on 11.02.14.
 */
package app.appMvc.view.toolbar {
import app.S;
import app.appMvc.Notes;
import app.appMvc.model.applicationSettings.ApplicationSettingsProxy;
import app.appMvc.model.document.Layer;
import app.appMvc.model.tool.vo.Tool;
import app.appMvc.model.tool.vo.ToolEllipse;
import app.appMvc.model.tool.vo.ToolEraser;
import app.appMvc.model.tool.vo.ToolHand;
import app.appMvc.model.tool.vo.ToolLine;
import app.appMvc.model.tool.vo.ToolPencil;
import app.appMvc.model.tool.vo.ToolRectangle;
import app.appMvc.model.tool.vo.ToolStencilBrush;
import app.appMvc.model.tool.vo.ToolText;

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
        toolbar.addEventListener(Toolbar.CLICKED_BUTTON, handleClickedToolbarButton);
        S.stage.addEventListener(KeyboardEvent.KEY_UP, handleKeyUp);
    }

    override public function onRemove():void {
        toolbar.removeEventListener(Toolbar.CLICKED_BUTTON, handleClickedToolbarButton);
        S.stage.removeEventListener(KeyboardEvent.KEY_UP, handleKeyUp);
    }

    private function handleClickedToolbarButton(e:Event):void {
        switch (e.target.name) {
            case ToolPencil.NAME:
            case ToolRectangle.NAME:
            case ToolText.NAME:
            case ToolLine.NAME:
            case ToolStencilBrush.NAME:
            case ToolHand.NAME:
            case ToolEllipse.NAME:
            case ToolEraser.NAME:
                sendNotification(Notes.SET_TOOL_COMMAND, e.target.name);
                break;

            case Toolbar.BUTTON_CLEAR:
                var appSettingsProxy:ApplicationSettingsProxy = facade.retrieveProxy(ApplicationSettingsProxy.NAME) as ApplicationSettingsProxy;
                    var activeLayer:Layer = appSettingsProxy.getActiveLayer();
                    if (activeLayer){
                        activeLayer.clear();
                    }
                break;
        }
    }
}
}
