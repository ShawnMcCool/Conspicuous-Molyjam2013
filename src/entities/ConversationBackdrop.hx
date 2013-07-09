package entities;

import com.haxepunk.graphics.Image;
import com.haxepunk.Entity;
import com.haxepunk.HXP;

class ConversationBackdrop extends Entity
{
    public function new()
    {
        super(HXP.halfWidth, HXP.halfHeight);

        var image : Image = new Image("gfx/conversation_background.png");
        image.centerOrigin();
        image.layer = 7;
        addGraphic(image);

        layer = 50;
        off();
    }

    public function on() : Void
    {
        visible = true;
    }

    public function off() : Void
    {
        visible = false;
    }
}
