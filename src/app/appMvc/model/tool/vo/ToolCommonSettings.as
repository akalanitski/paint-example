/**
 * Created by cfe on 3/9/14.
 */
package app.appMvc.model.tool.vo {
import app.appMvc.model.document.Layer;

public class ToolCommonSettings {
    public var activeLayer:Layer = null;

    // document origin coordinates on stage
    public var docOx:Number = 0.0;
    public var docOy:Number = 0.0;

    // relative document mouse coordinates
    public var relX:Number = 0.0;
    public var relY:Number = 0.0;

    public function ToolCommonSettings() {
    }
}
}
