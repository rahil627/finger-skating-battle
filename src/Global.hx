import com.haxepunk.utils.Touch;
import entities.TouchEntity;
import nme.Vector;

/**
 * Game specific constants
 * and hackish solutions
 * @author Rahil Patel
 */
class Global
{
	public static var bottomPlayerScore:Int = 0;
	public static var topPlayerScore:Int = 0;
	public static var turn:Turn = Turn.bottomPlayer;
	
	public static var mousePressedOnTouchSprite:TouchEntity;
	
	// graphics
	public static var GRAPHIC_WHITE_PIXEL:String = "assets/graphics/white_pixel.png"; // static inline = const? only works within this class?
}

enum Turn {
	bottomPlayer;
	topPlayer;
}