package funkin.game.play;

import funkin.game.play.Judgement;

class JudgementManager {
	/**
	 * Contains a list of judgements.
	 * TODO: modding for this bull.
	**/
	private static var list:Array<Judgement> = [
		#if USE_EPICS
		new Judgement("Epic", 350, 25.0, 1.0, true).assignImage("epic"),
		#end
		new Judgement("Sick", 300, 50.0, #if USE_EPICS Options.useEpics ? 0.99875 : 1.0 #else 1.0 #end, true).assignImage("sick"),
		new Judgement("Good", 200, 187.5, 0.75, false).assignImage("good"),
		new Judgement("Bad", 100, 225.0, 0.45, false).assignImage("bad"),
		new Judgement("Shit", 50, 250.0, 0.25, false).assignImage("shit"),
	];

	public static function judge(time:Float):Judgement {
		for (j in JudgementManager.list)
			if (j.hitWindow > -1 && time <= j.hitWindow)
				return j;
		return JudgementManager.list[JudgementManager.list.length - 1];
	}
}
