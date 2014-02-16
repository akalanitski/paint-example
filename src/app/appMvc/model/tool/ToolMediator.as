package app.appMvc.model.tool {
import app.appMvc.Notes;

import org.puremvc.as3.interfaces.INotification;
import org.puremvc.as3.patterns.mediator.Mediator;

public class ToolMediator extends Mediator {
    public static const NAME:String = "ToolMediator";
    public function ToolMediator() {super(NAME);}

    override public function listNotificationInterests():Array {
        return [
            Notes.SET_TOOL
        ]
    }

    override public function handleNotification(note:INotification):void {
        var toolProxy:ToolProxy = facade.retrieveProxy(ToolProxy.NAME) as ToolProxy;
        switch (note.getName()) {
            case Notes.SET_TOOL:
                toolProxy.setCurrentTool(note.getBody() as String);
                break;
        }
    }
}
}