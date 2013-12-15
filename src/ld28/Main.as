package ld28
{
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Text
	
	import ld28.Assets;
	import ld28.world.TitleWorld;
	import ld28.world.LevelWorld;
	
	/**
	 * ...
	 * @author Alejandro Cámara
	 */
	public class Main extends Engine 
	{
		public function Main():void
		{
			super(Settings.SCREEN_WIDTH + 2 * Settings.SCREEN_PADDING,
			      Settings.SCREEN_HEIGHT + 2 * Settings.SCREEN_PADDING,
				  60, false);
		}
		
		override public function init():void
		{
			// Initialise assets
			Assets.init();
			
			// Initialise text options
			Text.wordWrap = true;			
			
			// Enable FlashPunk debug console
			//FP.console.enable();
			
			FP.world = new TitleWorld();
			//FP.world = new LevelWorld();
		}
	}
	
}