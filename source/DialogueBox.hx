package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.text.FlxTypeText;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxSpriteGroup;
import flixel.input.FlxKeyManager;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;

using StringTools;

class DialogueBox extends FlxSpriteGroup
{
	var box:FlxSprite;

	var curCharacter:String = '';

	var dialogue:Alphabet;
	var dialogueList:Array<String> = [];

	// SECOND DIALOGUE FOR THE PIXEL SHIT INSTEAD???
	var swagDialogue:FlxTypeText;

	var dropText:FlxText;

	public var finishThing:Void->Void;

	var portraitLeft:FlxSprite;
	var portraitRight:FlxSprite;

	var bf:FlxSprite;
	var gf:FlxSprite;
	var gf_bruh:FlxSprite;
	var gf_brave:FlxSprite;
	var gf_paper:FlxSprite;
	var gf_paper_confused:FlxSprite;
	var gf_wink:FlxSprite;
	var mage:FlxSprite;
	var mage_confused:FlxSprite;
	var mage_excited:FlxSprite;
	var mage_happy:FlxSprite;
	var mage_passion:FlxSprite;
	var mage_love:FlxSprite;
	var mage_smile:FlxSprite;
	var alicia_gloat:FlxSprite;

	var handSelect:FlxSprite;
	var bgFade:FlxSprite;

