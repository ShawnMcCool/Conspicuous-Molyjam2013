package entities;

import com.haxepunk.graphics.Image;
import com.haxepunk.Entity;
import com.haxepunk.HXP;

class ConferenceBackground extends Entity
{
    public function new() {
        super(HXP.halfWidth, HXP.halfHeight);

        var image : Image = new Image("gfx/conference_background.png");
        image.centerOrigin();

        addGraphic(image);

        layer = 65535;
    }
}
