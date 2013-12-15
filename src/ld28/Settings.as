package ld28 
{
	import flash.geom.Rectangle;
	
	/**
	 * ...
	 * @author Alejandro Cámara
	 */
	public class Settings 
	{
		// Screen dimensions
		public static const SCREEN_WIDTH:uint   = BOARD_WIDTH * TILE_WIDTH;
		public static const SCREEN_HEIGHT:uint  = BOARD_HEIGHT * TILE_HEIGHT;
		public static const SCREEN_PADDING:uint = 5;
		public static const SCREEN_MAX_X:Number = SCREEN_WIDTH - SCREEN_PADDING - PLAYER_HB_WIDTH - 2.0;
		public static const SCREEN_MIN_X:Number = 2.0;
		public static const SCREEN_MAX_Y:Number = SCREEN_HEIGHT + 2 * SCREEN_PADDING;
		
		public static const SCREEN_RECTANGLE:Rectangle            = new Rectangle(SCREEN_PADDING, SCREEN_PADDING, SCREEN_WIDTH, SCREEN_HEIGHT);
		public static const SCREEN_RECTANGLE_NO_PADDING:Rectangle = new Rectangle(0, 0, SCREEN_WIDTH + 2*SCREEN_PADDING, SCREEN_HEIGHT + 2*SCREEN_PADDING);
		
		// Board dimensions
		public static const BOARD_WIDTH:uint  = 60;
		public static const BOARD_HEIGHT:uint = 35;
		public static const BOARD_RECTANGLE:Rectangle = new Rectangle(0, 0, BOARD_WIDTH, BOARD_HEIGHT)
		
		// Tile dimensions
		public static const TILE_WIDTH:uint  = 16;
		public static const TILE_HEIGHT:uint = 16;
		
		// Hit boxes
		public static const PLAYER_HB_WIDTH:uint  = 16;
		public static const PLAYER_HB_HEIGHT:uint = 30;
		public static const PLAYER_HB_XOFFSET:int = 5;
		public static const PLAYER_HB_YOFFSET:int = 4;
		public static const PLAYER_HB_RECT:Rectangle = new Rectangle(
			PLAYER_HB_XOFFSET, PLAYER_HB_YOFFSET,
			PLAYER_HB_WIDTH, PLAYER_HB_HEIGHT);
			
		public static const FINISH_LINE_HB_WIDTH:uint  = 10;
		public static const FINISH_LINE_HB_HEIGHT:uint = 4;
		public static const FINISH_LINE_HB_XOFFSET:int = -7;
		public static const FINISH_LINE_HB_YOFFSET:int = -30;
		public static const FINISH_LINE_HB_RECT:Rectangle = new Rectangle(
			FINISH_LINE_HB_XOFFSET, FINISH_LINE_HB_YOFFSET,
			FINISH_LINE_HB_WIDTH, FINISH_LINE_HB_HEIGHT);
		
		// Colour information
		public static const NUM_COLOURS:uint = Assets.PAINT_COLOUR.length;
		
		// Player information
		public static const PLAYER_WIDTH:uint     = 16;
		public static const PLAYER_HEIGHT:uint    = 32;
		public static const PLAYER_FRAMERATE:uint = 1;
		
		// Finish line information
		public static const FINISH_LINE_WIDTH:uint     = 32;
		public static const FINISH_LINE_HEIGHT:uint    = 64;
		public static const FINISH_LINE_FRAMES:Array   = [0, 1, 2, 3];
		public static const FINISH_LINE_FRAMERATE:uint = 4;
		
		// Title screen information
		public static const TITLE_BUTTON_WIDTH:uint       = 656;
		public static const TITLE_BUTTON_HEIGHT:uint      = 80;
		public static const TITLE_BUTTON_X:int            = 278;
		public static const TITLE_BUTTON_Y:int            = 447;
		public static const TITLE_BUTTON_FRAMES:Array     = [0, 1, 2, 3];
		public static const TITLE_BUTTON_FRAMERATE:Number = 8;
		
		// Text information
		public static const TEXT_TITLE_X:uint = 50;
		public static const TEXT_TITLE_Y:uint = 120;
		public static const TEXT_TITLE_SIZE:uint = 72;
		public static const TEXT_TITLE_WIDTH:uint = 750;
		public static const TEXT_TITLE_HEIGHT:uint = 100;
		public static const TEXT_TITLE_PADDING:uint = 5;
		public static const TEXT_TITLE_BG_COLOUR:uint = 0xFF404040;
		public static const TEXT_TITLE_LAYER:int = -3;
		
		public static const TEXT_TITLE_FINAL_X:uint = 100;
		public static const TEXT_TITLE_FINAL_Y:uint = 60;
		public static const TEXT_TITLE_FINAL_SIZE:uint = 64;
		public static const TEXT_TITLE_BG_FINAL_COLOUR:uint = 0x00404040;
		public static const TEXT_TITLE_FINAL_LAYER:int = -1;
		
		public static const TEXT_DESC_X:uint = 10;
		public static const TEXT_DESC_Y:uint = 10;
		public static const TEXT_DESC_SIZE:uint = 12;
		public static const TEXT_DESC_WIDTH:uint = 200;
		public static const TEXT_DESC_HEIGHT:uint = 400;
		public static const TEXT_DESC_PADDING:uint = 5;
		public static const TEXT_DESC_BG_COLOUR:uint = 0x00404040;
		public static const TEXT_DESC_LAYER:int = -1;
	}

}