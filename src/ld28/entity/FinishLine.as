package ld28.entity 
{
	import net.flashpunk.FP;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Canvas;
	import net.flashpunk.graphics.Image;
	
	import ld28.Assets;
	import ld28.LevelWorld;
	import ld28.Settings;
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
			addGraphic(_image);
			
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
		
		public static const COLLIDER_TYPE:String = "finish";
		
		////////////////////////////////////////
		// Private interface and data members //
		////////////////////////////////////////
		
		private const _image:Image = new Image(Assets.FINISH_LINE);
		
		private var _level:LevelWorld = null;
	}

}