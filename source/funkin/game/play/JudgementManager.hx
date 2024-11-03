package funkin.game.play;

import funkin.game.play.Judgement;

/**
 * Manager for an improved judgement system.
 * @author crowplexus
**/
class JudgementManager {
	/**
	 * Contains a list of judgements.
	 * TODO: modding for this bull.
	**/
	private var list:Array<Judgement> = [
		#if USE_EPICS
		new Judgement("Epic", 350, 25.0, 1.0, true).assignImage("epic"),
		#end
		new Judgement("Sick", 300, 50.0, 1.0, true).assignImage("sick"),
		new Judgement("Good", 200, 187.5, 0.75, false).assignImage("good"),
		new Judgement("Bad", 100, 225.0, 0.45, false).assignImage("bad"),
		new Judgement("Shit", 50, 250.0, 0.25, false).assignImage("shit"),
	];
	/**
	 * Contains IDs for hittable judgements, those IDs should correspond to `JudgementManager.list`
	**/
	public var hittableJudges: Array<Int> = [];

	public function new():Void {
		#if USE_EPICS
		hittableJudges = [0,1,2,3,4];
		list[1].accuracy = Options.useEpics ? 0.99875 : 1.0;
		if (!Options.useEpics) hittableJudges.remove(0);
		#else
		hittableJudges = [0,1,2,3];
		#end
		Logs.trace('You can hit the following judgements:');
		var hittables = "";
		for (i in hittableJudges) {
			hittables = hittables + list[i].name;
			if (i < hittableJudges[hittableJudges.length - 1])
				hittables = hittables + ", ";
		}
		Logs.trace(hittables);
	}

	/**
	 * Judges a window of time and returns a judgement from it.
	 * @param time		Time window (in milliseconds).
	**/
	public function judge(time:Float):Judgement {
		for (i in hittableJudges) {
			var j: Judgement = list[i];
			if (j.hitWindow > -1 && time <= j.hitWindow)
				return j;
		}
		return list[list.length - 1];
	}
}
