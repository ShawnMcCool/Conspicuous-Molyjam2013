package scenes;

import com.haxepunk.graphics.Image;
import com.haxepunk.Scene;
import com.haxepunk.utils.Input;
import com.haxepunk.HXP;
import scenes.ConferenceFloorScene;

class BypassSceneBase extends Scene
{
    public function new(sceneName : String)
    {
        super();
        nextScene = sceneName;
    }

    public function update()
    {
        if (Input.mousePressed) {
            HXP.scene = Type.resolveClass(nextScene);
        }
    }

    private var nextScene : String;
}
