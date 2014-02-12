/**
 * Created by cfe on 12.02.14.
 */
package app.appMvc.controller {
import app.appMvc.model.canvas.CanvasProxy;
import app.appMvc.model.tool.ToolPencil;
import app.appMvc.model.tool.ToolSquare;
import app.appMvc.model.tool.ToolStencilBrush;
import app.appMvc.view.toolbar.ToolbarMediator;

import flash.events.Event;

import org.puremvc.as3.interfaces.INotification;
import org.puremvc.as3.patterns.command.SimpleCommand;

public class SetToolCommand extends SimpleCommand {
    override public function execute(note:INotification):void {
        var e:Event = note.getBody() as Event;
        // prepare proxy and mediator
        var toolbarMediator:ToolbarMediator = facade.retrieveMediator(ToolbarMediator.NAME) as ToolbarMediator;
        var canvasProxy:CanvasProxy = facade.retrieveProxy(CanvasProxy.NAME) as CanvasProxy;

        switch (e.target) {
            case toolbarMediator.toolbar.button_1:
                    canvasProxy.canvas.setTool(ToolPencil.NAME);
                break;
            case toolbarMediator.toolbar.button_2:
                    canvasProxy.canvas.setTool(ToolStencilBrush.NAME);
                break;
            case toolbarMediator.toolbar.button_3:
                    canvasProxy.canvas.setTool(ToolSquare.NAME);
                break;
        }
    }
}
}
