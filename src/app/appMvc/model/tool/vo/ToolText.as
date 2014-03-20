/**
 * Created by cfe on 08.02.14.
 */
package app.appMvc.model.tool.vo {
import app.S;


public class ToolText extends Tool {
    public static const NAME:String = "ToolText";
    public function ToolText() {super(NAME);}

    override public function setState(stateName:String):void {
        switch (stateName) {
            case StateNone.NAME:
                state = new StateNone(this);
                break;

            case StateTyping.NAME:
                state = new StateTyping(this);
                break;
        }
    }

    override public function initTool():void {
        setState(StateNone.NAME);
    }

    override public function cleanupTool():void {
        setState(StateNone.NAME);
    }
}
}

import app.appMvc.model.tool.vo.ToolState;
import app.appMvc.model.tool.vo.ToolText;

import flash.events.MouseEvent;
import flash.text.TextField;

class StateNone extends ToolState {
    public static const NAME:String = "ToolStateNone";
    function StateNone(parent:ToolText):void {super(NAME, parent);}
    override public function handleMouseDown(e:MouseEvent):void {
        tool.setState(StateTyping.NAME);
        tool.state.handleMouseDown(e);
    }
    override public function handleMouseMove(e:MouseEvent):void {}
    override public function handleMouseUp(e:MouseEvent):void {}
}

class StateTyping extends ToolState {
    public static const NAME:String = "ToolStateTyping";
    function StateTyping(tool:ToolText):void {
        super(NAME,tool);
    }
    private var _tempTf:TextField;

    override public function handleMouseDown(e:MouseEvent):void {
        trace("textTool");
        tool.isInUse = true;
    }
    override public function handleMouseMove(e:MouseEvent):void {}
    override public function handleMouseUp(e:MouseEvent):void {}
}
