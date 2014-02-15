/**
 * Created with IntelliJ IDEA.
 * User: admin
 * Date: 11.01.14
 * Time: 13:51
 * To change this template use File | Settings | File Templates.
 */
package app.appMvc.view {
import app.appMvc.Notes;
import app.appMvc.model.appManager.AppManagerProxy;
import app.appMvc.model.tool.ToolPencil;
import app.appMvc.model.tool.ToolSquare;
import app.appMvc.model.tool.ToolStencilBrush;

import flash.display.Stage;
import flash.events.KeyboardEvent;
import flash.ui.Keyboard;

import org.puremvc.as3.interfaces.INotification;
import org.puremvc.as3.patterns.mediator.Mediator;

public class AppManagerMediator extends Mediator{
    public static const NAME:String = "AppManagerMediator";

    private var _canvasProxy:AppManagerProxy;
    private var _stage:Stage;
    public function AppManagerMediator() {
        super(NAME);

        _canvasProxy = facade.retrieveProxy(AppManagerProxy.NAME) as AppManagerProxy;

        var stageMediator:StageMediator = facade.retrieveMediator(StageMediator.NAME) as StageMediator;
        _stage = stageMediator.stage;
    }


    override public function listNotificationInterests():Array {
        return [
                Notes.KEY_DOWN
        ]
    }

    override public function handleNotification(note:INotification):void {
        var keyEvent:KeyboardEvent = note.getBody()as KeyboardEvent;
        switch(keyEvent.keyCode){
            case Keyboard.NUMBER_1:
                _canvasProxy.appManager.setTool(ToolStencilBrush.NAME);
                break;
            case Keyboard.NUMBER_2:
                _canvasProxy.appManager.setTool(ToolPencil.NAME);
                break;
            case Keyboard.NUMBER_3:
                _canvasProxy.appManager.setTool(ToolSquare.NAME);
                break;
            case Keyboard.S:
                _canvasProxy.appManager.fileLoader.saveToPng();
                break;
            case Keyboard.O:
                _canvasProxy.appManager.fileLoader.loadFile();
                break;
        }
    }
}
}
