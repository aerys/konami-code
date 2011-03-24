package aerys.konami
{
	import flash.events.Event;
	
	public class KonamiCodeEvent extends Event
	{
		public static const TRIGGERED	: String	= "triggered";

		public function KonamiCodeEvent(type : String = TRIGGERED, bubbles : Boolean = false, cancelable : Boolean = false)
		{
			super (type, bubbles, cancelable);
		}
	}
}