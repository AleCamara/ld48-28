package ld28.entity 
{
	import net.flashpunk.FP;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Canvas;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	
	import ld28.Assets;
	import ld28.Settings;
	import ld28.world.LevelWorld;
	import ld28.utils.DebugTools;
	
	/**
	 * ...
	 * @author Alejandro Cámara
	 */
	public class FinishLine extends Entity
	{
		///////////////////////////////////////
		// Public interface and data members //
		///////////////////////////////////////
		
		public function FinishLine(y:Number, x:Number, level:LevelWorld = null) 
		{
			// Load graphics
			_sprite = new Spritemap(Assets.FINISH_LINE, Settings.FINISH_LINE_WIDTH, Settings.FINISH_LINE_HEIGHT);
			_sprite.add("default", Settings.FINISH_LINE_FRAMES, Settings.FINISH_LINE_FRAMERATE);
			_sprite.play("default");
			addGraphic(_sprite);
			
			// Initial position
			this.x = x;
			this.y = y;
			
			// Set hitbox
			setHitbox(Settings.FINISH_LINE_HB_WIDTH, Settings.FINISH_LINE_HB_HEIGHT,
					  Settings.FINISH_LINE_HB_XOFFSET, Settings.FINISH_LINE_HB_YOFFSET);
			
			// Parent level
			_level = level;
			
			type = COLLIDER_TYPE;
			
			// Canvas for debugging collision hitboxes
			addGraphic(DebugTools.createDebugCanvas(this));
		}
		
		// Makes sure the tint is correct
		override public function update():void
		{
			setTintColour(_level.getCurrentColour());
			super.update();
		}
		
		// Sets the tint colour to the specified Id
		public function setTintColour(colour:uint):void
		{
			_sprite.color   = Assets.PAINT_COLOUR[colour];
			_sprite.tinting = 1.0;
		}
		
		public static const COLLIDER_TYPE:String = "finish";
		
		////////////////////////////////////////
		// Private interface and data members //
		////////////////////////////////////////
		
		private var _sprite:Spritemap = null;
		
		private var _level:LevelWorld = null;
	}

}