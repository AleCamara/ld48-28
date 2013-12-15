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
		[Embed(source = "../../assets/levels/tutorial_0.png")] public static const TUTORIAL_0:Class;
		[Embed(source = "../../assets/levels/tutorial_1.png")] public static const TUTORIAL_1:Class;
		[Embed(source = "../../assets/levels/tutorial_2.png")] public static const TUTORIAL_2:Class;
		[Embed(source = "../../assets/levels/tutorial_3.png")] public static const TUTORIAL_3:Class;
		[Embed(source = "../../assets/levels/tutorial_4.png")] public static const TUTORIAL_4:Class;
		[Embed(source = "../../assets/levels/tutorial_5.png")] public static const TUTORIAL_5:Class;
		[Embed(source = "../../assets/levels/level_0.png")] public static const LEVEL_0:Class;
		[Embed(source = "../../assets/levels/level_1.png")] public static const LEVEL_1:Class;
		[Embed(source = "../../assets/levels/level_2.png")] public static const LEVEL_2:Class;
		[Embed(source = "../../assets/levels/level_3.png")] public static const LEVEL_3:Class;
		[Embed(source = "../../assets/levels/level_4.png")] public static const LEVEL_4:Class;
		[Embed(source = "../../assets/levels/level_5.png")] public static const LEVEL_5:Class;
		[Embed(source = "../../assets/levels/level_6.png")] public static const LEVEL_6:Class;
		[Embed(source = "../../assets/levels/level_7.png")] public static const LEVEL_7:Class;
		[Embed(source = "../../assets/levels/level_8.png")] public static const LEVEL_8:Class;
		[Embed(source = "../../assets/levels/level_9.png")] public static const LEVEL_9:Class;
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
				TUTORIAL_0,
				TUTORIAL_1,
				TUTORIAL_2,
				TUTORIAL_3,
				TUTORIAL_4,
				TUTORIAL_5,
				LEVEL_0,
				LEVEL_1,
				LEVEL_2,
				LEVEL_3,
				LEVEL_4,
				LEVEL_5,
				LEVEL_6,
				LEVEL_7,
				LEVEL_8,
				LEVEL_9
			];
		public static const LEVEL_INFO:Array = [
				// Tutorial levels
				new LevelInfo(1, 10, 56, 28, 0, "Tutorial:\nMovement",       "Press keyboard arrows to move"),
				new LevelInfo(1, 10, 56, 28, 0, "Tutorial:\nJump",           "Press up to jump"),
				new LevelInfo(1, 10, 56, 28, 0, "Tutorial:\nChange colour",  "Press 1, 2, 3 or 4 to change colour"),
				new LevelInfo(1, 24, 53, 12, 0, "Tutorial:\nInvalid change", "Sometimes you won't be able to change colours because that'll leave you in an invalid position. Try moving around to find a spot to change colours."),
				new LevelInfo(1, 10, 52, 14, 0, "Tutorial:\nInvalid win",    "As you may have noticed, to win you have to enter the portal. However, it is not valid just to jump-touch it, you must be touching ground to enter the it."),
				new LevelInfo(1, 10, 51, 13, 0, "Tutorial:\nFalling",        "Be careful not to fall off screen or you'll have to start again from the beginning."),
				// Real levels
				new LevelInfo(8, 27, 55, 28, 0, "01:\nDifferent kid",
					"I was born different. While normal people can have all colours, I can only get one."),
				new LevelInfo(3, 26, 51,  9, 0, "02:\nResourceful kid",
					"When I was a kid I was so angry with my condition that I HAD to learn a trick."),
				new LevelInfo(3, 18, 46,  7, 0, "03:\nQuite the trick",
					"Now if I scowl in a certain way, I can strain my eyes to a point I can see other colours."),
				new LevelInfo(1, 25, 56, 20, 0, "04:\nReality?",
					"Unfortunately, I'm still cursed to see only one colour at a time. It still feels like walking through walls all the time."),
				new LevelInfo(2, 26, 56, 28, 0, "05:\nAdventurer",
					"Despite this stupid scowl trick, I won't be able to reach my dream: be an adventurer."),
				new LevelInfo(0, 27, 18, 31, 0, "06:\nUps and downs",
					"I won't be able to climb the highest mountain on Earth or to explore the deepest chasm of the ocean."),
				new LevelInfo(0, 29,  9,  9, 0, "07:\nSahara",
					"I won't be able to cross the largest desert."),
				new LevelInfo(8, 22, 50, 18, 0, "08:\nIndiana Jones",
					"I won't be able to fight and tame horrible beasts from the darkest jungles."),
				new LevelInfo(2, 28, 49,  7, 0, "09:\nNeil Gagarin",
					"I won't be able to get to the moon nor other planets!"),
				new LevelInfo(54, 3, 20, 23, 0, "10:\nKokoro",
					"DAMN IT! I WON'T EVEN BE ABLE TO FALL IN LOVE!")
			];
		public static const NUM_LEVELS:uint     = LEVEL_INFO.length;
		public static const STARTING_LEVEL:uint = 14;
		
		
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