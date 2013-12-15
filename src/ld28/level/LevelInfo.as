package ld28.level 
{
	import ld28.Settings;
	
	/**
	 * ...
	 * @author Alejandro Cámara
	 */
	public class LevelInfo 
	{
		///////////////////////////////////////
		// Public interface and data members //
		///////////////////////////////////////
		
		public function LevelInfo(startX:uint, startY:uint, endX:uint, endY:uint, startColour:uint, levelTitle:String, levelText:String):void
		{
			_startX      = startX;
			_startY      = startY;
			_endX        = endX;
			_endY        = endY;
			_startColour = startColour;
			_levelTitle  = levelTitle;
			_levelText   = levelText;
		}
		
		// Getters for the data members
		public function getStartX():uint
		{
			return _startX;
		}
		public function getEndX():uint
		{
			return _endX;
		}
		public function getStartY():uint
		{
			return _startY;
		}
		public function getEndY():uint
		{
			return _endY;
		}
		public function getStartColour():uint
		{
			return _startColour;
		}
		public function getTitle():String
		{
			return _levelTitle;
		}
		public function getText():String
		{
			return _levelText;
		}
		
		////////////////////////////////////////
		// Private interface and data members //
		////////////////////////////////////////
		
		private var _startX:uint;
		private var _startY:uint;
		private var _endX:uint;
		private var _endY:uint;
		private var _startColour:uint;
		private var _levelTitle:String;
		private var _levelText:String;
	}

}