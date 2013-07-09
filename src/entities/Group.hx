package entities;

import flash.geom.Point;
import entities.ConversationBackdrop;
import com.haxepunk.graphics.Spritemap;
import com.haxepunk.Entity;
import com.haxepunk.Scene;
import controls.QuoteBubble;
import flash.geom.Point;
import com.haxepunk.graphics.Image;
import com.haxepunk.tweens.motion.LinearPath;
import com.haxepunk.HXP;

class Group extends MobBase
{
    public var quoteBubble : QuoteBubble;
    public var backdrop : ConversationBackdrop;
    public var seriousness : String;

    public function new(x : Int, y : Int, imageName : String, myScene : Scene, seriousness)
    {
        super(x, y);

        this.seriousness = seriousness;
        image = new Spritemap(imageName, 64, 64);
        image.scale = defaultScale;
        image.centerOrigin();
        image.add("stand", [0, 1, 2, 3, 3, 3, 3, 2, 1, 2, 0, 0, 3, 3, 3, 3, 3, 0, 0, 1, 2], 2, true);
        addGraphic(image);
        image.play("stand");

        this.myScene = myScene;

        quoteBubble = new QuoteBubble(x, y - 140, y-1);
        myScene.add(quoteBubble);
        quoteBubble.layer = layer;

        originalPosition = new Point(x, y);

        backdrop = new ConversationBackdrop();
        myScene.add(backdrop);
    }

    public function setTime(i : Int) : Void
    {
        currentTime = i;
    }

    override public function update() : Void
    {
        super.update();

        if (getCurrentLine() != null) {
            quoteBubble.show();
        } else {
            quoteBubble.hide();
        }
    }

    public function addConversation(conversationStartTime : Int, conversation : Array<String>)
    {
        this.conversation = conversation;
        this.conversationStartTime = conversationStartTime;
        this.conversationEndTime = conversationStartTime + (conversationTimeStep * conversation.length);
    }

    public function getCurrentLine() : String
    {
        if (currentTime == 0 || currentTime < conversationStartTime || currentTime > conversationEndTime) {
            return null;
        }

        var conversationTime : Int = Std.int(currentTime - conversationStartTime);
        var currentStep : Int = Math.floor(conversationTime / conversationTimeStep);

        return conversation[currentStep];
    }

    public function isMouseOver() : Bool
    {
        var e : Entity = collide("mouse_cursor", x, y);

        if (e != null || quoteBubble.isMouseOver()) {
            return true;
        }

        return false;
    }

    public function zoomIn(conversationBackdrop : ConversationBackdrop) : Void
    {
        backdrop.on();
        image.scale = 10;
        x = HXP.halfWidth;
        y = HXP.halfHeight;
        oldLayer = layer;
        layer = 0;
    }

    public function zoomOut(conversationBackdrop : ConversationBackdrop) : Void
    {
        backdrop.off();
        image.scale = defaultScale;
        x = originalPosition.x;
        y = originalPosition.y;
        layer = oldLayer;
    }

    private var image : Spritemap;
    private var myScene : Scene;
    private var oldLayer : Int;
    private var originalPosition : Point;
    private var conversation : Array<String>;

    private var currentTime : Int = 0;
    public var conversationStartTime : Int;
    public var conversationEndTime : Int;
    private var conversationTimeStep : Int = 4;
}
