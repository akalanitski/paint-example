/**
 * Created by cfe on 15.02.14.
 */
package app.appMvc.model.tool {
import app.S;

import flash.events.MouseEvent;

public class ToolHand extends Tool {
    public static const NAME:String = "ToolHand";
    public function ToolHand() {super(NAME);}

    override protected function postMouseDown(e:MouseEvent):void {
        isInUse = true;
    }
    override public function handleMouseMove(e:MouseEvent):void {}
    override public function handleMouseUp(e:MouseEvent):void {isInUse = false;}
}
}