package scenes;

import entities.Prop;
import entities.Timer;
import com.haxepunk.Sfx;
import com.haxepunk.graphics.Backdrop;
import entities.ArrestButton;
import com.haxepunk.Entity;
import entities.Logo;
import com.haxepunk.utils.Key;
import flash.text.TextFormatAlign;
import com.haxepunk.graphics.Text;
import conversations.Conversations;
import entities.ConversationBackdrop;
import controls.MouseCursor;
import entities.Group;
import controls.QuoteBubble;
import entities.MobManager;
import com.haxepunk.graphics.Image;
import com.haxepunk.Scene;
import entities.ConferenceBackground;
import com.haxepunk.utils.Input;
import com.haxepunk.HXP;

class ConferenceFloorScene extends Scene
{
    public function new()
    {
        super();

        mobManager = new MobManager(this);
        conversations = new Conversations();

        sound = new Sfx("sfx/conference_floor.mp3");

        sound.loop();
    }

    public override function begin()
    {
        timer = new Timer();
        timer.visible = false;
        add(timer);

        // conversation ui
        conversationText = new Text("", 200, 80, 1000, 0, {
        color: 0xFFFFFF,
        align: TextFormatAlign.LEFT,
        size: 20,
        resizable: true
        });

        addGraphic(conversationText);

        conversationStartDelays = [5, 10, 30, 60, 90];
        conversationStartDelays.sort(function(a:Int, b:Int) : Int
        {
            var random = Std.random(3);
            random -= 1;

            return random;
        });

        // mouse cursor
        var mouseCursor = new MouseCursor();
        add(mouseCursor);

        // background
        add(new ConferenceBackground());

        // add mobs
        mobManager.addGroup(conversationStartDelays.pop(), conversations.getSerious(), "s");

        for (i in 1...5) {
            mobManager.addGroup(conversationStartDelays.pop(), conversations.getFunny(), "f");
        }

        for (i in 1...160) {
            mobManager.addIndividual();
        }

        mobManager.addMoly();

        addForeground();

        // logo
        logo = new Logo();
        add(logo);

        // arrest button
        arrestButton = new ArrestButton();
        add(arrestButton);
    }

    public function gameTimerStart() : Void
    {
        running = true;

        startTime = Std.int(haxe.Timer.stamp());
        timer.visible = true;
    }

    public override function update() : Void
    {
        super.update();
        updateTimer();
        mobManager.update(getCurrentTime());

        if (gameState == 0) {
            if (logo.isDone()) {
                remove(logo);

                introMessage = new entities.TextOverlay("Agent,

We have received intel of a highly dangerous threat to national
security near an LA convention center. The convention center is
currently housing over 10,000 people for a popular Video Game Expo.
We want you too locate and mark any individuals who might be
performing or talking about suspicious activity.

Click on the text bubbles to overhear a single conversation.
Once you find someone who might be ready to commit a crime,
press the ARREST button and we'll call in a SWAT team.
You have 2 minutes before we order a full evacuation of the entire expo.
See if you can catch this perpetrator before all hell breaks lose.

Good luck.
Click to continue.");
                add(introMessage);

                gameState = 1;
            }
        } else if (gameState == 1) {
            if (introMessage.isDone()) {
                remove(introMessage);
                gameState = 2;
                gameTimerStart();
            }
        } else if (gameState == 2) {
            if (mobManager.checkForSelection()) {
                gameState = 3;
                arrestButton.visible = true;
            }
        } else if(gameState == 3) {
            if (Input.mousePressed) {
                if (arrestButton.isMouseOver()) {
                    sound.stop();
                    HXP.scene = new InvasionScene(mobManager.getCurrentGroup());
                }

                mobManager.unselectGroup();
                gameState = 2;
                conversationText.text = "";
                arrestButton.visible = false;
                return;
            }

            conversationText.layer = 4;
            conversationText.text = mobManager.getSelectedGroupMessage();
            conversationText.x = HXP.halfWidth - conversationText.textWidth / 2;
        }
    }

    public function getCurrentTime() : Int
    {
        if ( ! running) {
            return 0;
        }

        return currentTime - startTime;
    }

    private function addForeground() : Void
    {
        add(new Prop(19, 409, "gfx/foreground_bunnycropped.png", 359));
        add(new Prop(769, 220, "gfx/foreground_dragoncropped.png", 438));
        add(new Prop(644, 29, "gfx/foreground_gearscropped2.png", 841));
        add(new Prop(117, 18, "gfx/foreground_Qstandcropped.png", 812));
        add(new Prop(30, 130, "gfx/foreground_teleportercropped.png", 670));
        add(new Prop(120, 408, "gfx/foreground_ratatacropped1.png", 400));
        add(new Prop(105, 602, "gfx/foreground_ratatacropped2.png", 300));
    }

    private function updateTimer() : Void
    {
        currentTime = Std.int(haxe.Timer.stamp());

        if (running) {
            var timerSeconds = Std.int(timeLimit - getCurrentTime());
            timer.setTime(timerSeconds);
        }

        if (getCurrentTime() == timeLimit) {
            sound.stop();
            HXP.scene = new EvacuationScene();
        }
    }

    private var mobManager : MobManager;
    private var conversations : Conversations;
    private var gameState : Int = 0;

    private var timeLimit : Int = 120;
    private var startTime : Int = 0;
    private var currentTime : Int = 0;
    private var running : Bool = false;

    private var timerText : Text;
    private var conversationText : Text;

    private var conversationStartDelays : Array<Int>;

    private var logo : Logo;
    private var introMessage : entities.TextOverlay;
    private var arrestButton : ArrestButton;
    private var timer: Timer;
    private var sound : Sfx;
    // 0 conference floor
    // 1 conversation
}
