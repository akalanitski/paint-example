/**
 * Created with IntelliJ IDEA.
 * User: admin
 * Date: 14.01.14
 * Time: 11:01
 * To change this template use File | Settings | File Templates.
 */
package app.appMvc.model.tool.vo {
import app.appMvc.model.document.vo.Layer;

import flash.events.MouseEvent;

/**
 * static commonSettings and regular settings
 */
public class Tool {
    private var _toolName:String;
    function Tool(toolName:String) {
        _toolName = toolName;
        _state = new ToolState(ToolState.NAME, this);
    }

    private var _isInUse:Boolean = false;

    private var _state:ToolState;

    private static var _activeLayer:Layer = null;
    // document origin coordinates on stage
    private static var _docOx:Number = 0.0;
    private static var _docOy:Number = 0.0;

    // relative document mouse coordinates
    private static var _relX:Number = 0.0;
    private static var _relY:Number = 0.0;

    public function initTool():void {}
    public function cleanupTool():void {}

    public final function get state():ToolState {return _state;}
    public final function set state(toolState:ToolState):void {
        if (toolState.name == _state.name) {
            return;
        }
        _state.cleanupState();
        _state = toolState;
        _state.initState();
    }

    public function setState(stateName:String):void {}

    public final function get name():String {return _toolName;}
    public final function  get activeLayer():Layer {return _activeLayer;}
    public final function  set activeLayer(layer:Layer):void { _activeLayer = layer;}

    // document origin coordinates on stage
    public final function  get docOx():Number {return _docOx;}
    public final function  set docOx(value:Number):void { _docOx = value;}
    public final function  get docOy():Number {return _docOy;}
    public final function  set docOy(value:Number):void { _docOy = value;}

    // relative document mouse coordinates
    public final function  get relX():Number {return _relX;}
    public final function  set relX(value:Number):void {_relX = value;}
    public final function  get relY():Number {return _relY;}
    public final function  set relY(value:Number):void {_relY = value;}

    public final function get isInUse():Boolean {return _isInUse;}
    public final function set isInUse(value:Boolean):void {_isInUse = value;}

    public final function handleMouseDown(e:MouseEvent):void {_state.handleMouseDown(e);}
    public final function handleMouseMove(e:MouseEvent):void {_state.handleMouseMove(e);}
    public final function handleMouseUp(e:MouseEvent):void {_state.handleMouseUp(e);}
}
}
