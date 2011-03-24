Aerys Konami Code
=================


Simple AS3 library to catch the famous Konami Code.


Usage
-----

Simply:

    addChild(new KonamiCode().onTrigger(konamiHandler));

where `konamiHandler` is a function taking no arguments.

You can also use the dispatched event:

    var konami : KonamiCode = new KonamiCode();
    konami.addEventListener(KonamiCodeEvent.TRIGGERED, konamiHandler);
    addChild(konami);

where `konamiHandler` is a function taking an argument of type `KonamiCodeEvent`.


Contribute
----------

`aerys-konami-code` is WTFPL-licensed.

* [Source code](https://github.com/aerys/konami-code)
* [Issue tracker](https://github.com/aerys/konami-code/issues)
