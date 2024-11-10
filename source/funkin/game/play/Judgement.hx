package funkin.game.play;

/**
 * Holds the judgement data.
**/
class Judgement {
	/**
	 * Judgement Name.
	**/
	public var name:String = "Unknown";

	/**
	 * Score award for hitting this judgement.
	**/
	public var score:Int = 0;

	/**
	 * Judgement Hit Window.
	**/
	public var hitWindow:Float = -1;

	/**
	 * Whether the Judgement causes a note splash to appear.
	**/
	public var noteSplash:Bool = false;

	/**
	 * Accuracy award for hitting this judgement.
	**/
	public var accuracy:Float = 0.0;

	/**
	 * Judgement Image path (as string),
	 *
	 * if null, the judgement will be invisible.
	**/
	public var image:String = null;

	/**
	 * Creates a new judgement and assigns it a name and a hit window.
	 *
	 * @param name			Name. (i.e: Sick)
	 * @param score			Score award for hitting.
	 * @param hitWindow		Hit Window.
	 * @param accuracy		Accuracy award for hitting.
	 * @param noteSplash	If it causes a note splash to pop.
	**/
	public function new(name:String, score:Int = 0, hitWindow:Float = -1, accuracy:Float = 0.0, noteSplash:Bool = false):Void {
		this.name = name;
		this.score = score;
		this.hitWindow = hitWindow;
		this.noteSplash = noteSplash;
		this.accuracy = accuracy;
	}

	/**
	 * Points to a specific image to use for the judgement.
	 * @param image		file name (lacking extension, e.g: sick).
	**/
	public function assignImage(image:String):Judgement {
		this.image = image;
		return this;
	}
}
