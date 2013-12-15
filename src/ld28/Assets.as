package ld28 
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import ld28.level.LevelInfo;
	
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	
	import ld28.level.GenericLevel;
	
	/**
	 * ...
	 * @author Alejandro Cámara
	 */
	public final class Assets 
	{
		///////////////////////////////////////
		// Public interface and data members //
		///////////////////////////////////////
		
		// Player data
		[Embed(source = "../../assets/textures/player.png")] public static const PLAYER:Class;
		
		// Finish line
		[Embed(source = "../../assets/textures/finish_line.png")] public static const FINISH_LINE:Class;
		
		// Title background image
		[Embed(source = "../../assets/textures/title_screen.png")] public static const TITLE_BACKGROUND:Class;
		
		// Title press enter button
		[Embed(source = "../../assets/textures/press_enter.png")] public static const TITLE_BUTTON:Class;
		
		// Win background image
		[Embed(source = "../../assets/textures/win_screen.png")] public static const WIN_BACKGROUND:Class;
		
		// Actual data for creating levels
		[Embed(source = "../../assets/levels/level_dummy.png")] public static const LEVEL_0:Class;
		
		// Reference colours
		public static const REF_COLOUR:Array = [0x00800000,
												0x00008000,
												0x00000080,
												0x00404040];
		// Painting colours
		public static const PAINT_COLOUR:Array = [0xFFF73E5F,
												  0xFF41DB00,
												  0xFF447BD4,
												  0xFFFFA200];
		public static const PAINT_COLOUR_ALT:Array = [0xFFB32D45,
													  0xFF4EA429,
													  0xFF284A7E,
													  0xFFBF8B30];
		// Background colours
		public static const BG_COLOUR:Array = [0xFF404040,
											   0xFF404040,
											   0xFF404040,
											   0xFF404040];

		public static const FADE_COLOUR_RESET:uint = 0xFF404040;
		
		// Tile for when colours overlap
		public static var OVERLAPPING_TILE:BitmapData       = new BitmapData(16, 16, true, 0x00FFFFFF);
		public static var OVERLAPPING_TILE_TOTAL:BitmapData = new BitmapData(16, 16, true, 0x00000000);
		
		public static const LEVEL_DATA:Array = [
				LEVEL_0,
				LEVEL_0
			];
		public static const LEVEL_INFO:Array = [
				new LevelInfo(1, 10, 39, 16, 3, 0),
				new LevelInfo(1, 10, 39, 16, 0, 1)
			];
		public static const NUM_LEVELS:uint = LEVEL_INFO.length;
		
		
		// Helper function to initialise the graphical assets
		public static function init():void
		{
			// Initialise overlapping tite
			for (var i:uint = 0; i < 16; ++i)
			{
				for (var j:uint = 0; j < 16; ++j)
				{
					if (OVERLAPPING_PATTERN[i][j])
					{
						OVERLAPPING_TILE.setPixel32(i, j, 0xFFFFFFFF);
						OVERLAPPING_TILE_TOTAL.setPixel32(i, j, 0xFF000000);
					}
				}
			}
		}
		
		////////////////////////////////////////
		// Private interface and data members //
		////////////////////////////////////////
		
		private static const OVERLAPPING_PATTERN:Array = [
				[ 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1 ],
				[ 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1 ],
				[ 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1 ],
				[ 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1 ],
				[ 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0 ],
				[ 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0 ],
				[ 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0 ],
				[ 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0 ],
				[ 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0 ],
				[ 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0 ],
				[ 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0 ],
				[ 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0 ],
				[ 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
				[ 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 ],
				[ 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1 ],
				[ 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1 ]
			];
	}

}