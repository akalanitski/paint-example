/**
 * Created with IntelliJ IDEA.
 * User: admin
 * Date: 10.01.14
 * Time: 15:49
 * To change this template use File | Settings | File Templates.
 */
package app.appMvc.model.canvas {
import flash.display.Stage;

import org.puremvc.as3.patterns.proxy.Proxy;

public class CanvasProxy extends Proxy {
    public static const NAME:String = "CanvasProxy";

    public function CanvasProxy(stage:Stage) {
        super(NAME, new CanvasVO(stage));
    }

    public function get canvas():CanvasVO {
        return data as CanvasVO;
    }

    override public function onRegister():void {
        canvas.addListeners();
    }

    override public function onRemove():void {
        canvas.removeListeners();
    }
 }
}