/**
 * Created with IntelliJ IDEA.
 * User: admin
 * Date: 11.01.14
 * Time: 16:33
 * To change this template use File | Settings | File Templates.
 */
package app.appMvc.view.components {
import app.appMvc.Notes;
import app.appMvc.model.canvas.CanvasProxy;
import app.appMvc.model.color.ColorFrontProxy;
import app.appMvc.view.components.ToolColor;

import org.puremvc.as3.interfaces.INotification;
import org.puremvc.as3.patterns.mediator.Mediator;

public class ToolColorMediator extends Mediator{
    public static const NAME:String = "ToolColorMediator";
    private function get _toolColor():ToolColor{ return viewComponent as ToolColor};
    public function ToolColorMediator() {
        super(NAME, new ToolColor());
        var canvasProxy = facade.retrieveProxy(CanvasProxy.NAME) as CanvasProxy;
        sendNotification(Notes.UPDATE_TOOL_COLOR,ColorFrontProxy.get);
    }

    override public function listNotificationInterests():Array {
        return [
                Notes.UPDATE_TOOL_COLOR
        ]
    }

    override public function handleNotification(notification:INotification):void {
        switch(notification.getName()){
            case Notes.
        }
    }
}
}
