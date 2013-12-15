package ld28.world 
{
	import adobe.utils.CustomActions;
	
	import net.flashpunk.FP;
	import net.flashpunk.Entity;
	import net.flashpunk.World;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.graphics.Stamp;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	import ld28.Assets;
	import ld28.Settings;
	import ld28.entity.Foreground;
	
	/**
	 * ...
	 * @author Alejandro Cámara
	 */
	public class TitleWorld extends World
	{
		public function TitleWorld() 
		{
			// Define controls
			Input.define(KEY_ENTER, Key.ENTER, Key.NUMPAD_ENTER);
			
			// Create the background image
			_background = new Entity(0, 0, new Stamp(Assets.TITLE_BACKGROUND));
			add(_background);
			
			// Create press enter button
			var buttonSprite:Spritemap = new Spritemap(Assets.TITLE_BUTTON, Settings.TITLE_BUTTON_WIDTH, Settings.TITLE_BUTTON_HEIGHT);
			buttonSprite.add("default", Settings.TITLE_BUTTON_FRAMES, Settings.TITLE_BUTTON_FRAMERATE, true);
			buttonSprite.play("default");
			_button = new Entity(Settings.TITLE_BUTTON_X, Settings.TITLE_BUTTON_Y, buttonSprite);
			add(_button);
			
			// Create foreground
			_fadeForeground = new Foreground(Settings.SCREEN_PADDING, Settings.SCREEN_PADDING, Assets.FADE_COLOUR_RESET);
			_fadeForeground.width = Settings.SCREEN_WIDTH;
			_fadeForeground.height = Settings.SCREEN_HEIGHT;
			_fadeForeground.layer = -1;
			add(_fadeForeground);
		}
		
		override public function begin():void
		{
			_isFading = true;
			_fadeForeground.fadeIn(FADE_OUT_TOTAL_TIME, this.endInitialFade);
		}
		
		override public function update():void
		{
			if (!_isFading)
			{
				if (Input.released(KEY_ENTER))
				{
					_fadeForeground.fadeOut(FADE_IN_TOTAL_TIME, this.loadFirstLevel);
				}
				
				super.update();
			}
			else
			{
				_fadeForeground.update();
			}
		}
		
		private static const KEY_ENTER:String = "enter";
		
		private static const FADE_IN_TOTAL_TIME:Number  = 2.0;
		private static const FADE_OUT_TOTAL_TIME:Number = 1.0;
		
		private var _fadeForeground:Foreground = null;
		private var _isFading:Boolean          = false;
		
		private var _background:Entity = null;
		private var _button:Entity     = null;
		
		private function endInitialFade():void
		{
			_isFading = false;
		}
		
		private function loadFirstLevel():void
		{
			_isFading = false;
			
			FP.world = new LevelWorld();
		}
	}

}