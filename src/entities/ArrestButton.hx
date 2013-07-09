package entities;

import com.haxepunk.graphics.Image;
import com.haxepunk.Entity;
import com.haxepunk.HXP;

class ArrestButton extends Entity
{
    public function new() {
        super(HXP.halfWidth - 192/2, HXP.height - 32*3);

        var image : Image = new Image("gfx/arrest.png");

        width = 192;
        height = 96;

        addGraphic(image);

        layer = 2;
        visible = false;
    }

    public function isMouseOver() : Bool
    {
        var e : Entity = collide("mouse_cursor", x, y);

        if (e != null) {
            return true;
        }

        return false;
    }
}
