package ld28.world 
{
	import net.flashpunk.FP;
	import net.flashpunk.Entity;
	import net.flashpunk.World;
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
	public class WinWorld extends World
	{
		
		public function WinWorld() 
		{
			// Define controls
			Input.define(KEY_ENTER, Key.ENTER, Key.NUMPAD_ENTER);
			
			// Create the background image
			_background = new Entity(0, 0, new Stamp(Assets.WIN_BACKGROUND));
			add(_background);
			
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
					_fadeForeground.fadeOut(FADE_IN_TOTAL_TIME, this.goBackToTitle);
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
		
		private function endInitialFade():void
		{
			_isFading = false;
		}
		
		private function goBackToTitle():void
		{
			_isFading = false;
			
			FP.world = new TitleWorld();
		}
	}

}