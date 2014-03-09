package app.appMvc.controller {
import app.appMvc.model.applicationSettings.ApplicationSettingsProxy;
import app.appMvc.model.tool.vo.Tool;
import app.appMvc.model.tool.vo.ToolEllipse;
import app.appMvc.model.tool.vo.ToolEraser;
import app.appMvc.model.tool.vo.ToolHand;
import app.appMvc.model.tool.vo.ToolLine;
import app.appMvc.model.tool.vo.ToolPencil;
import app.appMvc.model.tool.ToolProxy;
import app.appMvc.model.tool.vo.ToolRectangle;
import app.appMvc.model.tool.vo.ToolStencilBrush;
import app.appMvc.model.tool.vo.ToolText;

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
            case ToolRectangle.NAME:
                toolProxy.currentTool = new ToolRectangle();
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
            case ToolText.NAME:
                toolProxy.currentTool = new ToolText();
                break;
        }
    }
}
}
