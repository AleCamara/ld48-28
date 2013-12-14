package ld28.utils 
{
	import flash.geom.Rectangle;
	
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Canvas;
	
	import ld28.Settings;
	
	/**
	 * ...
	 * @author Alejandro Cámara
	 */
	public class DebugTools 
	{
		// Creates a Canvas that can be used to visualise the entity hitbox
		public static function createDebugCanvas(entity:Entity):Canvas
		{
			var canvas:Canvas = new Canvas(2000, 2000);
			canvas.fill(
				new Rectangle(
					entity.left - entity.x + Settings.SCREEN_PADDING + 1000,
					entity.top - entity.y + Settings.SCREEN_PADDING + 1000,
					entity.width,
					entity.height),
				0xFFFF0000,
				0.35);
			canvas.x = -1000;
			canvas.y = -1000;
			return canvas;
		}
	}

}