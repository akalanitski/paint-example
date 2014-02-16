/**
 * Created with IntelliJ IDEA.
 * User: admin
 * Date: 10.01.14
 * Time: 16:05
 * To change this template use File | Settings | File Templates.
 */
package app.appMvc.model.applicationSettings {
import app.appMvc.model.document.Document;
import app.appMvc.model.document.Layer;

public class ApplicationSettingsVO {
    private var _frontColor:uint = 0x000000;
    private var _backColor:uint = 0xFFFFFF;
    private var _appBackground:uint = 0x777777;
    private var _activeLayer:Layer;
    private var _activeDocument:Document;
    private var _selectedLayers:Vector.<Layer>;
    public function ApplicationSettingsVO() {}

    public function get frontColor():uint {return _frontColor;}
    public function set frontColor(rgb:uint):void {_frontColor = rgb;}
    public function get backColor():uint {return _backColor;}
    public function set backColor(rgb:uint):void {_backColor = rgb;}

    public function swapFrontBackColors():void {
        var frontColorBuffer:uint = frontColor;
        frontColor = backColor;
        backColor = frontColorBuffer;
    }
}
}
