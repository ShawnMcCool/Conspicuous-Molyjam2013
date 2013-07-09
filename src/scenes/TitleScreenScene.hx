package scenes;

import com.haxepunk.graphics.Image;
import com.haxepunk.Scene;

class TitleScreenScene extends BypassSceneBase
{
    public function new()
    {
        super();

        var image : Image = new Image("gfx/logo.png");
        addGraphic(image);
    }
}
