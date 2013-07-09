package entities;

import com.haxepunk.graphics.Image;
import com.haxepunk.Entity;
import com.haxepunk.HXP;
import com.haxepunk.utils.Input;

class Logo extends Entity
{
    public function new() {
        super(HXP.halfWidth, HXP.halfHeight);

        var image : Image = new Image("gfx/logo.png");
        image.centerOrigin();

        addGraphic(image);

        layer = 5;
    }

    public function isDone() : Bool
    {
        if (Input.mousePressed) {
            return true;
        }

        return false;
    }
}
