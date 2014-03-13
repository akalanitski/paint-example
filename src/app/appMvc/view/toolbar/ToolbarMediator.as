/**
 * Created by cfe on 11.02.14.
 */
package app.appMvc.view.toolbar {
import app.S;
import app.appMvc.Notes;
import app.appMvc.model.applicationSettings.ApplicationSettingsProxy;
import app.appMvc.model.document.vo.Layer;
import app.appMvc.model.tool.ToolProxy;
import app.appMvc.model.tool.vo.Tool;
import app.appMvc.model.tool.vo.ToolEllipse;
import app.appMvc.model.tool.vo.ToolEraser;
import app.appMvc.model.tool.vo.ToolHand;
import app.appMvc.model.tool.vo.ToolLine;
import app.appMvc.model.tool.vo.ToolPencil;
import app.appMvc.model.tool.vo.ToolRectangle;
import app.appMvc.model.tool.vo.ToolStencilBrush;
import app.appMvc.model.tool.vo.ToolText;
import app.appMvc.view.toolbar.vc.Toolbar;

import flash.display.Stage;
import flash.events.Event;
import flash.events.KeyboardEvent;
import flash.ui.Keyboard;

import org.puremvc.as3.interfaces.INotification;

import org.puremvc.as3.patterns.mediator.Mediator;

public class ToolbarMediator extends Mediator {
    public static const NAME:String = "ToolbarMediator";

    private function get toolbar():Toolbar {return viewComponent as Toolbar;}

    public function ToolbarMediator() {
        super(NAME, new Toolbar());
        S.stage.addChild(toolbar);
    }

    override public function onRegister():void {
        toolbar.addEventListener(Toolbar.CLICKED_BUTTON, handleClickedToolbarButton);
    }

    override public function onRemove():void {
        toolbar.removeEventListener(Toolbar.CLICKED_BUTTON, handleClickedToolbarButton);
    }

    override public function listNotificationInterests():Array {
        return [
            Notes.TOGGLE_TOOLBAR_VISIBILITY
        ]
    }

    override public function handleNotification(note:INotification):void {
        switch(note.getName()){
            case Notes.TOGGLE_TOOLBAR_VISIBILITY:
                    toolbar.toggleVisibility();
                break;
        }
    }
    private function handleClickedToolbarButton(e:Event):void {
        switch (e.target.name)
        {
            case ToolPencil.NAME:
            case ToolRectangle.NAME:
            case ToolText.NAME:
            case ToolLine.NAME:
            case ToolStencilBrush.NAME:
            case ToolHand.NAME:
            case ToolEllipse.NAME:
            case ToolEraser.NAME:
                var toolProxy:ToolProxy = facade.retrieveProxy(ToolProxy.NAME) as ToolProxy;
                toolProxy.setCurrentTool(e.target.name);
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
