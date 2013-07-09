package scenes;

import com.haxepunk.graphics.Image;
import com.haxepunk.Scene;
import com.haxepunk.HXP;
import com.haxepunk.utils.Input;

class MolyjamLogoScene extends Scene
{
    override public function begin()
    {
        var image : Image = new Image("gfx/molyjam_background.png");
        addGraphic(image);
    }

    override public function update()
    {
        super.update();

        if (Input.mousePressed) {
            HXP.scene = new ConferenceFloorScene();
        }
    }
}
