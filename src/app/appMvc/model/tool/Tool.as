/**
 * Created with IntelliJ IDEA.
 * User: admin
 * Date: 14.01.14
 * Time: 11:01
 * To change this template use File | Settings | File Templates.
 */
package app.appMvc.model.tool {
import app.appMvc.model.document.Layer;

import flash.events.MouseEvent;

public class Tool {
    private var _isInUse:Boolean = false;
    protected var _toolName:String;
    public var activeLayer:Layer = null;
    // document origin coordinates on stage
    public var docOx:Number = 0.0;
    public var docOy:Number = 0.0;
    // relative document mouse coordinates
    public var relX:Number = 0.0;
    public var relY:Number = 0.0;
    function Tool(toolName:String) {_toolName = toolName;}

    public function onRegister():void {}
    public function onRemove():void {}

    public function get isInUse():Boolean {return _isInUse;}
    public function set isInUse(value:Boolean):void {_isInUse = value;}
    public function getName():String {return _toolName;}

    public final function handleMouseDown(e:MouseEvent):void {
        updateSettings();
        validateSettings();
        postMouseDown(e);
    }
    // sends events to update settings
    protected function updateSettings():void {}
    // throws errors on wrong settings
    protected function validateSettings():void {}
    // called after updating and validating settings
    protected function postMouseDown(e:MouseEvent):void {}

    public function handleMouseUp(e:MouseEvent):void {}
    public function handleMouseMove(e:MouseEvent):void {}
}
}
