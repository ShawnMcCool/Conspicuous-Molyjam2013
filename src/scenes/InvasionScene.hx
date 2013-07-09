package scenes;

import com.haxepunk.HXP;
import entities.TextOverlay;
import entities.EndingBackdrop;
import com.haxepunk.Sfx;
import com.haxepunk.graphics.Text;
import com.haxepunk.graphics.Image;
import com.haxepunk.Scene;
import entities.Group;

class InvasionScene extends Scene
{
    public function new(group : Group)
    {
        super();

        sceneSound = new Sfx("sfx/invasion.mp3");

        sceneSound.play();

        selectedGroup = group;

        funnyEndings = new Array<String>();
        seriousEndings = new Array<String>();

        startTimer();
        setBackground("gfx/invasion_background.png");

        addEndings();
    }

    override public function update() : Void
    {
        super.update();

        if (getCurrentTime() > 4 && textOverlay == null) {
            var text : String;

            if (selectedGroup.seriousness == "s") {
                text = seriousEndings[0];
            } else {
                text = funnyEndings[Std.random(3)];
            }

            textOverlay = new TextOverlay(text);
            add(textOverlay);

            return;
        }

        if (textOverlay != null && textOverlay.isDone()) {
            sceneSound.stop();
            HXP.scene = new MolyjamLogoScene();
        }
    }

    private function setBackground(imageName : String) : Void
    {
        var image : Image = new Image(imageName);
        image.layer = 10;
        addGraphic(image);
    }

    private function startTimer() : Void
    {
        startTime = Std.int(haxe.Timer.stamp());
    }

    private function getCurrentTime() : Int
    {
        return Std.int(haxe.Timer.stamp()) - startTime;
    }

    private function addEndings() : Void
    {
        funnyEndings.push("Congratulations Agent.

After many sessions of interrogation we managed to retrieve valuable
information from the suspect in custody.

After having searched the suspect's home apartment, we found an ornate
sword and many strange costumes. The subject insisted that the sword
and outfits were used for a certain form of re-enactment known as
\"larping\".

We have closed the investigation.

The suspect has been dealt with accordingly.

Although claims of the suspect's innocence have been reported all over the
media, we believe your judgment was of a just cause.");

        funnyEndings.push("Congratulations Agent.

After many sessions of interrogation we managed to retrieve valuable
information from the suspect in custody.

The suspect you marked was in possession of graphically violent software
and traces of marijuana were found in his apartment.

Although the suspect denied any involvement in terrorist activities, we
found out that the subject had been creating a virtual environment which
he simulated a public area in which he could keep people hostage against
police forces and plant explosives. A terrorism simulator.

We have closed the investigation.

The suspect has been dealt with accordingly.

Although claims of the suspect's innocence have been reported all over the
media, we believe your judgment was of a just cause.");

        funnyEndings.push("Congratulations Agent.

After many sessions of interrogation we managed to retrieve valuable
information from the suspect in custody.

The suspect you marked was in possession of electronics of unknown
origin, including a plastic glove covered in buttons, like a control
device of sorts.

Although the subject denied having performed any terrorist activity.
We found a host of illegally modified and hacked electronic equipment
hidden within the subject's garage.

We have closed the investigation.

The suspect has been dealt with accordingly.

Although claims of the suspect's innocence have been reported all over
the media, we believe your judgment was of a just cause.");

        seriousEndings.push("Congratulations Agent.

After many sessions of interrogation we managed to retrieve valuable
information from the suspect in custody.

The subject was in possession of a firearm.

Interrogation revealed the subject had intended to use the firearm for
fanatical purposes.

Although the subject denied having any assistance from outside sources,
we discovered large amounts of money had been transferred to his account.

We will continue the investigation.

The suspect has been dealt with accordingly.

You have earned the gold medal for your great efforts.");
    }

    private var startTime : Int;
    private var textOverlay : TextOverlay;
    private var selectedGroup : Group;

    private var funnyEndings : Array<String>;
    private var seriousEndings : Array<String>;

    private var sceneSound : Sfx;
    }
