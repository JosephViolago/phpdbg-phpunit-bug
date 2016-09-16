# phpdbg-phpunit-bug

Symptom: `phpdbg` does not count the assertions of tests run in isolation, but always returns true.

## Info

```
$ phpdbg --version
phpdbg 0.5.0 (built: Jul  7 2016 14:02:56)
PHP 7.0.8, Copyright (c) 1997-2016 The PHP Group
Zend Engine v3.0.0, Copyright (c) 1998-2016 Zend Technologies
    with Xdebug v2.4.0, Copyright (c) 2002-2016, by Derick Rethans

```
