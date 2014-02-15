/**
 * Created with IntelliJ IDEA.
 * User: admin
 * Date: 14.01.14
 * Time: 11:25
 * To change this template use File | Settings | File Templates.
 */
package app.appMvc.model.applicationSettings {
import org.puremvc.as3.patterns.proxy.Proxy;

public class ApplicationSettingsProxy extends Proxy {
    public static const NAME:String = "ApplicationSettingsProxy";

    public function get settings():ApplicationSettingsVO {
        return data as ApplicationSettingsVO;
    }

    public function ApplicationSettingsProxy() {
        super(NAME, new ApplicationSettingsVO());
    }
}
}