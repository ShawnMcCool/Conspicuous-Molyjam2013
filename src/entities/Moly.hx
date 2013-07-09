package entities;

import com.haxepunk.graphics.Spritemap;

class Moly extends MobBase
{
    public function new(x : Int, y : Int)
    {
        super(x, y);

        image = new Spritemap("gfx/molyneux.png", 32, 32);
        image.scale = defaultScale;

        image.add("kiss", [0, 1, 2, 3, 4, 5, 4, 3, 2, 1], 8, true);
        image.play("kiss");

        image.centerOrigin();
        addGraphic(image);
    }

    private var image : Spritemap;
}
