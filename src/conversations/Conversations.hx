package conversations;

class Conversations
{
    public function new()
    {
        loadConversations();
    }

    public function loadConversations() : Void
    {
        serious = new Array<Array<String>>();
        funny = new Array<Array<String>>();

        loadInternal();
        randomizeCounters();
    }

    private function loadInternal() : Void
    {
        var document : String = "|1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|
s|Hey Steve.|Hey.|You got your shit with you?|Yeah, wait, not sure if I should show it here though.|Yeah, yeah, I get it.|Let's meet up outside okay?|Sure thing, I'll see you soon.
f|So I shot this guy in the head.|And he just rushes up to me, with a big hole in his face.|Awesome.|I know right, like fuck realism.|Did you get the bomb?|Nah man. We got rushed by all those soldiers.|It's pretty difficult, I know.|But the bomb's still there.|So I could join you like right now, and we could find the bomb together?|Yeah, what do you call that, Drop-in co-op?|Yeah I think so.|Hey, I'm going to play that Zelda knock-off.|Haha, yeah I want to have a look at that.
f|It's just fucking annoying you know.|And they don't shut up about it either.|Yeah, so like, I once had this guy who just came to me.|And he just grabbed me, and I was like, dude what the fuck.|Yeah, and they just think they can just get away with that too.|Yeah, suckers.|I know right. But hey, did anyone bother you yet?|Nah, it depends on how you dress I suppose.|Yeah, you don't wanna be drawing too much attention to yourself.|I know, drawing attention is a bad thing to do in such a situation.
f|I don't know man.|C'mon, it'll be fun!|I just, I dunno. It's not allowed.|No one's gonna notice.|They won't notice if we're lucky.|Dude, there's so many people!|Exactly, and all those people can see us.|Just imagine you see someone cut through a line.|Would you go like: Hey stop you criminal scum!|Actually, I think I would yeah.|No, that's not the point. Nevermind.|If you don't wanna help me, I'll do it on my own.|It's also sort off derogatory to women.|Yeah whatever.|Hey, I'm gonna head over to the toilet.|Yeah, let's go play some games.
f|People die all the time man.|Yeah, but that doesn't make it right.|Like, if you could choose who lives or dies.|You'd be like a god.|And that's the point, no one should have that kind of power.|I think you're reading way to much into this man.|I know, <laughs> but at least they thought about it.|I don't really think they thought about it at all man.|But it's all about killing as many people as possible.|Nah man, it's not murder. It's more like dodgeball.|Just imagine if you were to kill that guy over there.|Ugh, not sure if we should be talking about this man.|Haha, yeah sure.|Hey, I'm gonna head over there and see if I can play that robot game.|Yeah good luck with that, see ya.
f|And they will run around screaming and shit.|Haha, yeah I can't wait.|The main problem I had with the fourth game, was how serious it was trying to be.|Well there's always a sense of satire in all their games.|And even then, you can always play that game over there.|Didn't they go bankrupt?|Nah, the publisher did though.|And they're releasing a sequel already?|Yeah, it should have just been DLC.|You got superpowers this time don't you?|I think that warrants a full purchase!|Yeah, let's go try it out.
f|I'm gonna kill that guy.|What did he do?|He just walks past, and spills his beer all over my shirt.|What an asshole.|Hey do you guys wanna do some shooting?|They got an Oculus Rift set up with all the latest games.|That, I want to do. like, right now.|Haha, come on, let's head over there.
f|Did someone see my crowbar?|Seriously dude?|I left it here somewhere, and now it's gone.|You'd expect to see a lot of those around here. <laughter>|Very funny.|Hey, I'm gonna head over to the bar.|Yeah, let me come with you.|Yeah I need to drink something too.
f|Be quiet!|Why? Who's gonna hear us?|They're making an announcement!|Watch out for pickpockets? Seriously?|Who would steal anything here?|Yeah right, we're gamers, we never do illegal stuff.|I see what you did there.|You guys seriously pirate?|Hey, I'm broke man, I haven't got a choice.|Then maybe you should get a job.|Got too much games to play!
f|I wish I had a flamethrower.|Do you even know how to use a flamethrower?|No, although I'm sure I could google it.|Do you even know a type of fuel a flamethrower uses?|Eh, kerosine?|It says here that they use propane.|So you'd have to buy lots of propane.|And fuel, they use gas and fuel you see.|What type of fuel.|I dunno, though I do wonder.|If a Sniper would shoot a Pyro in his fuel tank, shouldn't it like, explode?|You should play ArmA if you want realism man. |But it'd be funny right.|It'd be useful for spies!|Hey, I'm gonna grab something to eat, anyone want to join?|Yeah sounds great, let's go.
s|How many people does this expo even have?|A lot.|Over nine thousand I guess.|We're looking at something big then.|Yeah no shit.|So are we prepared?|I just need to flag the van, but yeah, I'm cool.|Tomorrow at 9 PM.|Gotcha.|Sounds like a plan.
f|So when do we attack?|We'll attack tomorrow.|Yeah, we'll head in with groups of five, maybe six.|They won't expect a thing.|They are sooo dead man.|So when do we make the hit on the mothership?|We ignore the mothership and attack the smaller freighters first.|The more players disconnect, the better.|Okay, hey I'm gonna try the Space MMO, see ya later guys.|Yeah, good luck with that.
f|I seriously had trouble standing up last time.|I know right, that shit is heavy.|Yeah, it messes with your head.|Where did you get it last time?|I bought it from my neighbor, he can get you anything.|So what, does he like work for a drug cartel or something?|Something like that. I dunno man.|Holy shit, that's pretty fucked up.|Yeah he's even been to jail you know.|But he's like a really nice guy.|Hey guys, should we meet up at this booth at nine?|Sure thing, see ya later man.|Yeah, see ya.";

        var rows : Array<String> = document.split("\n");

        for (row in rows) {
            var line : Array<String> = row.split("|");

            switch(line[0])
            {
                case "s":
                    var tempSerious : Array<String> = new Array<String>();

                    for (sentence in line.splice(1, line.length)) {
                        if (StringTools.trim(sentence) != "") {
                            tempSerious.push(sentence);
                        }
                    }

                    serious.push(tempSerious);
                case "f":
                    var tempFunny : Array<String> = new Array<String>();

                    for (sentence in line.splice(1, line.length)) {
                        if (StringTools.trim(sentence) != "") {
                            tempFunny.push(sentence);
                        }
                    }

                    funny.push(tempFunny);
                case "":
            }
        }
    }

    public function getFunny() : Array<String>
    {
        funnyCounter = funny[++funnyCounter] != null ? funnyCounter : 0;

        return funny[funnyCounter];
    }

    public function getSerious() : Array<String>
    {
        seriousCounter = serious[++seriousCounter] != null ? seriousCounter : 0;

        return serious[seriousCounter];
    }

    private function randomizeCounters() : Void
    {
        seriousCounter = Std.random(serious.length +1);
        funnyCounter   = Std.random(funny.length +1);
    }

    private var serious : Array<Array<String>>;
    private var funny : Array<Array<String>>;

    private var funnyCounter : Int;
    private var seriousCounter : Int;
}
