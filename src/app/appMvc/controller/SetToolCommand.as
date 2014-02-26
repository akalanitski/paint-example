package app.appMvc.controller {
import app.appMvc.model.tool.Tool;
import app.appMvc.model.tool.ToolEllipse;
import app.appMvc.model.tool.ToolEraser;
import app.appMvc.model.tool.ToolHand;
import app.appMvc.model.tool.ToolLine;
import app.appMvc.model.tool.ToolPencil;
import app.appMvc.model.tool.ToolProxy;
import app.appMvc.model.tool.ToolSquare;
import app.appMvc.model.tool.ToolStencilBrush;

import org.puremvc.as3.interfaces.INotification;
import org.puremvc.as3.patterns.command.SimpleCommand;

public class SetToolCommand extends SimpleCommand {
    public function SetToolCommand() {}
    override public function execute(note:INotification):void {
        var toolName:String = note.getBody() as String;
        var toolProxy:ToolProxy = facade.retrieveProxy(ToolProxy.NAME) as ToolProxy;

        if (toolProxy.currentTool.getName() == toolName || toolProxy.currentTool.isInUse) {
            return;
        }
        switch (toolName) {
            case ToolHand.NAME:
                toolProxy.currentTool = new ToolHand();
                break;
            case ToolPencil.NAME:
                toolProxy.currentTool = new ToolPencil();
                break;
            case ToolStencilBrush.NAME:
                toolProxy.currentTool = new ToolStencilBrush();
                break;
            case ToolSquare.NAME:
                toolProxy.currentTool = new ToolSquare();
                break;
            case ToolLine.NAME:
                toolProxy.currentTool = new ToolLine();
                break;
            case ToolEraser.NAME:
                toolProxy.currentTool = new ToolEraser();
                break;
            case ToolEllipse.NAME:
                toolProxy.currentTool = new ToolEllipse();
                break;
        }
    }
}
}
