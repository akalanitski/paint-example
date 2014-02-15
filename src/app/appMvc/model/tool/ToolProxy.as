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

    public function set currentTool(newTool:Tool):void {
        if (currentTool.getName() == newTool.getName()){
            return;
        }
        currentTool=newTool;
    }
}
}