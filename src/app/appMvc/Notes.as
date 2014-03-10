/**
 * Created with IntelliJ IDEA.
 * User: admin
 * Date: 09.01.14
 * Time: 13:10
 * To change this template use File | Settings | File Templates.
 */
package app.appMvc {
public class Notes {
    // Startup event
    public static const STARTUP:String = "STARTUP";

    // Key events
    public static const KEY_DOWN:String = "KEY_DOWN";
    public static const KEY_UP:String = "KEY_UP";

    // Mouse events
    public static const MOUSE_DOWN:String = "MOUSE_DOWN";
    public static const MOUSE_UP:String = "MOUSE_UP";
    public static const MOUSE_MOVE:String = "MOUSE_MOVE";

    // app settings
    public static const ACTIVE_DOCUMENT_CHANGED:String = "ACTIVE_DOCUMENT_CHANGED";
    public static const ACTIVE_LAYER_CHANGED:String = "ACTIVE_LAYER_CHANGED";
    public static const FRONT_COLOR_CHANGED:String = "FRONT_COLOR_CHANGE";
    public static const BACK_COLOR_CHANGED:String = "BACK_COLOR_CHANGE";

    // mainWindow viewComponent
    public static const DOCUMENT_OX_CHANGED:String = "DOCUMENT_OX_CHANGED";
    public static const DOCUMENT_OY_CHANGED:String = "DOCUMENT_OY_CHANGED";

    public static const MAIN_WINDOW_MOUSE_DOWN:String = "MAIN_WINDOW_MOUSE_DOWN";
    public static const MAIN_WINDOW_MOUSE_MOVE:String = "MAIN_WINDOW_MOUSE_MOVE";
    public static const MAIN_WINDOW_MOUSE_UP:String = "MAIN_WINDOW_MOUSE_UP";

    public static const RELATIVE_MOUSE_COORDINATES_CHANGED:String = "RELATIVE_MOUSE_COORDINATES_CHANGED";

    // toolbar
    public static const TOGGLE_TOOLBAR_VISIBILITY:String = "TOGGLE_TOOLBAR_VISIBILITY";
    public static const CURRENT_TOOL_CHANGED:String = "CURRENT_TOOL_CHANGED";
}
}
