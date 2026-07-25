import flixel.text.FlxTextBorderStyle;
import flixel.text.FlxTextAlign;

var botplayTxt:FlxText;
static var curBotplay:Bool = false;
curBotplay = false;

function postCreate() {
	botplayTxt = new FlxText(0, 0, null, 'BOTPLAY', 32);
	botplayTxt.setFormat(Paths.font("vcr.ttf"), 32, FlxColor.WHITE, FlxTextAlign.CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
	botplayTxt.visible = curBotplay;
	botplayTxt.borderSize = 1.25;
	botplayTxt.camera = camHUD;
	add(botplayTxt);
}

public var botplaySine:Float = 0;
function update(elapsed:Float) {
	if (FlxG.keys.justPressed.F4) curBotplay = !curBotplay;
	for (strumLine in strumLines) {
		if (!strumLine.opponentSide)
			strumLine.cpu = FlxG.keys.pressed.FIVE || curBotplay;
	}

	botplayTxt.visible = curBotplay;
	botplayTxt.x = healthBar.x + (healthBar.width / 2) - (botplayTxt.width / 2);
	botplayTxt.y = healthBar.y - 36;

	if (curBotplay) {
		botplaySine += 180 * elapsed;
		botplayTxt.alpha = 1 - Math.sin((Math.PI * botplaySine) / 180);
	}
}

function onNoteHit(event) {
	if (curBotplay && !event.note.strumLine.opponentSide) {
		health += 0.04;
	}
}