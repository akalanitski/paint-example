package app.appMvc.model.tool {
import app.appMvc.Notes;
import app.appMvc.model.applicationSettings.ApplicationSettingsProxy;
import app.appMvc.model.document.Layer;
import app.appMvc.model.tool.vo.ToolEvent;

import flash.events.MouseEvent;

import org.puremvc.as3.interfaces.INotification;

import org.puremvc.as3.patterns.mediator.Mediator;

public class ToolMediator extends Mediator {
    public static const NAME:String = "ToolMediator";
    private var _toolProxy:ToolProxy;
    public function ToolMediator() {super(NAME);}

    override public function onRegister():void {
        _toolProxy = facade.retrieveProxy(ToolProxy.NAME) as ToolProxy;
    }

    override public function listNotificationInterests():Array {
        return [
            Notes.ACTIVE_LAYER_CHANGED,
            Notes.FRONT_COLOR_CHANGED,

            Notes.MAIN_WINDOW_MOUSE_DOWN,
            Notes.MAIN_WINDOW_MOUSE_MOVE,
            Notes.MAIN_WINDOW_MOUSE_UP
        ];
    }

    override public function handleNotification(note:INotification):void {
        switch (note.getName()) {
            case Notes.ACTIVE_LAYER_CHANGED:
                _toolProxy.currentTool.activeLayer = note.getBody() as Layer;
                break;

            case Notes.MAIN_WINDOW_MOUSE_UP:
                _toolProxy.currentTool.handleMouseUp(note.getBody() as MouseEvent);
                break;

            case Notes.MAIN_WINDOW_MOUSE_DOWN:
                try {
                    _toolProxy.currentTool.handleMouseDown(note.getBody() as MouseEvent);
                } catch (error:Error) {
                    if (error.message == ToolEvent.ERROR_NULL_ACTIVE_LAYER) {
                        trace("No active layer.");
                    }
                }
                break;

            case Notes.MAIN_WINDOW_MOUSE_MOVE:
                _toolProxy.currentTool.handleMouseMove(note.getBody() as MouseEvent);
                break;
        }
    }
}
}
