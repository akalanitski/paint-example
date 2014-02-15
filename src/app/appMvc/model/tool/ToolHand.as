/**
 * Created by cfe on 15.02.14.
 */
package app.appMvc.model.tool {
import flash.events.Event;
import flash.events.EventDispatcher;
import flash.events.MouseEvent;

public class ToolHand extends Tool {
    public static const NAME:String = "ToolHand";
    public function ToolHand() {
        super(NAME);
    }

    public static const HAND_TOOL_MOUSE_DOWN:String = "HAND_TOOL_MOUSE_DOWN";
    public static const HAND_TOOL_MOUSE_UP:String = "HAND_TOOL_MOUSE_UP";
    public static const HAND_TOOL_MOUSE_MOVE:String = "HAND_TOOL_MOUSE_MOVE";

    override public function handleMouseDown(e:MouseEvent):void {
        var dispatcher:EventDispatcher = new EventDispatcher();
        dispatcher.dispatchEvent(new Event(HAND_TOOL_MOUSE_DOWN,true));
    }

    override public function handleMouseMove(e:MouseEvent):void {
       var dispatcher:EventDispatcher = new EventDispatcher();
       dispatcher.dispatchEvent(new Event(HAND_TOOL_MOUSE_MOVE,true));
    }

    override public function handleMouseUp(e:MouseEvent):void {
        var dispatcher:EventDispatcher = new EventDispatcher();
        dispatcher.dispatchEvent(new Event(HAND_TOOL_MOUSE_UP,true));
    }
}
}
