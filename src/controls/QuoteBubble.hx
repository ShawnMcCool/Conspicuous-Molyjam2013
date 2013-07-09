package controls;

import entities.MobManager;
import com.haxepunk.Scene;
import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import com.haxepunk.utils.Input;

class QuoteBubble extends Entity
{
    public function new(x : Int, y : Int, myLayer : Int)
    {
        super(x, y);

        image = new Image("gfx/balloon.png");
        image.scale = 3;

        width  = 32 * 3;
        height = 32 * 3;

        layer = myLayer;

        addGraphic(image);

        visible = false;
    }

    public function hide() : Void
    {
        visible = false;
        collidable = false;
    }

    public function show() : Void
    {
        visible = true;
        collidable = true;
    }

    public function isMouseOver() : Bool
    {
        var e : Entity = collide("mouse_cursor", x, y);

        if (e != null) {
            return true;
        }

        return false;
    }

    private var image : Image;
}