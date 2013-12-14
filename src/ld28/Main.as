package ld28
{
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	
	import ld28.Assets;
	
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
			Assets.init();
			
			FP.console.enable();
			
			FP.world = new LevelWorld();
		}
	}
	
}