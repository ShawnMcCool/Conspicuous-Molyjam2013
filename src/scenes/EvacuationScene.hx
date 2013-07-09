package scenes;

import entities.TextOverlay;
import entities.EndingBackdrop;
import entities.EndingBackdrop;
import com.haxepunk.Sfx;
import com.haxepunk.graphics.Text;
import com.haxepunk.graphics.Image;
import com.haxepunk.Scene;
import entities.EndingBackdrop;
import com.haxepunk.HXP;

class EvacuationScene extends Scene
{
    public function new()
    {
        super();

        sceneSound = new Sfx("sfx/evacuation.mp3");
        sceneSound.play();

        setBackground("gfx/evacuation_background.png");
        startTimer();
    }

    override public function update() : Void
    {
        if (getCurrentTime() > 4 && textOverlay == null) {
            textOverlay = new TextOverlay("Agent,

The convention center has been cleared but you failed to identify any
suspects.

Even though we might have prevented a catastrophe, a potential killer
or terrorist could still be on the loose.

Your efforts have not rewarded you with any special medal.

We hope you perform better next time.");
            add(textOverlay);
        }

        if (textOverlay != null && textOverlay.isDone()) {
            sceneSound.stop();
            HXP.scene = new MolyjamLogoScene();
        }
    }

    private function startTimer() : Void
    {
        startTime = Std.int(haxe.Timer.stamp());
    }

    private function setBackground(imageName : String) : Void
    {
        var image : Image = new Image(imageName);
        image.layer = 10;
        addGraphic(image);
    }

    private function getCurrentTime() : Int
    {
        return Std.int(haxe.Timer.stamp()) - startTime;
    }

    private var startTime : Int;
    private var textOverlay : TextOverlay;

    private var sceneSound : Sfx;
}
