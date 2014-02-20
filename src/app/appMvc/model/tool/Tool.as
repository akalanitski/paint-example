/**
 * Created with IntelliJ IDEA.
 * User: admin
 * Date: 14.01.14
 * Time: 11:01
 * To change this template use File | Settings | File Templates.
 */
package app.appMvc.model.tool {
import app.appMvc.model.document.Layer;

import flash.display.Stage;

import flash.events.MouseEvent;

public class Tool {
    protected var _isInUse:Boolean = false;
    protected var _toolName:String;
    public var activeLayer:Layer = null;
    function Tool(toolName:String) {_toolName = toolName;}

    public function get isInUse():Boolean {return _isInUse;}
    public function getName():String {return _toolName;}

    public final function handleMouseDown(e:MouseEvent):void {
        updateSettings();
        validateSettings();
        onMouseDown(e);
    }
    // sends events to update settings
    protected function updateSettings():void {}
    // throws errors on wrong settings
    protected function validateSettings():void {}
    // called after updating and validating settings
    protected function onMouseDown(e:MouseEvent):void {}

    public function handleMouseUp(e:MouseEvent):void {}
    public function handleMouseMove(e:MouseEvent):void {}
}
}