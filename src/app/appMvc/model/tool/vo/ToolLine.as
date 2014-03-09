/**
 * Created by cfe on 08.02.14.
 */
package app.appMvc.model.tool.vo {
import app.appMvc.model.tool.*;

import app.S;

import flash.display.Graphics;
import flash.display.Sprite;
import flash.display.Stage;
import flash.events.KeyboardEvent;
import flash.events.MouseEvent;
import flash.ui.Keyboard;

public class ToolLine extends Tool {
    public static const NAME:String = "ToolLine";
    public function ToolLine() {super(NAME);}

    private var _state:String = STATE_NONE;
    public static const STATE_NONE:String = "STATE_NONE";
    public static const STATE_DRAWING:String = "STATE_DRAWING";

    private var _visualRepr:Sprite = new Sprite();
    private var  _prevX:Number;
    private var  _prevY:Number;

    private function get state():String {return _state;}
    private function set state(newState:String):void {
        if (newState == STATE_NONE){isInUse = false;}
        else {isInUse = true;}
        _state = newState;
    }

    override public function init():void {
        S.stage.addEventListener(KeyboardEvent.KEY_UP, handleKeyUp);
        S.stage.dispatchEvent(new ToolEvent(ToolEvent.UPDATE_ACTIVE_LAYER, true));
        activeLayer.addChild(_visualRepr);
    }
    override public function cleanup():void {
        S.stage.removeEventListener(KeyboardEvent.KEY_UP, handleKeyUp);
        activeLayer.removeChild(_visualRepr);
    }
    private function handleKeyUp(e:KeyboardEvent):void {
        switch (e.keyCode) {
            case Keyboard.ESCAPE:
                _visualRepr.graphics.clear();
                state = STATE_NONE;
                break;
        }
    }
    override protected function updateSettings():void {
        S.stage.dispatchEvent(new ToolEvent(ToolEvent.UPDATE_ACTIVE_LAYER, true));
    }
    override protected function validateSettings():void {
        if (!activeLayer) {
            throw(ToolEvent.ERROR_NULL_ACTIVE_LAYER);
        }
    }
    override protected function postMouseDown(e:MouseEvent):void {
        _prevX = relX;
        _prevY = relY;
        state = STATE_DRAWING;
    }

    override public function handleMouseUp(e:MouseEvent):void {
        activeLayer.graphics.drawGraphicsData(_visualRepr.graphics.readGraphicsData(true));
        _visualRepr.graphics.clear();
        state = STATE_NONE;
    }

    override public function handleMouseMove(e:MouseEvent):void {
        if (isInUse) {
            switch (_state) {
                case STATE_NONE:
                    break;

                case STATE_DRAWING:
                    // draw visual line from mouseDown to mouseMove
                    _visualRepr.graphics.clear();
                    _visualRepr.graphics.beginFill(0x000000, 0.0);
                    _visualRepr.graphics.lineStyle(3, 0x000000, 1.0);
                    _visualRepr.graphics.moveTo(_prevX, _prevY);
                    _visualRepr.graphics.lineTo(relX, relY);
                    _visualRepr.graphics.endFill();
                    break;
            }
        }
    }
}
}
