/**
 * Created by cfe on 08.02.14.
 */
package app.appMvc.model.tool.vo {

public class ToolRectangle extends Tool {
    public static const NAME:String = "ToolRectangle";
    public function ToolRectangle() {super(NAME);}

    override public function initTool():void {

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

import flash.display.Sprite;
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
            _visualRepr.graphics.clear();
            _visualRepr.graphics.beginFill(0x000000);
            _visualRepr.graphics.drawRect(_prevX, _prevY, tool.relX - _prevX, tool.relY - _prevY);
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