	public function new(talkingRight:Bool = true, ?dialogueList:Array<String>)
	{
		super();

		switch (PlayState.SONG.song.toLowerCase())
		{
			case 'senpai':
				FlxG.sound.playMusic(Paths.music('Lunchbox'), 0);
				FlxG.sound.music.fadeIn(1, 0, 0.8);
			case 'thorns':
				FlxG.sound.playMusic(Paths.music('LunchboxScary'), 0);
				FlxG.sound.music.fadeIn(1, 0, 0.8);
		}

		bgFade = new FlxSprite(-200, -200).makeGraphic(Std.int(FlxG.width * 1.3), Std.int(FlxG.height * 1.3), 0xFFB3DFd8);
		bgFade.scrollFactor.set();
		bgFade.alpha = 0;
		add(bgFade);

		new FlxTimer().start(0.83, function(tmr:FlxTimer)
		{
			bgFade.alpha += (1 / 5) * 0.7;
			if (bgFade.alpha > 0.7)
				bgFade.alpha = 0.7;
		}, 5);

		box = new FlxSprite(-20, 45);
		
		var hasDialog = false;
		switch (PlayState.SONG.song.toLowerCase())
		{
			case 'senpai':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('weeb/pixelUI/dialogueBox-pixel');
				box.animation.addByPrefix('normalOpen', 'Text Box Appear', 24, false);
				box.animation.addByIndices('normal', 'Text Box Appear', [4], "", 24);
			case 'roses':
				hasDialog = true;
				FlxG.sound.play(Paths.sound('ANGRY_TEXT_BOX'));

				box.frames = Paths.getSparrowAtlas('weeb/pixelUI/dialogueBox-senpaiMad');
				box.animation.addByPrefix('normalOpen', 'SENPAI ANGRY IMPACT SPEECH', 24, false);
				box.animation.addByIndices('normal', 'SENPAI ANGRY IMPACT SPEECH', [4], "", 24);

			case 'thorns':
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('weeb/pixelUI/dialogueBox-evil');
				box.animation.addByPrefix('normalOpen', 'Spirit Textbox spawn', 24, false);
				box.animation.addByIndices('normal', 'Spirit Textbox spawn', [11], "", 24);

				var face:FlxSprite = new FlxSprite(320, 170).loadGraphic(Paths.image('weeb/spiritFaceForward'));
				face.setGraphicSize(Std.int(face.width * 6));
				add(face);
			case 'spiders' | 'beetlebox' | 'blowaway':
				hasDialog = true;
				box = new FlxSprite().loadGraphic(Paths.image('textbox'));
		}

		this.dialogueList = dialogueList;
		
		if (!hasDialog)
			return;
		
		//switch (PlayState.SONG.song.toLowerCase())
		//{
			//case 'senpai' | 'roses' | 'thorns':
				portraitLeft = new FlxSprite(-20, 40);
				portraitLeft.frames = Paths.getSparrowAtlas('weeb/senpaiPortrait');
				portraitLeft.animation.addByPrefix('enter', 'Senpai Portrait Enter', 24, false);
				portraitLeft.setGraphicSize(Std.int(portraitLeft.width * PlayState.daPixelZoom * 0.9));
				portraitLeft.updateHitbox();
				portraitLeft.scrollFactor.set();
				add(portraitLeft);
				portraitLeft.visible = false;

				portraitRight = new FlxSprite(0, 40);
				portraitRight.frames = Paths.getSparrowAtlas('weeb/bfPortrait');
				portraitRight.animation.addByPrefix('enter', 'Boyfriend portrait enter', 24, false);
				portraitRight.setGraphicSize(Std.int(portraitRight.width * PlayState.daPixelZoom * 0.9));
				portraitRight.updateHitbox();
				portraitRight.scrollFactor.set();
				add(portraitRight);
				portraitRight.visible = false;
			//default:
				bf = new FlxSprite(716, 196).loadGraphic(Paths.image('dialogue/bf'));
				add(bf);
				bf.visible = false;

				gf = new FlxSprite(803, 253).loadGraphic(Paths.image('dialogue/gf'));
				gf.setGraphicSize(Std.int(gf.width * 1.4960));
				add(gf);
				gf.visible = false;

				gf_bruh = new FlxSprite(803, 253).loadGraphic(Paths.image('dialogue/gf_bruh'));
				gf_bruh.setGraphicSize(Std.int(gf_bruh.width * 1.4960));
				add(gf_bruh);
				gf_bruh.visible = false;

				gf_brave = new FlxSprite(803, 253).loadGraphic(Paths.image('dialogue/gf_brave'));
				gf_brave.setGraphicSize(Std.int(gf_brave.width * 1.4960));
				add(gf_brave);
				gf_brave.visible = false;

				gf_paper = new FlxSprite(803, 253).loadGraphic(Paths.image('dialogue/gf_paper'));
				gf_paper.setGraphicSize(Std.int(gf_paper.width * 1.4960));
				add(gf_paper);
				gf_paper.visible = false;

				gf_paper_confused = new FlxSprite(803, 253).loadGraphic(Paths.image('dialogue/gf_paper_confused'));
				gf_paper_confused.setGraphicSize(Std.int(gf_paper_confused.width * 1.4960));
				add(gf_paper_confused);
				gf_paper_confused.visible = false;

				gf_wink = new FlxSprite(803, 253).loadGraphic(Paths.image('dialogue/gf_wink'));
				gf_wink.setGraphicSize(Std.int(gf_wink.width * 1.4960));
				add(gf_wink);
				gf_wink.visible = false;

				mage = new FlxSprite(37, 75).loadGraphic(Paths.image('dialogue/mage'));
				mage.setGraphicSize(Std.int(mage.width * 0.8961));
				add(mage);
				mage.visible = false;

				mage_confused = new FlxSprite(37, 75).loadGraphic(Paths.image('dialogue/mage_confused'));
				mage_confused.setGraphicSize(Std.int(mage_confused.width * 0.8961));
				add(mage_confused);
				mage_confused.visible = false;

				mage_excited = new FlxSprite(37, 75).loadGraphic(Paths.image('dialogue/mage_excited'));
				mage_excited.setGraphicSize(Std.int(mage_excited.width * 0.8961));
				add(mage_excited);
				mage_excited.visible = false;

				mage_happy = new FlxSprite(37, 75).loadGraphic(Paths.image('dialogue/mage_happy'));
				mage_happy.setGraphicSize(Std.int(mage_happy.width * 0.8961));
				add(mage_happy);
				mage_happy.visible = false;

				mage_passion = new FlxSprite(37, 75).loadGraphic(Paths.image('dialogue/mage_passion'));
				mage_passion.setGraphicSize(Std.int(mage_passion.width * 0.8961));
				add(mage_passion);
				mage_passion.visible = false;

				mage_love = new FlxSprite(37, 75).loadGraphic(Paths.image('dialogue/mage_love'));
				mage_love.setGraphicSize(Std.int(mage_love.width * 0.8961));
				add(mage_love);
				mage_love.visible = false;

				mage_smile = new FlxSprite(37, 75).loadGraphic(Paths.image('dialogue/mage_smile'));
				mage_smile.setGraphicSize(Std.int(mage_smile.width * 0.8961));
				add(mage_smile);
				mage_smile.visible = false;

				alicia_gloat = new FlxSprite(37, 75).loadGraphic(Paths.image('dialogue/alicia_gloat'));
				alicia_gloat.setGraphicSize(Std.int(alicia_gloat.width * 0.8961));
				add(alicia_gloat);
				alicia_gloat.visible = false;
		//}
		
		switch (PlayState.SONG.song.toLowerCase())
		{
			case 'senpai' | 'roses' | 'thorns':
				box.animation.play('normalOpen');
				box.setGraphicSize(Std.int(box.width * PlayState.daPixelZoom * 0.9));
				box.updateHitbox();
				add(box);

				box.screenCenter(X);
				portraitLeft.screenCenter(X);

				handSelect = new FlxSprite(FlxG.width * 0.9, FlxG.height * 0.9).loadGraphic(Paths.image('weeb/pixelUI/hand_textbox'));
				add(handSelect);
			default:
				add(box);
		}

		if (!talkingRight)
		{
			// box.flipX = true;
		}

		dropText = new FlxText(242, 502, Std.int(FlxG.width * 0.6), "", 32);
		dropText.font = 'Pixel Arial 11 Bold';
		dropText.color = 0xFFD89494;
		add(dropText);

		swagDialogue = new FlxTypeText(240, 500, Std.int(FlxG.width * 0.6), "", 32);
		swagDialogue.font = 'Pixel Arial 11 Bold';
		swagDialogue.color = 0xFF3F2021;
		swagDialogue.sounds = [FlxG.sound.load(Paths.sound('pixelText'), 0.6)];
		add(swagDialogue);

		dialogue = new Alphabet(0, 80, "", false, true);
		// dialogue.x = 90;
		// add(dialogue);
	}

