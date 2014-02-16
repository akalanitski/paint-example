package app.appMvc.model.tool {
import app.appMvc.Notes;

import org.puremvc.as3.interfaces.INotification;

import org.puremvc.as3.patterns.mediator.Mediator;

public class ToolMediator extends Mediator {
    public static const NAME:String = "ToolMediator";

    public function ToolMediator() {
        super(NAME);
    }

    override public function listNotificationInterests():Array {
        return [
            Notes.SET_TOOL_HAND,
            Notes.SET_TOOL_PENCIL,
            Notes.SET_TOOL_SQUARE,
            Notes.SET_TOOL_STENCIL_BRUSH
        ]
    }

    override public function handleNotification(note:INotification):void {
        switch(note.getName()){
            case Notes.SET_TOOL_HAND:
            case Notes.SET_TOOL_PENCIL:
            case Notes.SET_TOOL_SQUARE:
            case Notes.SET_TOOL_STENCIL_BRUSH:
                var toolProxy:ToolProxy = facade.retrieveProxy(ToolProxy.NAME) as ToolProxy;
                toolProxy.setCurrentTool(note.getName());
                break;
        }
    }
}
}