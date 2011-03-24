package aerys.konami
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;

	[Event(name="triggered", type="aerys.konami.KonamiCodeEvent")]
	public class KonamiCode extends Sprite
	{		
		private var _trigger            : Function  = null;
		private var _state              : int       = 0;
		
		public static const SEQUENCE    : Array     =
		   [Keyboard.UP,
		    Keyboard.UP,
		    Keyboard.DOWN,
		    Keyboard.DOWN,
		    Keyboard.LEFT,
		    Keyboard.RIGHT,
		    Keyboard.LEFT,
		    Keyboard.RIGHT,
		    66,
		    65];

		public function KonamiCode()
		{
			addEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
			addEventListener(Event.REMOVED_FROM_STAGE, removedFromStageHandler);
		}
		
		public function onTrigger(trigger : Function) : KonamiCode
		{
			_trigger = trigger;
			return this;
		}
		
		private function addedToStageHandler(event : Event) : void
		{
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
		}
		
		private function removedFromStageHandler(event : Event) : void
		{
			stage.removeEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
		}
		
		private function keyDownHandler(event : KeyboardEvent) : void
		{
			if (event.keyCode == SEQUENCE[_state])
				_state++;
			else
				_state = 0;
			
			if (_state == SEQUENCE.length)
			{
				if (_trigger != null)
					_trigger();

				dispatchEvent(new KonamiCodeEvent(KonamiCodeEvent.TRIGGERED));
				_state = 0;
			}
		}
	}
}