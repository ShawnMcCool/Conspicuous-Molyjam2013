package entities;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;

class Prop extends Entity
{
    public function new(x : Int, y : Int, imageName : String, layer : Int)
    {
        super(x, y);

        image = new Image(imageName);
        addGraphic(image);

        this.layer = layer;
    }

    private var image : Image;
}