	var dialogueOpened:Bool = false;
	var dialogueStarted:Bool = false;

	override function update(elapsed:Float)
	{
		// HARD CODING CUZ IM STUPDI
		if (PlayState.SONG.song.toLowerCase() == 'roses')
			portraitLeft.visible = false;
		if (PlayState.SONG.song.toLowerCase() == 'thorns')
		{
			portraitLeft.color = FlxColor.BLACK;
			swagDialogue.color = FlxColor.WHITE;
			dropText.color = FlxColor.BLACK;
		}

		dropText.text = swagDialogue.text;

		if (PlayState.SONG.song.toLowerCase() == 'roses' || PlayState.SONG.song.toLowerCase() == 'thorns' || PlayState.SONG.song.toLowerCase() == 'senpai')
		{
			if (box.animation.curAnim != null)
			{
				if (box.animation.curAnim.name == 'normalOpen' && box.animation.curAnim.finished)
				{
					box.animation.play('normal');
					dialogueOpened = true;
				}
			}
		}
		else
		{
			dialogueOpened = true;
		}

		if (dialogueOpened && !dialogueStarted)
		{
			startDialogue();
			dialogueStarted = true;
		}

		if (FlxG.keys.justPressed.ANY  && dialogueStarted == true)
		{
			remove(dialogue);
				
			FlxG.sound.play(Paths.sound('clickText'), 0.8);

			if (dialogueList[1] == null && dialogueList[0] != null)
			{
				if (!isEnding)
				{
					isEnding = true;

					if (PlayState.SONG.song.toLowerCase() == 'senpai' || PlayState.SONG.song.toLowerCase() == 'thorns')
						FlxG.sound.music.fadeOut(2.2, 0);

					new FlxTimer().start(0.2, function(tmr:FlxTimer)
					{
						box.alpha -= 1 / 5;
						fadePorts();
						bgFade.alpha -= 1 / 5 * 0.7;
						portraitLeft.visible = false;
						portraitRight.visible = false;
						swagDialogue.alpha -= 1 / 5;
						dropText.alpha = swagDialogue.alpha;
					}, 5);

					new FlxTimer().start(1.2, function(tmr:FlxTimer)
					{
						finishThing();
						kill();
					});
				}
			}
			else
			{
				dialogueList.remove(dialogueList[0]);
				startDialogue();
			}
		}
		
		super.update(elapsed);
	}

