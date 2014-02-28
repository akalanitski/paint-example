package app.appMvc.model.tool {
import org.puremvc.as3.patterns.mediator.Mediator;

public class ToolMediator extends Mediator {
    public static const NAME:String = "ToolMediator";
    private var _toolProxy:ToolProxy;
    public function ToolMediator() {super(NAME);}

    override public function onRegister():void {
        _toolProxy = facade.retrieveProxy(ToolProxy.NAME) as ToolProxy;
    }
}
}
