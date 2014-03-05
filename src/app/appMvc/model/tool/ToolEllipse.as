/**
 * Created by cfe on 08.02.14.
 */
package app.appMvc.model.tool {

import app.S;
import app.appMvc.model.document.Layer;

import flash.display.Graphics;
import flash.display.Sprite;
import flash.display.Stage;
import flash.events.MouseEvent;

public class ToolEllipse extends Tool {
    public static const NAME:String = "ToolEllipse";
    public function ToolEllipse(activeLayer:Layer)
    {
        super(NAME, activeLayer);
    }

    private var _state:String;
    private const STATE_NONE:String = "STATE_NONE";
    private const STATE_DRAWING:String = "STATE_DRAWING";

    private var _visualRepr:Sprite = new Sprite();
    private var _prevX:Number;
    private var _prevY:Number;

    private function get state():String{return  _state;}
    private function set state(newState:String):void {
        if (newState == STATE_NONE){isInUse = false;}
        else {isInUse = true;}
        _state = newState;
    }
    override public function onRegister():void {
        S.stage.dispatchEvent(new ToolEvent(ToolEvent.UPDATE_ACTIVE_LAYER, true));
        activeLayer.addChild(_visualRepr);
        state = STATE_NONE;
    }
    override public function onRemove():void {
        activeLayer.removeChild(_visualRepr);
    }
    override protected function validateSettings():void {
        if(!activeLayer) {
            throw(ToolEvent.ERROR_NULL_ACTIVE_LAYER);
        }
    }
    override protected function updateSettings():void {
        S.stage.dispatchEvent(new ToolEvent(ToolEvent.UPDATE_ACTIVE_LAYER, true));
    }
    override protected function postMouseDown(e:MouseEvent):void {
        switch (state){
            case STATE_NONE:
                state = STATE_DRAWING;
                break;

            case STATE_DRAWING:
                break;
        }
        _prevX = relX;
        _prevY = relY;
        state = STATE_DRAWING;
    }

    override public function handleMouseUp(e:MouseEvent):void {
        // apply visual line to active layer
        activeLayer.graphics.drawGraphicsData(_visualRepr.graphics.readGraphicsData(true));
        _visualRepr.graphics.clear();
        state = STATE_NONE;
    }

    override public function handleMouseMove(e:MouseEvent):void {
        if (isInUse) {
            switch (state){
                case STATE_DRAWING:
                    _visualRepr.graphics.clear();
                    _visualRepr.graphics.beginFill(0x000000);
                    _visualRepr.graphics.drawEllipse(_prevX, _prevY, relX - _prevX, relY - _prevY);
                    _visualRepr.graphics.endFill();
                    break;
            }
        }
    }
}
}
