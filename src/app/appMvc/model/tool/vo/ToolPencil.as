/**
 * Created with IntelliJ IDEA.
 * User: admin
 * Date: 14.01.14
 * Time: 10:56
 * To change this template use File | Settings | File Templates.
 */
package app.appMvc.model.tool.vo {
public class ToolPencil extends Tool {
    public static const NAME:String = "ToolPencil";
    public function ToolPencil() {super(NAME);}

    override public function initTool():void {
        setState(StateNone.NAME);
    }
    override public function cleanupTool():void {
        setState(StateNone.NAME);
    }

    override public function setState(stateName:String):void {
        switch (stateName) {
            case StateNone.NAME:
                state = new StateNone(this);
                break;
            case StateDrawing.NAME:
                state = new StateDrawing(this);
                break;
        }
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

    private var _prevX:Number;
    private var _prevY:Number;

    override public function initState():void {}
    override public function cleanupState():void {}

    override public function handleMouseDown(e:MouseEvent):void {
        tool.isInUse = true;
        _prevX = tool.relX;
        _prevY = tool.relY;
    }

    override public function handleMouseMove(e:MouseEvent):void {
        if (tool.isInUse) {
            // draw visual line from mouseDown to mouseMove
            tool.activeLayer.graphics.beginFill(0x000000);
            tool.activeLayer.graphics.lineStyle(5, 0x000000);
            tool.activeLayer.graphics.moveTo(_prevX, _prevY);
            tool.activeLayer.graphics.lineTo(tool.relX, tool.relY);
            tool.activeLayer.graphics.endFill();
            _prevX = tool.relX;
            _prevY = tool.relY;
        }
    }

    override public function handleMouseUp(e:MouseEvent):void {
        tool.isInUse = false;
        tool.setState(StateNone.NAME);
    }
}
