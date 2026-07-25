import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.FlxSprite;

public static var DebugMode:Bool = true;

function postCreate() {
    var nightColor:Int = 0xFF51557A;

    bg.color = nightColor;
    flatgrass.color = nightColor;
    hills.color = nightColor;
    farmhouse.color = nightColor;
    grassLand.color = nightColor;
    cornFence.color = nightColor;
    cornFence2.color = nightColor;
    sign.color = nightColor;

    dad.color = nightColor;
    boyfriend.color = nightColor;
    gf.color = nightColor;

    var darkOverlay:FlxSprite = new FlxSprite(-600, -200).makeGraphic(Std.int(FlxG.width * 3), Std.int(FlxG.height * 3), 0x44000000);
    darkOverlay.scrollFactor.set(0.3, 0.3);
    darkOverlay.camera = camGame;
    add(darkOverlay);
}
