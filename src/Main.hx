import scenes.EvacuationScene;
import scenes.MolyjamLogoScene;
import scenes.InvasionScene;
import entities.MobManager;
import scenes.ConferenceFloorScene;
import com.haxepunk.Engine;
import com.haxepunk.HXP;

class Main extends Engine
{
    private var mobManager : MobManager;

	override public function init()
	{
#if debug
		HXP.console.enable();
#end

		HXP.scene = new MolyjamLogoScene();
	}

	public static function main() { new Main(); }

}