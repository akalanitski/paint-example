/**
 * Created with IntelliJ IDEA.
 * User: admin
 * Date: 10.01.14
 * Time: 16:05
 * To change this template use File | Settings | File Templates.
 */
package app.appMvc.model.applicationSettings.vo {
import app.appMvc.model.document.vo.Document;
import app.appMvc.model.document.vo.Layer;

public class ApplicationSettings {
    private var _frontColor:uint = 0x000000;
    private var _backColor:uint = 0xFFFFFF;
    private var _activeLayer:Layer = null;
    private var _activeDocument:Document = null;
    private var _selectedLayers:Vector.<Layer>;
    public function ApplicationSettings() {}

    public function get frontColor():uint {return _frontColor;}
    public function set frontColor(rgb:uint):void {_frontColor = rgb;}

    public function get backColor():uint {return _backColor;}
    public function set backColor(rgb:uint):void {_backColor = rgb;}

    public function swapFrontBackColors():void {
        var frontColorBuffer:uint = frontColor;
        frontColor = backColor;
        backColor = frontColorBuffer;
    }

    public function get activeLayer():Layer {return _activeLayer;}
    public function set activeLayer(layer:Layer):void {_activeLayer = layer;}

    public function get activeDocument():Document {return _activeDocument;}
    public function set activeDocument(doc:Document):void {_activeDocument = doc;}

}
}
