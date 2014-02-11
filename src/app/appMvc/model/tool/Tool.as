/**
 * Created with IntelliJ IDEA.
 * User: admin
 * Date: 14.01.14
 * Time: 11:01
 * To change this template use File | Settings | File Templates.
 */
package app.appMvc.model.tool {
import flash.display.Graphics;
import flash.events.MouseEvent;

/* tools operate on flash.display.Graphics and have settings
 * */
public class Tool {
    public static const NAME:String = "Tool";
    protected var _graphics:Graphics;
    function Tool(graphics:Graphics){
        _graphics = graphics;
    }

    // should be overridden to get proper NAME
    public function getName():String{return NAME;}

    public function handleMouseDown(e:MouseEvent):void{}
    public function handleMouseUp(e:MouseEvent):void{}
    public function handleMouseMove(e:MouseEvent):void{}
}
}