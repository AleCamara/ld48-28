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
		public static const SCREEN_RECTANGLE_NO_PADDING:Rectangle = new Rectangle(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
		
		// Board dimensions
		public static const BOARD_WIDTH:uint  = 60;
		public static const BOARD_HEIGHT:uint = 35;
		public static const BOARD_RECTANGLE:Rectangle = new Rectangle(0, 0, BOARD_WIDTH, BOARD_HEIGHT)
		
		// Tile dimensions
		public static const TILE_WIDTH:uint  = 16;
		public static const TILE_HEIGHT:uint = 16;
		
		// Player dimensions
		public static const PLAYER_HB_WIDTH:uint   = 16;
		public static const PLAYER_HB_HEIGHT:uint  = 30;
		public static const PLAYER_HB_XOFFSET:int  = -3;
		public static const PLAYER_HB_YOFFSET:int  =  2;
		
		// Colour information
		public static const NUM_COLOURS:uint = Assets.PAINT_COLOUR.length;
	}

}