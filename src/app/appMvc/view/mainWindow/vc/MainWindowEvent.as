/**
 * Created by cfe on 21.02.14.
 */
package app.appMvc.view.mainWindow.vc {
import flash.events.Event;

public class MainWindowEvent extends Event {
    public static const MOUSE_DOWN:String = "MOUSE_DOWN";
    public static const MOUSE_MOVE:String = "MOUSE_MOVE";
    public static const MOUSE_UP:String = "MOUSE_UP";
    public var data:Object;

    public function MainWindowEvent(type:String, data:Object = null, bubbles:Boolean = false, cancelable:Boolean = false) {
        super(type, bubbles,cancelable);
        this.data = data;
    }
}
}
