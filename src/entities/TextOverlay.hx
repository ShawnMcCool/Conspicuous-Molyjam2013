package entities;

import com.haxepunk.graphics.Text;
import com.haxepunk.graphics.Image;
import com.haxepunk.Entity;
import com.haxepunk.HXP;
import com.haxepunk.utils.Input;

class TextOverlay extends Entity
{
    public function new(message : String) {
        super(0, 0);

        var image : Image = new Image("gfx/backdrop.png");
        
        image.alpha = .9;
        image.x = HXP.halfWidth;
        image.y = HXP.halfHeight;
        image.centerOrigin();

        addGraphic(image);

        layer = 5;

        overlayText = new Text(message, 10, 10, 100, 20);
        overlayText.color = 0xFFFFFF;
        overlayText.size = 24;
        overlayText.layer = 4;
        addGraphic(overlayText);
    }

    public function isDone() : Bool
    {
        if (Input.mousePressed) {
            return true;
        }

        return false;
    }
    
    private var overlayText : Text;
}
