/**
 * Created with IntelliJ IDEA.
 * User: admin
 * Date: 10.01.14
 * Time: 16:05
 * To change this template use File | Settings | File Templates.
 */
package app.appMvc.model.color {
public class ApplicationSettings {

    // rgb and alpha
    private var _frontColor:uint;
    private var _frontAlpha:Number;
    public function get frontColor():uint{return _frontColor;}
    public function set frontColor(rgb:uint):void{_frontColor = rgb;}
    public function get frontAlpha():Number {return _frontAlpha;}
    public function set frontAlpha(alpha:Number):void{_frontAlpha = alpha;}

    private var _backgroundColor:uint;
    private var _backgroundAlpha:Number;
    public function get backgroundColor():uint{return _backgroundColor;}
    public function set backgroundColor(rgb:uint):void{_backgroundColor = rgb;}
    public function get backgroundAlpha():Number {return _backgroundAlpha;}
    public function set backgroundAlpha(alpha:Number):void{_backgroundAlpha = alpha;}

    //TODO: Add canvas size

    public function ApplicationSettings(frontColor:uint = 0x000000, frontAlpha:Number = 1.0) {
        this.frontColor = frontColor;
        this.frontAlpha = frontAlpha;
    }
    public function setColor(color:ApplicationSettings):void{
        frontAlpha = color.frontAlpha;
        frontColor = color.frontColor;
    }
}
}
