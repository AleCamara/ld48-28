package ld28.entity 
{
	import flash.display.BitmapData;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Canvas;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	
	import ld28.Assets;
	import ld28.Settings;
	
	/**
	 * ...
	 * @author Alejandro Cámara
	 */
	public class TextEntity extends Entity
	{
		public function TextEntity(
			text:String,
			size:uint,
			colour:uint,
			x:int,
			y:int,
			width:uint,
			height:uint,
			padding:uint = 0,
			bgColour:uint = 0xFF404040,
			layer:uint = 0)
		{
			// Initialise graphic list
			_graphicList = new Graphiclist();
			_graphicList.x = x;
			_graphicList.y = y;
			
			// Create background
			var bgData:BitmapData = new BitmapData(width, height, true, bgColour);
			_background = new Image(bgData);
			_graphicList.add(_background);
			
			// Create text Graphic
			_text = new Text(text);
			_text.size   = size;
			_text.width  = width  - (2 * padding);
			_text.height = height - (2 * padding);
			_text.x      = padding;
			_text.y      = padding;
			_graphicList.add(_text);
			
			// Set entity graphic
			graphic = _graphicList;
			
			// Position text in the specified layer
			this.layer = layer;
		}
		
		public function setText(text:String):void
		{
			_text.text = text;
		}
		
		public function setColour(colour:uint):void
		{
			_text.color = colour;
		}
		
		private var _graphicList:Graphiclist = null;
		private var _text:Text               = null;
		private var _background:Image        = null;
	}
}