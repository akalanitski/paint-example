/**
 * Created with IntelliJ IDEA.
 * User: admin
 * Date: 14.01.14
 * Time: 11:25
 * To change this template use File | Settings | File Templates.
 */
package app.appMvc.model.color {
import org.puremvc.as3.patterns.proxy.Proxy;

public class ApplicationSettingsProxy extends Proxy{
    public static const NAME:String = "ColorProxy";
    public function get color():ApplicationSettings{return data as ApplicationSettings;}
    public function set color(newColor:ApplicationSettings):void{this.color.setColor(newColor);}
    public function ApplicationSettingsProxy(name:String=null) {
        super(NAME, new ApplicationSettings());
    }
}
}