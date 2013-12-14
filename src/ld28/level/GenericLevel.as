package ld28.level 
{
	import flash.display.BitmapData;
	import flash.geom.Rectangle;
	import net.flashpunk.masks.Grid;
	
	import net.flashpunk.FP;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Canvas;
	
	import ld28.Assets;
	import ld28.Settings;
	import ld28.LevelWorld;
	import ld28.level.LevelInfo;
	import ld28.utils.Assert;
	
	/**
	 * ...
	 * @author Alejandro Cámara
	 */
	public class GenericLevel extends Entity 
	{
		///////////////////////////////////////
		// Public interface and data members //
		///////////////////////////////////////
		
		public function GenericLevel(levelSource:Class, levelInfo:LevelInfo, colour:uint, level:LevelWorld = null):void
		{
			_level  = level;
			_colour = colour;
			_data   = FP.getBitmap(levelSource);
			
			// Make sure we are loading a proper image
			Assert(Settings.BOARD_WIDTH == _data.width && Settings.BOARD_HEIGHT == _data.height,
				   "GenericMap: Image does not have right size.");
			
			// Initialise tile array
			ResetTiles();
			PopulateTiles();
			
			// Create image
			_canvas = new Canvas(Settings.SCREEN_WIDTH, Settings.SCREEN_HEIGHT);
			_canvas.x = Settings.SCREEN_PADDING;
			_canvas.y = Settings.SCREEN_PADDING;
			UpdateCanvas();
			
			// Associate graphics and collision grid
			graphic = _canvas;
			mask = _grid;
			
			// Initially it starts hidden
			visible = false;
			
			// Name to search for collisions
			type = "colour" + _colour;
		}
		
		// Hack to resolve the overlapping tiles
		public function fixOverlapping():void
		{
			UpdateCanvas(true);
		}
		
		override public function update():void
		{
		}
		
		// Checks if a tile exists
		public function isTileAt(y:uint, x:uint):Boolean
		{
			return _tiles[y][x];
		}
		
		////////////////////////////////////////
		// Private interface and data members //
		////////////////////////////////////////
		
		private var _level:LevelWorld = null;
		
		private var _colour:uint = 0;
		
		private var _data:BitmapData   = null;
		
		private var _tiles:Array       = null;
		private var _canvas:Canvas     = null;
		private var _grid:Grid         = null;
		
		// Reset the tile array
		private function ResetTiles():void
		{
			_tiles = new Array(Settings.BOARD_HEIGHT);
			for (var i:uint = 0; i < Settings.BOARD_HEIGHT; ++i)
			{
				_tiles[i] = new Array(Settings.BOARD_WIDTH);
				for (var j:uint = 0; j < Settings.BOARD_WIDTH; ++j)
				{
					_tiles[i][j] = false;
				}
			}
			
			_grid = new Grid(Settings.SCREEN_WIDTH, Settings.SCREEN_HEIGHT, Settings.TILE_WIDTH,
							 Settings.TILE_HEIGHT, 0, 0);
		}
		
		// Populate tile array
		private function PopulateTiles():void
		{
			Assert(_data != null);
			
			for (var i:uint = 0; i < Settings.BOARD_HEIGHT; ++i)
			{
				for (var j:uint = 0; j < Settings.BOARD_WIDTH; ++j)
				{
					var colour:uint = _data.getPixel(j, i);
					UpdateTileFromColour(i, j, colour);
				}
			}
		}
		
		// Updates the tile multidimensional array
		private function UpdateTileFromColour(y:uint, x:uint, colour:uint):void
		{
			Assert(_tiles != null);
			Assert(_grid  != null);
			
			if (Assets.REF_COLOUR[_colour] & colour)
			{
				_tiles[y][x] = true;
				_grid.setTile(x, y, true);
			}
		}
		
		// Updates the canvas representing the level display
		private function UpdateCanvas(doOverlapping:Boolean = false):void
		{
			Assert(_canvas != null);
			Assert(_level  != null);
			
			// Clear canvas
			_canvas.fill(Settings.SCREEN_RECTANGLE_NO_PADDING, Assets.BG_COLOUR[_colour]);
			
			// Draw rectangles
			var curX:uint = 0;
			var curY:uint = 0;
			for (var i:uint = 0; i < Settings.BOARD_HEIGHT; ++i)
			{
				for (var j:uint = 0; j < Settings.BOARD_WIDTH; ++j)
				{
					if (_tiles[i][j])
					{
						// Check for underneath tiles in other colours
						var overlap:Boolean = doOverlapping ? _level.areColoursOverlapping(i, j) : false;
						
						// Paint tile colour
						PaintTile(i, j, _colour);
						
						// Paint overlapping pattern if needed
						if (overlap)
						{
							PaintOverlappingTile(i, j);
						}
					}
				}
			}
		}
		
		// Paints a tile in the given position and given colour Id
		private function PaintTile(y:uint, x:uint, colorId:uint):void
		{
			var rect:Rectangle = GetRectangleForTile(y, x);
			var colour:uint    = Assets.PAINT_COLOUR[colorId];
			_canvas.fill(rect, colour, 1);
		}
		
		// Paints the overlapping pattern on top of the tile in the given position
		private function PaintOverlappingTile(y:uint, x:uint):void
		{
			var rect:Rectangle = GetRectangleForTile(y, x);
			_canvas.fillTexture(rect, Assets.OVERLAPPING_TILE_TOTAL);
		}
		
		// Gets a Rectangle that fits the 
		private function GetRectangleForTile(y:uint, x:uint):Rectangle
		{
			var realX:uint = x * Settings.TILE_WIDTH;
			var realY:uint = y * Settings.TILE_HEIGHT;
			return new Rectangle(realX, realY, Settings.TILE_WIDTH, Settings.TILE_HEIGHT);
		}
	}

}