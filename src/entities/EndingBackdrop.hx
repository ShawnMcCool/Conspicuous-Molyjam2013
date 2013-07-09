package entities;

import com.haxepunk.graphics.Text;
import com.haxepunk.graphics.Image;
import com.haxepunk.Entity;
import com.haxepunk.HXP;

class EndingBackdrop extends Entity
{
    public function new() {
        super(HXP.halfWidth, 32);

        var image : Image = new Image("gfx/timer.png");
        image.scale = 2;
        image.centerOrigin();
        image.layer = 5;
        addGraphic(image);

        layer = 5;

// text
        timerText = new Text("", -40, -16, 100, 20);
        timerText.color = 0xFF4444;
        timerText.visible = true;
        timerText.size = 40;
        timerText.layer = 4;
        addGraphic(timerText);
    }

    public function setTime(timerSeconds : Int) : Void
    {
        var minutes : Int = timerSeconds == 120 ? 2 : (timerSeconds > 59 ? 1 : 0);
        var seconds : Int = timerSeconds - minutes * 60;
        if (seconds < 0) seconds = 0;

        var secondString : String = Std.string(seconds);

        if (secondString.length == 1) secondString = "0" + secondString;

        timerText.text = minutes + ":" + secondString;
    }

    private var timerText : Text;
}
