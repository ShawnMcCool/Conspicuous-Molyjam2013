package entities;

import com.haxepunk.Entity;
import com.haxepunk.Scene;
import com.haxepunk.utils.Input;
import com.haxepunk.HXP;

class MobManager
{
    public function new(myScene : Scene)
    {
        this.myScene = myScene;

        individuals = new Array<Individual>();
        groups = new Array<Group>();
    }

    public function addIndividual()
    {
        var newX = Std.random(964) + 30;
        var newY = Std.random(704) + 32;

        for (group in groups) {
            if (HXP.distance(newX, newY, group.x, group.y) < 100) {
                return;
            }
        }

        for (individual in individuals) {
            if (HXP.distance(newX, newY, individual.x, individual.y) < 20) {
                return;
            }
        }

        var individual : Individual = new Individual(newX, newY, getNextCharacterImage());

        individuals.push(individual);
        myScene.add(individual);
    }

    public function addMoly()
    {
        var moly : Moly = new Moly(263, 198);

        myScene.add(moly);
    }

    public function getCurrentGroup() : Group
    {
        return selectedGroup;
    }

    public function addGroup(startTime : Int, conversation : Array<String>, seriousness : String) : Group
    {
        var foundGroup : Bool;

        var newX : Int = Std.random(896) + 64;
        var newY : Int = Std.random(640) + 64;

        do {
            newX = Std.random(600) + 160;
            newY = Std.random(400) + 100;

            foundGroup = false;

            for (group in groups) {
                if (HXP.distance(newX, newY, group.x, group.y) < 120) {
                    foundGroup = true;
                }
            }
        } while(foundGroup == true);

        var group : Group = new Group(newX, newY, getNextGroupImage(), myScene, seriousness);

        group.addConversation(startTime, conversation);

        groups.push(group);
        myScene.add(group);

        return group;
    }

    public function update(time : Int)
    {
        for (group in groups) {
            group.setTime(time);
        }
    }

    public function checkForSelection() : Bool
    {
        if (groups.length > 0) {
            for (group in groups) {
                if (group.isMouseOver() && Input.mousePressed) {
                    selectGroup(group);
                    selectedGroup = group;
                    return true;
                }
            }
        }

        return false;
    }

    public function getSelectedGroupMessage()
    {
        if (selectedGroup == null) {
            return "";
        }

        return selectedGroup.getCurrentLine();
    }

    public function unselectGroup()
    {
        if (selectedGroup == null) {
            return;
        }

        selectedGroup.zoomOut(conversationBackdrop);
    }

    public function getGroups() : Array<Group>
    {
        return groups;
    }

    private var myScene : Scene;

    private var characterImageCount : Int = 68;
    private var lastUsedCharacterImage : Int = 0;

    private var groupImageCount : Int = 5;
    private var lastUsedGroupImage : Int = 0;

    private var individuals : Array<Individual>;
    private var groups : Array<Group>;

    private var conversationBackdrop : ConversationBackdrop;

    private var selectedGroup : Group;

    private function getNextCharacterImage() : String
    {
        if (++lastUsedCharacterImage > characterImageCount) {
            lastUsedCharacterImage = 1;
        }

        return "gfx/char" + Std.string(lastUsedCharacterImage) + ".png";
    }

    private function getNextGroupImage() : String
    {
        if (++lastUsedGroupImage > groupImageCount) {
            lastUsedGroupImage = 1;
        }

        return "gfx/group" + Std.string(lastUsedGroupImage) + ".png";
    }

    private function selectGroup(group : Group)
    {
        group.zoomIn(conversationBackdrop);
    }
}
