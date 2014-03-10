/**
 * Created by cfe on 17.02.14.
 */
package app.appMvc.model.tool.vo {
import flash.events.Event;

public class ToolEvent extends Event{
    public static const UPDATE_ACTIVE_LAYER:String = "UPDATE_ACTIVE_LAYER";
    public static const ERROR_NULL_ACTIVE_LAYER:String = "ERROR_NULL_ACTIVE_LAYER";

    // ToolHand settings from MainWindow
    public static const PULL_DOC_ORIGIN_COORDINATES:String = "PULL_DOC_ORIGIN_COORDINATES";
    public static const CHANGE_DOC_ORIGIN_COORDINATES:String = "CHANGE_DOC_ORIGIN_COORDINATES";

    public function ToolEvent(type:String,bubbles:Boolean = false,cancelable:Boolean = false){
        super(type,bubbles,cancelable);
    }
}
}
