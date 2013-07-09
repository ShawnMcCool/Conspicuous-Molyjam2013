package controls;

import com.haxepunk.graphics.Image;
import com.haxepunk.Entity;
import com.haxepunk.utils.Input;

class MouseCursor extends Entity {
    public function new() {
        super(0, 0);

        type = "mouse_cursor";

        width  = 4;
        height = 4;
    }

    override public function update() : Void {
        super.update();

        x = Input.mouseX;
        y = Input.mouseY;
    }
}
