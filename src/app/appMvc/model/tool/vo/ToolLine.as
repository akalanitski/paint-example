/**
 * Created by cfe on 08.02.14.
 */
package app.appMvc.model.tool.vo {
public class ToolLine extends Tool {
    public static const NAME:String = "ToolLine";
    public function ToolLine() {super(NAME);}

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
                state = new StateNone(this);
                break;
            case StateDrawing.NAME:
                state = new StateDrawing(this);
                break;
        }
        state.initState();
    }
}
}

import app.appMvc.model.tool.vo.Tool;
import app.appMvc.model.tool.vo.ToolState;

import flash.display.Sprite;
import flash.events.MouseEvent;

class StateNone extends ToolState{
    public static const NAME:String = "StateNone";
    function StateNone(curTool:Tool){super(NAME,curTool);}

    override public function initState():void {
        tool.isInUse = false;
    }
    override public function handleMouseDown(e:MouseEvent):void {
        tool.setState(StateDrawing.NAME);
        tool.state.handleMouseDown(e);
    }
}

class StateDrawing extends ToolState{
    public static const NAME:String = "StateDrawing";
    function StateDrawing(curTool:Tool){super(NAME,curTool);}

    private var _visualRepr:Sprite = new Sprite();
    private var _prevX:Number;
    private var _prevY:Number;

    override public function initState():void {
        tool.activeLayer.addChild(_visualRepr);
    }
    override public function cleanupState():void {
        tool.activeLayer.removeChild(_visualRepr);
    }

    override public function handleMouseDown(e:MouseEvent):void {
        tool.isInUse = true;
        _prevX = tool.relX;
        _prevY = tool.relY;
    }

    override public function handleMouseMove(e:MouseEvent):void {
        if (tool.isInUse) {
             // draw visual line from mouseDown to mouseMove
            _visualRepr.graphics.clear();
            _visualRepr.graphics.beginFill(0x000000, 0.0);
            _visualRepr.graphics.lineStyle(3, 0x000000, 1.0);
            _visualRepr.graphics.moveTo(_prevX, _prevY);
            _visualRepr.graphics.lineTo(tool.relX, tool.relY);
            _visualRepr.graphics.endFill();
        }
    }

    override public function handleMouseUp(e:MouseEvent):void {
        tool.isInUse = false;
        // copy line graphics to active layer
        tool.activeLayer.graphics.drawGraphicsData(_visualRepr.graphics.readGraphicsData(true));
        _visualRepr.graphics.clear();

        tool.setState(StateNone.NAME);
    }
}
