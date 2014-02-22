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
    public static const STARTUP:String = "startup";

    // Key events
    public static const KEY_DOWN:String = "key_down";
    public static const KEY_UP:String = "key_up";

    // Mouse events
    public static const MOUSE_DOWN:String = "MOUSE_DOWN";
    public static const MOUSE_UP:String = "MOUSE_UP";
    public static const MOUSE_MOVE:String = "MOUSE_MOVE";

    // Tool events
    public static const SET_TOOL:String = "SetTool";
    //
    public static const PULL_SHIFT_DOC_COORDINATES_COMMAND:String = "PULL_SHIFT_DOC_COORDINATES_COMMAND";
    public static const PUSH_SHIFT_DOC_COORDINATES_COMMAND:String = "PUSH_SHIFT_DOC_COORDINATES_COMMAND";
}
}
