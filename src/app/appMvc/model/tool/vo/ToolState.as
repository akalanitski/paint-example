/**
 * Created by cfe on 3/13/14.
 */
package app.appMvc.model.tool.vo {
import flash.events.MouseEvent;

public class ToolState {
    public static const NAME:String = "ToolState";
    private var _stateName:String;
    private var _tool:Tool;
    public function ToolState(stateName:String, curTool:Tool) {
        _stateName = stateName;
        _tool = curTool;
    }
    public final function get name():String {return _stateName;}
    public final function get tool():Tool {return _tool;}
    public function initState():void {}
    public function cleanupState():void {}
    public function handleMouseDown(e:MouseEvent):void {}
    public function handleMouseUp(e:MouseEvent):void {}
    public function handleMouseMove(e:MouseEvent):void {}
}
}
