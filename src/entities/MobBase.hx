package entities;
import com.haxepunk.HXP;
import com.haxepunk.graphics.Image;
import com.haxepunk.Entity;

class MobBase extends Entity
{
    public function new(x : Int, y : Int)
    {
        super(x, y);

        layer = 900 - y;
    }

    public override function update() : Void
    {
        super.update();
    }

    private var defaultScale : Int = 3;
}
