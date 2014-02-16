package app.appMvc.model.tool {
import org.puremvc.as3.patterns.proxy.Proxy;

public class ToolProxy extends Proxy {
    public static const NAME:String = "ToolProxy";

    public function ToolProxy() {
        super(NAME, new ToolPencil());
    }

    public function get currentTool():Tool {
        return data as Tool;
    }

    public function setCurrentTool(toolName:String):void {
        if (currentTool.getName() == toolName || currentTool.isInUse) {
            return;
        }
        switch (toolName) {
            case ToolHand.NAME:
                data = new ToolHand();
                break;
            case ToolPencil.NAME:
                data = new ToolPencil();
                break;
            case ToolStencilBrush.NAME:
                data = new ToolStencilBrush();
                break;
            case ToolSquare.NAME:
                data = new ToolSquare();
                break;
        }
    }
}
}