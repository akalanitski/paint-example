/**
 * Created with IntelliJ IDEA.
 * User: admin
 * Date: 14.01.14
 * Time: 12:13
 * To change this template use File | Settings | File Templates.
 */
package app.appMvc.model.tool.vo {
public class ToolStencilBrush extends Tool {
    public static const NAME:String = "ToolStencilBrush";
    public function ToolStencilBrush() {super(NAME);}

    override public function initTool():void {
        setState(StateNone.NAME);
    }
    override public function cleanupTool():void {
        setState(StateNone.NAME);
    }

    override public function setState(stateName:String):void {
        if (stateName == state.name) {
            return;
        }
        state.cleanupState();
        switch (stateName) {
            case StateNone.NAME:
                _state = new StateNone(this);
                break;
            case StateDrawing.NAME:
                _state = new StateDrawing(this);
                break;
        }
        state.initState();
    }
}
}

import app.appMvc.model.tool.vo.Tool;
import app.appMvc.model.tool.vo.ToolState;

import flash.events.MouseEvent;

class StateNone extends ToolState {
    public static const NAME:String = "StateNone";
    function StateNone(curTool:Tool) {super(NAME, curTool);}

    override public function initState():void {
        tool.isInUse = false;
    }
    override public function handleMouseDown(e:MouseEvent):void {
        tool.setState(StateDrawing.NAME);
        tool.state.handleMouseDown(e);
    }
}

class StateDrawing extends ToolState {
    public static const NAME:String = "StateDrawing";
    function StateDrawing(curTool:Tool) {super(NAME, curTool);}

    override public function initState():void {}
    override public function cleanupState():void {}

    override public function handleMouseDown(e:MouseEvent):void {
        tool.isInUse = true;
        tool.activeLayer.graphics.beginFill(0x000000, 1.0);
        tool.activeLayer.graphics.lineStyle();
        tool.activeLayer.graphics.drawCircle(tool.relX, tool.relY, 5);
        tool.activeLayer.graphics.endFill();
    }

    override public function handleMouseMove(e:MouseEvent):void {
        if (tool.isInUse) {
            tool.activeLayer.graphics.beginFill(0x000000, 1.0);
            tool.activeLayer.graphics.lineStyle();
            tool.activeLayer.graphics.drawCircle(tool.relX, tool.relY, 5);
            tool.activeLayer.graphics.endFill();
        }
    }

    override public function handleMouseUp(e:MouseEvent):void {
        tool.isInUse = false;
        tool.setState(StateNone.NAME);
    }
}
