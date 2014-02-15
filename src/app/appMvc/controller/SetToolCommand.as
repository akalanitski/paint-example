/**
 * Created by cfe on 12.02.14.
 */
package app.appMvc.controller {
import app.appMvc.model.appManager.AppManagerProxy;
import app.appMvc.model.tool.ToolPencil;
import app.appMvc.model.tool.ToolSquare;
import app.appMvc.model.tool.ToolStencilBrush;
import app.appMvc.view.toolbar.ToolbarMediator;

import flash.display.Sprite;

import flash.events.Event;

import org.puremvc.as3.interfaces.INotification;
import org.puremvc.as3.patterns.command.SimpleCommand;

public class SetToolCommand extends SimpleCommand {
    override public function execute(note:INotification):void {
        var e:Event = note.getBody() as Event;
        // prepare proxy and mediator
        var toolbarMediator:ToolbarMediator = facade.retrieveMediator(ToolbarMediator.NAME) as ToolbarMediator;
        var canvasProxy:AppManagerProxy = facade.retrieveProxy(AppManagerProxy.NAME) as AppManagerProxy;

        switch (e.target as Sprite) {
            case toolbarMediator.toolbar.buttons[0]:
                    canvasProxy.appManager.setTool(ToolPencil.NAME);
                break;
            case toolbarMediator.toolbar.buttons[1]:
                canvasProxy.appManager.setTool(ToolStencilBrush.NAME);
                break;
            case toolbarMediator.toolbar.buttons[2]:
                    canvasProxy.appManager.setTool(ToolSquare.NAME);
                break;
            case toolbarMediator.toolbar.buttons[3]:
                canvasProxy.appManager.setTool(ToolSquare.NAME);
                break;
        }
    }
}
}
