/**
 * Created with IntelliJ IDEA.
 * User: admin
 * Date: 14.01.14
 * Time: 11:01
 * To change this template use File | Settings | File Templates.
 */
package app.appMvc.model.tool.vo {
import app.appMvc.model.document.Layer;

import flash.events.MouseEvent;

/**
 * Tool has static commonSettings and regular settings
 */

public class Tool {
    protected var _toolName:String;
    function Tool(toolName:String) {_toolName = toolName;}

    private var _isInUse:Boolean = false;
    private static var _commonSettings:ToolCommonSettings = new ToolCommonSettings();

    public function getName():String {return _toolName;}

    public function  get activeLayer():Layer {return _commonSettings.activeLayer;}
    public function  set activeLayer(layer:Layer):void { _commonSettings.activeLayer = layer;}

    // document origin coordinates on stage
    public function  get docOx():Number {return _commonSettings.docOx;}
    public function  set docOx(value:Number):void { _commonSettings.docOx = value;}
    public function  get docOy():Number {return _commonSettings.docOy;}
    public function  set docOy(value:Number):void { _commonSettings.docOy = value;}

    // relative document mouse coordinates
    public function  get relX():Number {return _commonSettings.relX;}
    public function  set relX(value:Number):void { _commonSettings.relX = value;}
    public function  get relY():Number {return _commonSettings.relY;}
    public function  set relY(value:Number):void { _commonSettings.relY = value;}

    public function init():void {}
    public function cleanup():void {}

    public function get isInUse():Boolean {return _isInUse;}
    public function set isInUse(value:Boolean):void {_isInUse = value;}

    // sequence method
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
