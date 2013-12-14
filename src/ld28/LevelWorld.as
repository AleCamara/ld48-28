package ld28 
{
	import net.flashpunk.World;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	import ld28.Assets;
	import ld28.entities.GenericMap;
	import ld28.entities.Player;
	
	/**
	 * ...
	 * @author Alejandro Cámara
	 */
	public class LevelWorld extends World 
	{
		public function LevelWorld():void
		{
			// Define controls
			Input.define(KEY_COLOUR_1, Key.DIGIT_1, Key.H);
			Input.define(KEY_COLOUR_2, Key.DIGIT_2, Key.J);
			Input.define(KEY_COLOUR_3, Key.DIGIT_3, Key.K);
			Input.define(KEY_COLOUR_4, Key.DIGIT_4, Key.L);
			
			// Create maps for the level
			_colourMaps = new Array(Settings.NUM_COLOURS);
			for (var i:uint = 0; i < Settings.NUM_COLOURS; ++i)
			{
				_colourMaps[i] = new GenericMap(Assets.LEVEL_0, i, this);
			}
			
			// Create player
			_player = new Player(0, 25, this);
		}
		
		override public function begin():void
		{
			// Initialise colour maps
			for (var i:uint = 0; i < Settings.NUM_COLOURS; ++i)
			{
				_colourMaps[i].fixOverlapping();
			}
				
			// Add maps and players to the update loop
			for (var j:uint = 0; j < Settings.NUM_COLOURS; ++j)
			{
				add(_colourMaps[j]);
			}
			add(_player);
			
			// Show the initial colour
			ChangeColour(0);
		}
		
		override public function end():void
		{
			// Remove maps and players from the update loop
			for (var i:uint = 0; i < Settings.NUM_COLOURS; ++i)
			{
				remove(_colourMaps[i]);
			}
			remove(_player);
		}
		
		override public function update():void
		{
			if (Input.check(KEY_COLOUR_1))
			{
				ChangeColour(0);
			}
			if (Input.check(KEY_COLOUR_2))
			{
				ChangeColour(1);
			}
			if (Input.check(KEY_COLOUR_3))
			{
				ChangeColour(2);
			}
			if (Input.check(KEY_COLOUR_4))
			{
				ChangeColour(3);
			}
			
			super.update();
		}
		
		// Checks if for a given tile all colours overlap
		public function areColoursOverlapping(y:uint, x:uint):Boolean
		{
			var count:uint = 0;
			for (var i:uint = 0; i < Settings.NUM_COLOURS; ++i)
			{
				if (_colourMaps[i].isTileAt(y, x))
				{
					++count;
				}
			}
			return (Settings.NUM_COLOURS == count);
		}
		
		// Returns the current colour
		public function getCurrentColour():uint
		{
			return _curColour;
		}
		
		// Handles the case in which the player fall out of the screen (die?)
		public function playerFell():void
		{
			trace("Player has fallen out of the screen.");
		}
		
		////////////////////////////////////////
		// Private interface and data members //
		////////////////////////////////////////
		private static const KEY_COLOUR_1:String = "colour1";
		private static const KEY_COLOUR_2:String = "colour2";
		private static const KEY_COLOUR_3:String = "colour3";
		private static const KEY_COLOUR_4:String = "colour4";
		
		private var _curColour:uint = 0;
		
		private var _player:Player = null;
		private var _colourMaps:Array = null;
		
		// Changes the colour of the map displayed (and interacted with)
		private function ChangeColour(colour:uint):void
		{
			if (!_player.collide("colour" + colour, _player.x, _player.y))
			{
				_colourMaps[_curColour].visible = false;
				_curColour = colour;
				_colourMaps[_curColour].visible = true;
			}
			else
			{
				trace("Unable to change color because player would get stuck.");
			}
		}
	}

}