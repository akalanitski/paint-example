/**
 * Created by cfe on 17.12.13.
 */
package app {
import flash.display.Sprite;
import flash.events.Event;

public class AppCanvas extends Sprite {

    public function AppCanvas() {

    }

    public function clearCanvas(event:Event):void {
        this.graphics.clear();
    }
}
}
