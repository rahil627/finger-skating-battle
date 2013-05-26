package entities;

import com.haxepunk.Entity;
import com.haxepunk.HXP;
import nme.display.Sprite;
import nme.geom.Point;

/**
 * ...
 * @author Rahil Patel
 */
class Trail extends Entity
{

	// i don't think z-order will be correct anyway, just use HXP.sprite, well, it might, I'm not sure
	
	// utils.Draw draws a sprite to HXP.buffer (BitmapData), this may have bad performance, but it doesn't even work anyway
	
	// need to either add a Sprite to HXP.stage or HXP.engine
	
	// todo: add a single Sprite for everything to draw to, like the effects layer in HaxeFlixel
	
	// use addChildAt to order the sprites
	public var points:List<Point>;
	
	private var sprite:Sprite;
	private var maxPointsLength:Int;
	private var drawOnce:Bool;
	private var drawn:Bool = false;
	
	/**
	 * to use, just add points to points
	 */
	public function new(maxPointsLength:Int = 15, drawOnce:Bool = false)
	{
		super();
		sprite = new Sprite();
		HXP.stage.addChild(sprite);
		points = new List<Point>();
		this.maxPointsLength = maxPointsLength;
		this.drawOnce = drawOnce;
		
		sprite.graphics.lineStyle(10, 0xFFFFFF, .5);
	}
	
	override public function added():Void 
	{
		super.added();
	}
	
	override public function removed():Void 
	{
		HXP.stage.removeChild(sprite);
		super.removed();
	}
	
	override public function update():Void 
	{
		super.update();
		
		if (drawn)
			return;
		
		if (points.length < 2)
			return;
			
		if (points.length > maxPointsLength)
			points.remove(points.last());
		
		sprite.graphics.clear();
		sprite.graphics.lineStyle(10, 0xFFFFFF, .5);
		
		for (p in points) 
		{
			if (p == points.first()) { // magic?
				sprite.graphics.moveTo(p.x, p.y);
				continue;
			}
			
			sprite.graphics.lineTo(p.x, p.y);
			sprite.graphics.moveTo(p.x, p.y);
		}
		
		if (drawOnce)
			drawn = true;
	}
	
	override public function render():Void 
	{
		super.render();
	}
	
}