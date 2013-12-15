package ld28.world 
{
	import ld28.entity.FinishLine;
	import ld28.entity.Foreground;
	import ld28.level.LevelInfo;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Backdrop;
	import net.flashpunk.World;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	import ld28.Assets;
	import ld28.Settings;
	import ld28.level.GenericLevel;
	import ld28.entity.Player;
	
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
			Input.define(KEY_RESET,    Key.R);
						
			// Create player and finish line entities
			// Notice that position is not important because they get repositioned later on
			_player = new Player(0, 0, this);
			_finishLine = new FinishLine(0, 0, this);
			
			// Create foreground fader
			_fadeForeground = new Foreground(Settings.SCREEN_PADDING, Settings.SCREEN_PADDING, Assets.FADE_COLOUR_RESET);
			_fadeForeground.width = Settings.SCREEN_WIDTH;
			_fadeForeground.height = Settings.SCREEN_HEIGHT;
			_fadeForeground.layer = -1;
			add(_fadeForeground);
		}
		
		// Callback for when the world starts
		override public function begin():void
		{
			loadLevel(Assets.LEVEL_DATA[_curLevel], Assets.LEVEL_INFO[_curLevel]);
		}
		
		// Callback for when the world is going to be changed
		override public function end():void
		{
		}
		
		// Resets the current level to its initial state
		public function reset(forceReset:Boolean = false):void
		{
			if (forceReset || _resetTime > RESET_TIME_THRESHOLD)
			{
				// Reposition player
				_player.x = Assets.LEVEL_INFO[_curLevel].getStartX() * Settings.TILE_WIDTH;
				_player.y = Assets.LEVEL_INFO[_curLevel].getStartY() * Settings.TILE_HEIGHT;
				
				// Reposition finish line
				_finishLine.x = (Assets.LEVEL_INFO[_curLevel].getEndX() - 1) * Settings.TILE_WIDTH + 5;
				_finishLine.y = (Assets.LEVEL_INFO[_curLevel].getEndY() - 2) * Settings.TILE_HEIGHT - 8;
				
				// Show the initial colour
				changeColour(Assets.LEVEL_INFO[_curLevel].getStartColour());
				
				_resetTime = 0.0;
			}
		}
		
		override public function update():void
		{
			// Normal update when not fading in or out
			if (!_isFading)
			{
				// Update reset time
				_resetTime += FP.elapsed;
				
				// Change colour
				if (Input.check(KEY_COLOUR_1))
				{
					changeColour(0);
				}
				if (Input.check(KEY_COLOUR_2))
				{
					changeColour(1);
				}
				if (Input.check(KEY_COLOUR_3))
				{
					changeColour(2);
				}
				if (Input.check(KEY_COLOUR_4))
				{
					changeColour(3);
				}
				
				// Reset
				if (Input.check(KEY_RESET))
				{
					reset();
				}
				
				// Update rest of entities
				super.update();
			}
			// Otherwise just update the fade foreground
			else
			{
				_fadeForeground.update();
			}
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
			reset();
			_player.recover();
		}
		
		// Handles the case in which the player has reached the finish line
		public function playerWon():void
		{
			++_curLevel;
			startFadeOut();
		}
		
		// Callback for when the fade in finishes
		public function endFadeIn():void
		{
			_isFading = false;
		}
		
		// Callback for when the fade out finishes
		// Removes current level and loads new one
		public function endFadeOut():void
		{
			_isFading = false;
			
			// Remove maps and players from the update loop
			for (var i:uint = 0; i < Settings.NUM_COLOURS; ++i)
			{
				remove(_colourMaps[i]);
			}
			remove(_player);
			remove(_finishLine);
			
			// Check if the game is finished, and if not load the next level
			if (_curLevel >= Assets.NUM_LEVELS)
			{
				FP.world = new WinWorld();
			}
			else
			{
				loadLevel(Assets.LEVEL_DATA[_curLevel], Assets.LEVEL_INFO[_curLevel]);
			}
		}
		
		////////////////////////////////////////
		// Private interface and data members //
		////////////////////////////////////////
		private static const KEY_COLOUR_1:String = "colour1";
		private static const KEY_COLOUR_2:String = "colour2";
		private static const KEY_COLOUR_3:String = "colour3";
		private static const KEY_COLOUR_4:String = "colour4";
		private static const KEY_RESET:String    = "reset";
		
		private static const RESET_TIME_THRESHOLD:Number = 0.5;
		
		private static const FADE_IN_TOTAL_TIME:Number  = 0.5;
		private static const FADE_OUT_TOTAL_TIME:Number = 1.0;
		
		private var _curColour:uint = 0;
		private var _curLevel:uint  = 0;
		
		private var _player:Player             = null;
		private var _colourMaps:Array          = null;
		private var _finishLine:FinishLine     = null;
		private var _fadeForeground:Foreground = null;
		
		private var _resetTime:Number = 0.0;
		
		private var _isFading:Boolean = false;
		
		// Changes the colour of the map displayed (and interacted with)
		private function changeColour(colour:uint):void
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
		
		// Loads a level from its embeded data and its level information
		private function loadLevel(level:Class, levelInfo:LevelInfo):void
		{
			// Create maps for the level
			_colourMaps = new Array(Settings.NUM_COLOURS);
			for (var i:uint = 0; i < Settings.NUM_COLOURS; ++i)
			{
				_colourMaps[i] = new GenericLevel(level, levelInfo, i, this);
			}
			
			// Initialise colour maps
			for (var j:uint = 0; j < Settings.NUM_COLOURS; ++j)
			{
				_colourMaps[j].fixOverlapping();
			}
				
			// Add maps and players to the update loop
			for (var k:uint = 0; k < Settings.NUM_COLOURS; ++k)
			{
				add(_colourMaps[k]);
			}
			add(_player);
			add(_finishLine);
			
			// Reset positions and initial colour
			// We need to force it because it's probably that the RESET_TIME_THRESHOLD
			// has not been elapsed yet
			reset(true);
			
			// Start the fade in to show the recently loaded level
			startFadeIn();
		}
		
		private function startFadeIn():void
		{
			_isFading = true;
			_fadeForeground.fadeIn(FADE_IN_TOTAL_TIME, this.endFadeIn);
		}
		
		private function startFadeOut():void
		{
			_isFading = true;
			_fadeForeground.fadeOut(FADE_OUT_TOTAL_TIME, this.endFadeOut);
		}
	}

}