/**
 * Created with IntelliJ IDEA.
 * User: admin
 * Date: 10.01.14
 * Time: 16:05
 * To change this template use File | Settings | File Templates.
 */
package app.appMvc.model.applicationSettings {
public class ApplicationSettingsVO {
    public function ApplicationSettingsVO() {
    }

    private var _frontColor:uint = 0x000000;
    public function get frontColor():uint {
        return _frontColor;
    }

    public function set frontColor(rgb:uint):void {
        _frontColor = rgb;
    }

    private var _backColor:uint = 0xFFFFFF;
    public function get backColor():uint {
        return _backColor;
    }

    public function set backColor(rgb:uint):void {
        _backColor = rgb;
    }

    //TODO: Add canvas size

    public function swapFrontBackColors():void {
        var frontColorBuffer:uint = frontColor;
        frontColor = backColor;
        backColor = frontColorBuffer;
    }
}
}
