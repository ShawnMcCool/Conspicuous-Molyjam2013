package entities;

import com.haxepunk.graphics.Image;

class Individual extends MobBase
{
    public function new(x : Int, y : Int, imageName : String)
    {
        super(x, y);

        image = new Image(imageName);
        image.scale = defaultScale;

        image.centerOrigin();
        addGraphic(image);
    }

    private var image : Image;
}