	var isEnding:Bool = false;

	function startDialogue():Void
	{
		cleanDialog();
		// var theDialog:Alphabet = new Alphabet(0, 70, dialogueList[0], false, true);
		// dialogue = theDialog;
		// add(theDialog);

		// swagDialogue.text = ;
		swagDialogue.resetText(dialogueList[0]);
		swagDialogue.start(0.04, true);

		switch (PlayState.SONG.song.toLowerCase())
		{
			default:
				switch (curCharacter)
				{
					default:
						invisall();
					case 'bf':
						invisall();
						bf.visible = true;
					case 'gf':
						invisall();
						gf.visible = true;
					case 'gf_bruh':
						invisall();
						gf_bruh.visible = true;
					case 'gf_brave':
						invisall();
						gf_brave.visible = true;
					case 'gf_paper':
						invisall();
						gf_paper.visible = true;
					case 'gf_paper_confused':
						invisall();
						gf_paper_confused.visible = true;
					case 'gf_wink':
						invisall();
						gf_wink.visible = true;
					case 'mage':
						invisall();
						mage.visible = true;
					case 'mage_confused':
						invisall();
						mage_confused.visible = true;
					case 'mage_excited':
						invisall();
						mage_excited.visible = true;
					case 'mage_happy':
						invisall();
						mage_happy.visible = true;
					case 'mage_passion':
						invisall();
						mage_passion.visible = true;
					case 'mage_love':
						invisall();
						mage_love.visible = true;
					case 'mage_smile':
						invisall();
						mage_smile.visible = true;
					case 'alicia_gloat':
						invisall();
						alicia_gloat.visible = true;
				}
			case 'senpai' | 'roses' | 'thorns':
				switch (curCharacter)
				{
					case 'dad':
					portraitRight.visible = false;
					if (!portraitLeft.visible)
					{
						portraitLeft.visible = true;
						portraitLeft.animation.play('enter');
					}
					case 'bf':
					portraitLeft.visible = false;
					if (!portraitRight.visible)
					{
						portraitRight.visible = true;
						portraitRight.animation.play('enter');
					}
				}
		}
	}

	function cleanDialog():Void
	{
		var splitName:Array<String> = dialogueList[0].split(":");
		curCharacter = splitName[1];
		dialogueList[0] = dialogueList[0].substr(splitName[1].length + 2).trim();
	}

	function invisall():Void
	{
		bf.visible = false;
		gf.visible = false;
		gf_bruh.visible = false;
		gf_brave.visible = false;
		gf_paper.visible = false;
		gf_paper_confused.visible = false;
		gf_wink.visible = false;
		mage.visible = false;
		mage_confused.visible = false;
		mage_excited.visible = false;
		mage_happy.visible = false;
		mage_passion.visible = false;
		mage_love.visible = false;
		mage_smile.visible = false;
		alicia_gloat.visible = false;
		bf.alpha = 1;
		gf.alpha = 1;
		gf_bruh.alpha = 1;
		gf_brave.alpha = 1;
		gf_paper.alpha = 1;
		gf_paper_confused.alpha = 1;
		gf_wink.alpha = 1;
		mage.alpha = 1;
		mage_confused.alpha = 1;
		mage_excited.alpha = 1;
		mage_happy.alpha = 1;
		mage_passion.alpha = 1;
		mage_love.alpha = 1;
		mage_smile.alpha = 1;
		alicia_gloat.alpha = 1;
	}

	function fadePorts():Void
	{
		bf.alpha -= 1 / 5;
		gf.alpha -= 1 / 5;
		gf_bruh.alpha -= 1 / 5;
		gf_brave.alpha -= 1 / 5;
		gf_paper.alpha -= 1 / 5;
		gf_paper_confused.alpha -= 1 / 5;
		gf_wink.alpha -= 1 / 5;
		mage.alpha -= 1 / 5;
		mage_confused.alpha -= 1 / 5;
		mage_excited.alpha -= 1 / 5;
		mage_happy.alpha -= 1 / 5;
		mage_passion.alpha -= 1 / 5;
		mage_love.alpha -= 1 / 5;
		mage_smile.alpha -= 1 / 5;
		alicia_gloat.alpha -= 1 / 5;
	}
}
