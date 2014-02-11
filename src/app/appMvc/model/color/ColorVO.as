/**
 * Created with IntelliJ IDEA.
 * User: admin
 * Date: 10.01.14
 * Time: 16:05
 * To change this template use File | Settings | File Templates.
 */
package app.appMvc.model.color {
public class ColorVO {

    // rgb and alpha
    private var _rgb:uint;
    private var _alpha:Number;
    public function get rgb():uint{return _rgb;}
    public function set rgb(rgb:uint):void{_rgb = rgb;}
    public function get alpha():Number {return _alpha;}
    public function set alpha(alpha:Number):void{_alpha = alpha;}

    public function ColorVO(rgb:uint = 0x000000, alpha:Number = 1.) {
        this.rgb = rgb;
        this.alpha = alpha;
    }
    public function setColor(color:ColorVO):void{
        alpha = color.alpha;
        rgb = color.rgb;
    }
}
}
