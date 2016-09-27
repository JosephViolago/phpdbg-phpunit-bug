# phpdbg-phpunit-bug
[![Build Status](https://travis-ci.org/JosephViolago/phpdbg-phpunit-bug.svg?branch=master)](https://travis-ci.org/JosephViolago/phpdbg-phpunit-bug)


Symptom: `phpdbg` does not evaluate the assertions of tests run in isolation, but will always returns true.
This results in a false positive.

## Info

```
$ phpdbg --version
phpdbg 0.5.0 (built: Jul  7 2016 14:02:56)
PHP 7.0.8, Copyright (c) 1997-2016 The PHP Group
Zend Engine v3.0.0, Copyright (c) 1998-2016 Zend Technologies
    with Xdebug v2.4.0, Copyright (c) 2002-2016, by Derick Rethans

```

What I expect:

```
PHPUnit 5.3.4 by Sebastian Bergmann and contributors.

Runtime:       PHP 7.0.8 with Xdebug 2.4.0
Configuration: /Users/joev/src/phpdbg-phpunit-bug/phpunit.xml

.F.F                                                                4 / 4 (100%)

Time: 140 ms, Memory: 4.00MB

There were 2 failures:

1) PhpdbgIsolatedTest::testFailingTestFails
Failed asserting that false is true.

/Users/joev/src/phpdbg-phpunit-bug/tests/PhpdbgIsolatedTest.php:16

2) PhpdbgUnisolatedTest::testFailingTestFails
Failed asserting that false is true.

/Users/joev/src/phpdbg-phpunit-bug/tests/PhpdbgUnisolatedTest.php:12

FAILURES!
Tests: 4, Assertions: 4, Failures: 2.
```

TAP:

```
TAP version 13
ok 1 - PhpdbgIsolatedTest::testPassingTestPasses
not ok 2 - Failure: PhpdbgIsolatedTest::testFailingTestFails
  ---
  message: 'Failed asserting that false is true.'
  severity: fail
  ...
ok 3 - PhpdbgUnisolatedTest::testPassingTestPasses
not ok 4 - Failure: PhpdbgUnisolatedTest::testFailingTestFails
  ---
  message: 'Failed asserting that false is true.'
  severity: fail
  ...
1..4
```

What I get:

```
PHPUnit 5.3.4 by Sebastian Bergmann and contributors.

Runtime:       PHPDBG 7.0.8
Configuration: /Users/joev/src/phpdbg-phpunit-bug/phpunit.xml

...F                                                                4 / 4 (100%)

Time: 105 ms, Memory: 4.00MB

There was 1 failure:

1) PhpdbgUnisolatedTest::testFailingTestFails
Failed asserting that false is true.

/Users/joev/src/phpdbg-phpunit-bug/tests/PhpdbgUnisolatedTest.php:12

FAILURES!
Tests: 4, Assertions: 2, Failures: 1.
```

TAP:

```
TAP version 13
ok 1 - PhpdbgIsolatedTest::testPassingTestPasses
ok 2 - PhpdbgIsolatedTest::testFailingTestFails
ok 3 - PhpdbgUnisolatedTest::testPassingTestPasses
not ok 4 - Failure: PhpdbgUnisolatedTest::testFailingTestFails
  ---
  message: 'Failed asserting that false is true.'
  severity: fail
  ...
1..4
```

Take note of not only the difference in the amount of failures, but also the amount of assertions as well.
