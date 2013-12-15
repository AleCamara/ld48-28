package ld28.entity 
{
	import flash.display.BitmapData;
	
	import net.flashpunk.FP;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Backdrop;
	
	import ld28.world.LevelWorld;
	import ld28.utils.Assert;
	
	/**
	 * ...
	 * @author Alejandro Cámara
	 */
	public class Foreground extends Entity
	{
		public function Foreground(y:Number, x:Number, colour:uint):void 
		{
			// Fade colour must have alpha 1.0
			_textureData = new BitmapData(1, 1, true, (colour | 0xFF000000));
			_backdrop = new Backdrop(_textureData, true, true);
			
			graphic = _backdrop;
		}
		
		override public function update():void
		{
			// If timer is active, reduce its time
			if (_fadeInTimer > 0.0)
			{
				_fadeInTimer -= FP.elapsed;
				
				// If timer ends this frame, call the callback
				if (_fadeInTimer <= 0.0)
				{
					_backdrop.alpha = 0.0;
					triggerCallback();
				}
				else
				{
					_backdrop.alpha = _fadeInTimer / _fadeInMaxTime; 
				}
			}
			if (_fadeOutTimer > 0.0)
			{
				_fadeOutTimer -= FP.elapsed;
				
				// If timer ends this frame, call the callback
				if (_fadeOutTimer <= 0.0)
				{
					_backdrop.alpha = 1.0;
					triggerCallback();
				}
				else
				{
					_backdrop.alpha = 1.0 - _fadeOutTimer / _fadeOutMaxTime; 
				}
			}
		}
		
		// Fades the foreground to the dark colour in the given amount of time
		// At the end calls _level.endFadeIn()
		public function fadeIn(time:Number, callback:Function):void
		{
			_callback = callback;
			
			if (time > 0.0)
			{
				_fadeInTimer   = time;
				_fadeInMaxTime = time;
			}
			else
			{
				_backdrop.alpha = 1.0;
				triggerCallback();
			}
		}
		
		// Fades out the foreground in the given amount of time
		// At the end calls _level.endFadeOut()
		public function fadeOut(time:Number, callback:Function):void
		{
			_callback = callback;
			
			if (time > 0.0)
			{
				_fadeOutTimer   = time;
				_fadeOutMaxTime = time;
			}
			else
			{
				_backdrop.alpha = 0.0;
				triggerCallback();
			}
		}
		
		private var _backdrop:Backdrop      = null;
		private var _textureData:BitmapData = null;
		private var _callback:Function      = null;
		
		private var _fadeInTimer:Number    = 0.0;
		private var _fadeOutTimer:Number   = 0.0;
		private var _fadeInMaxTime:Number  = 0.0;
		private var _fadeOutMaxTime:Number = 0.0;
		
		private function triggerCallback():void
		{
			if (null != _callback)
			{
				// We need to do this so the callback can create a new fade effect
				// This is used to concatenate a fade out with a fade in
				var callback:Function = _callback;
				_callback = null;
				callback();
			}
		}
	}
}