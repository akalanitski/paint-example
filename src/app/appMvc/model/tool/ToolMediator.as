package app.appMvc.model.tool {
import app.appMvc.Notes;
import app.appMvc.model.document.vo.Layer;

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

            Notes.DOCUMENT_OX_CHANGED,
            Notes.DOCUMENT_OY_CHANGED,

            Notes.RELATIVE_MOUSE_COORDINATES_CHANGED,

            Notes.MAIN_WINDOW_MOUSE_DOWN,
            Notes.MAIN_WINDOW_MOUSE_MOVE,
            Notes.MAIN_WINDOW_MOUSE_UP
        ];
    }

    override public function handleNotification(note:INotification):void {
        switch (note.getName()) {

            case Notes.RELATIVE_MOUSE_COORDINATES_CHANGED:
                var n:Object = note.getBody() as Object;
                _toolProxy.relX = n.relX as Number;
                _toolProxy.relY = n.relY as Number;
                break;

            case Notes.DOCUMENT_OX_CHANGED:
                _toolProxy.docOx = note.getBody() as Number;
                break;

            case Notes.DOCUMENT_OY_CHANGED:
                _toolProxy.docOy = note.getBody() as Number;
                break;

            case Notes.ACTIVE_LAYER_CHANGED:
                _toolProxy.activeLayer = note.getBody() as Layer;
                break;

            case Notes.MAIN_WINDOW_MOUSE_UP:
                _toolProxy.handleMouseUp(note.getBody() as MouseEvent);
                break;

            case Notes.MAIN_WINDOW_MOUSE_DOWN:
                _toolProxy.handleMouseDown(note.getBody() as MouseEvent);
                break;

            case Notes.MAIN_WINDOW_MOUSE_MOVE:
                _toolProxy.handleMouseMove(note.getBody() as MouseEvent);
                break;
        }
    }
}
}
