package ld28.entities 
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	import ld28.Assets;
	import ld28.Settings;
	import ld28.LevelWorld;
	import ld28.utils.ExtraMath;
	
	/**
	 * ...
	 * @author Alejandro Cámara
	 */
	public class Player extends Entity 
	{
		///////////////////////////////////////
		// Public interface and data members //
		///////////////////////////////////////
		
		public function Player(x:Number, y:Number, level:LevelWorld = null) 
		{
			// Load graphics
			graphic = _image;
			
			// Define controls
			Input.define(KEY_LEFT,  Key.LEFT,  Key.A);
			Input.define(KEY_RIGHT, Key.RIGHT, Key.D);
			Input.define(KEY_UP,    Key.UP,    Key.W);
			Input.define(KEY_DOWN,  Key.DOWN,  Key.S);
			
			// Initial position
			this.x = x;
			this.y = y;
			
			// Set hitbox
			setHitbox(Settings.PLAYER_HB_WIDTH, Settings.PLAYER_HB_HEIGHT, Settings.PLAYER_HB_XOFFSET, Settings.PLAYER_HB_YOFFSET);
			
			// Parent level
			_level = level;
		}
		
		override public function update():void
		{
			var timestep:Number = FP.elapsed;
			
			// Update input
			if (Input.check(KEY_LEFT))
			{
				_speedX -= MOVE_THRUST;
			}
			if (Input.check(KEY_RIGHT))
			{
				_speedX += MOVE_THRUST;
			}
			if (Input.pressed(KEY_UP) && (_timeFlying < TIMEFLYING_THRESHOLD))
			{
				_speedY -= JUMP_THRUST;
			}
			if (Input.released(KEY_UP) && (_speedY < 0))
			{
				_speedY = 0.0;
			}
			
			// Solve physics
			var dx:Number = _speedX * timestep;
			var dy:Number = _speedY * timestep;
			
			// Solve constraints
			if (checkValidDisplacement(dx, 0.0))
			{
				x += dx;
			}
			if (checkValidDisplacement(0.0, dy))
			{
				y += dy;
			}
			else if(dy > 0.0)
			{
				var newDy:Number = 0;
				while (checkValidDisplacement(0.0, newDy + 1.0))
				{
					newDy += 1.0;
				}
				y += newDy;
			}
			
			// Control time over the ground
			if (hasGroundContact())
			{
				_timeFlying = 0.0;
			}
			else
			{
				_timeFlying += timestep;
			}
			_isFlying = (_timeFlying > 0.0);
			
			// Reset speed
			_speedX = 0.0;
			_speedY = !_isFlying ? 0.0 : _speedY + (GRAVITY_PULL * timestep);
			
			// Clamp position within screen (except for top)
			x = ExtraMath.clamp(x, Settings.SCREEN_MIN_X, Settings.SCREEN_MAX_X);
			
			// Check out of vertical bound case
			if (Settings.SCREEN_MAX_Y < y)
			{
				_level.playerFell();
			}
		}
		
		////////////////////////////////////////
		// Private interface and data members //
		////////////////////////////////////////
		
		private static const KEY_LEFT:String  = "left";
		private static const KEY_RIGHT:String = "right";
		private static const KEY_UP:String    = "up";
		private static const KEY_DOWN:String  = "down";
		
		private static const MOVE_THRUST:Number          =  250.0;
		private static const JUMP_THRUST:Number          =  550.0;
		private static const GRAVITY_PULL:Number         = 1750.0;
		private static const TIMEFLYING_THRESHOLD:Number = 0.05;
		
		private const _image:Image     = new Image(Assets.PLAYER);
		
		private var _level:LevelWorld  = null;
		
		private var _speedX:Number     = 0.0;
		private var _speedY:Number     = 0.0;
		private var _timeFlying:Number = 0.0;
		private var _isFlying:Boolean  = false;
		
		// Checks if the player can displace by the increment specify without colliding
		private function checkValidDisplacement(dx:Number, dy:Number):Boolean
		{
			return (collide("colour" + _level.getCurrentColour(), x + dx, y + dy) == null);
		}
		
		// Checks if the player is touching the ground
		private function hasGroundContact():Boolean
		{
			return !checkValidDisplacement(0.0, 1.0);
		}
	}

}