package aerys.konami
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;

	[Event(name="triggered", type="aerys.konami.KonamiCodeEvent")]
	public class KonamiCode extends Sprite
	{		
		public static const DEFAULT_SEQUENCE    : Array     =
			[Keyboard.UP,
				Keyboard.UP,
				Keyboard.DOWN,
				Keyboard.DOWN,
				Keyboard.LEFT,
				Keyboard.RIGHT,
				Keyboard.LEFT,
				Keyboard.RIGHT,
				Keyboard.B,
				Keyboard.A];
		
		private var _trigger            		: Function  = null;
		private var _state          		    : int       = 0;
		private var _sequence					: Array		= null;
		
		public function KonamiCode(sequence : Array = null)
		{
			_sequence ||= DEFAULT_SEQUENCE;

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
			if (event.keyCode == _sequence[_state])
				_state++;
			else
				_state = 0;
			
			if (_state == _sequence.length)
			{
				if (_trigger != null)
					_trigger();

				dispatchEvent(new KonamiCodeEvent(KonamiCodeEvent.TRIGGERED));
				_state = 0;
			}
		}
	}
}