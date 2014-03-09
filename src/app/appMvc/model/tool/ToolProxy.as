package app.appMvc.model.tool {
import app.appMvc.Notes;
import app.appMvc.model.applicationSettings.ApplicationSettingsProxy;
import app.appMvc.model.tool.vo.Tool;
import app.appMvc.model.tool.vo.ToolEllipse;
import app.appMvc.model.tool.vo.ToolEraser;
import app.appMvc.model.tool.vo.ToolHand;
import app.appMvc.model.tool.vo.ToolLine;
import app.appMvc.model.tool.vo.ToolNone;
import app.appMvc.model.tool.vo.ToolPencil;
import app.appMvc.model.tool.vo.ToolRectangle;
import app.appMvc.model.tool.vo.ToolStencilBrush;
import app.appMvc.model.tool.vo.ToolText;

import org.puremvc.as3.patterns.proxy.Proxy;

public class ToolProxy extends Proxy {
    public static const NAME:String = "ToolProxy";
    public function ToolProxy() {
        super(NAME, new ToolNone());
    }
    public function get currentTool():Tool {return data as Tool;}
    public function set currentTool(tool:Tool):void {
        currentTool.cleanup();
        data = tool;
        currentTool.init();
    }
    public function setCurrentTool(toolName:String):void {
        if (currentTool.getName() == toolName || currentTool.isInUse) {
            return;
        }

        switch (toolName) {
            case ToolHand.NAME:
                currentTool = new ToolHand();
                break;
            case ToolPencil.NAME:
                currentTool = new ToolPencil();
                break;
            case ToolStencilBrush.NAME:
                currentTool = new ToolStencilBrush();
                break;
            case ToolRectangle.NAME:
                currentTool = new ToolRectangle();
                break;
            case ToolLine.NAME:
                currentTool = new ToolLine();
                break;
            case ToolEraser.NAME:
                currentTool = new ToolEraser();
                break;
            case ToolEllipse.NAME:
                currentTool = new ToolEllipse();
                break;
            case ToolText.NAME:
                currentTool = new ToolText();
                break;
            default:
                trace("no such tool.");
                break;
        }
    }
    override public function onRegister():void {
        setCurrentTool(ToolNone.NAME);
    }
    override public function onRemove():void {
    }
}
}
