/**
 * Created by cfe on 17.02.14.
 */
package app.appMvc.model.tool {
import flash.events.Event;

public class ToolSettingsEvent extends Event{
    public static const UPDATE_ACTIVE_LAYER:String = "UPDATE_ACTIVE_LAYER";
    public static const NULL_ACTIVE_LAYER:String = "NULL_ACTIVE_LAYER";

    public function ToolSettingsEvent(type:String,bubbles:Boolean = false,cancelable:Boolean = false){
        super(type,bubbles,cancelable);
    }
}
}
