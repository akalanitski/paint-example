/**
 * Created by cfe on 15.02.14.
 */
package app.appMvc.model.tool.vo {
public class ToolHand extends Tool {
    public static const NAME:String = "ToolHand";
    public function ToolHand() {super(NAME);}
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

import app.S;
import app.appMvc.model.tool.vo.Tool;
import app.appMvc.model.tool.vo.ToolEvent;
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

    private var _prevMouseX:Number = 0.0;
    private var _prevMouseY:Number = 0.0;
    private var _prevDocOx:Number = 0.0;
    private var _prevDocOy:Number = 0.0;

    override public function initState():void {}
    override public function cleanupState():void {}

    override public function handleMouseDown(e:MouseEvent):void {
        tool.isInUse = true;
        _prevDocOx = tool.docOx;
        _prevDocOy = tool.docOy;
        _prevMouseX = e.stageX;
        _prevMouseY = e.stageY;
    }

    override public function handleMouseMove(e:MouseEvent):void {
        if (tool.isInUse) {
            // draw visual line from mouseDown to mouseMove
            tool.docOx = e.stageX - _prevMouseX + _prevDocOx;
            tool.docOy = e.stageY - _prevMouseY + _prevDocOy;
            S.stage.dispatchEvent(new ToolEvent(ToolEvent.UPDATE_DOC_ORIGIN_COORDINATES, true));
        }
    }

    override public function handleMouseUp(e:MouseEvent):void {
        tool.isInUse = false;
        tool.setState(StateNone.NAME);
    }
}
