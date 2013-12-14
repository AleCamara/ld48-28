package ld28.utils 
{
	/**
	 * ...
	 * @author Alejandro Cámara
	 */
	public class ExtraMath 
	{
		// Returns the clamped value in the range specified
		public static function clamp(value:Number, min:Number, max:Number):Number
		{
			return Math.min(max, Math.max(min, value));
		}
	}

}