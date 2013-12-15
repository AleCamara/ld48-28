package ld28.world 
{
	import flash.display.BitmapData;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Stamp;
	import net.flashpunk.World;
	
	import ld28.Assets;
	import ld28.Settings;
	import ld28.entity.Foreground;
	import ld28.entity.TextEntity;
	
	/**
	 * ...
	 * @author Alejandro Cámara
	 */
	public class FinalWorld extends World
	{
		public function FinalWorld() 
		{
			// Create foreground fader
			_fadeForeground = new Foreground(Settings.SCREEN_PADDING, Settings.SCREEN_PADDING, Assets.FADE_COLOUR_RESET);
			_fadeForeground.width = Settings.SCREEN_WIDTH;
			_fadeForeground.height = Settings.SCREEN_HEIGHT;
			_fadeForeground.layer = -2;
			add(_fadeForeground);
			
			// Create title text entity
			_titleText = new TextEntity("", Settings.TEXT_TITLE_FINAL_SIZE, Assets.PAINT_COLOUR[_curString],
				Settings.TEXT_TITLE_FINAL_X, Settings.TEXT_TITLE_FINAL_Y, Settings.TEXT_TITLE_WIDTH, Settings.TEXT_TITLE_HEIGHT,
				Settings.TEXT_TITLE_PADDING, Settings.TEXT_TITLE_BG_FINAL_COLOUR, Settings.TEXT_TITLE_FINAL_LAYER);
			add(_titleText);
			
			// Create background
			var backgroundData:BitmapData = new BitmapData(
				Settings.SCREEN_RECTANGLE_NO_PADDING.width,
				Settings.SCREEN_RECTANGLE_NO_PADDING.height,
				false, 
				Assets.BG_COLOUR[0]);
			_background = new Entity(0, 0, new Stamp(backgroundData));
			_background.layer = 1;
			add(_background);
		}
		
		// Callback for when the world starts
		override public function begin():void
		{
			changeString();
		}
		
		override public function update():void
		{
			if (_titleTimer > 0.0)
			{
				_titleTimer -= FP.elapsed;
				
				if (_titleTimer <= 0.0)
				{
					_titleTimer = 0.0;
					endWaitTitleShow();
				}
			}
			
			// Update entities
			super.update();
		}
		
		private function changeString():void
		{
			_titleText.setText(Assets.FINAL_SENTENCES[_curString]);
			_titleText.setColour(Assets.PAINT_COLOUR[_curString % Settings.NUM_COLOURS]);
			_titleTimer = TIME_TITLE_DISPLAY;
			_curString++
			
			startFadeIn();
		}
		
		private function endWaitTitleShow():void
		{
			if (_curString >= Assets.NUM_FINAL_SENTENCES)
			{
				startFinalFadeOut();
			}
			else
			{
				startFadeOut();
			}
		}
		
		private function goFinalScene():void
		{
			FP.world = new WinWorld();
		}
		
		private static const FADE_IN_TOTAL_TIME:Number  = 1.0;
		private static const FADE_OUT_TOTAL_TIME:Number = 1.0;
		
		private static const TIME_TITLE_DISPLAY:Number = 5.0;
		
		private var _curString:uint             = 0;
		private var _background:Entity          = null;
		private var _fadeForeground:Foreground  = null;
		private var _titleText:TextEntity       = null;
		private var _descriptionText:TextEntity = null;
		private var _titleTimer:Number          = 0;
		
		private function startFadeIn():void
		{
			_fadeForeground.fadeIn(FADE_IN_TOTAL_TIME, null);
		}
		
		private function startFinalFadeOut():void
		{
			_fadeForeground.fadeOut(FADE_OUT_TOTAL_TIME, this.goFinalScene);
		}
		
		private function startFadeOut():void
		{
			_fadeForeground.fadeOut(FADE_OUT_TOTAL_TIME, this.changeString);
		}
	}
}