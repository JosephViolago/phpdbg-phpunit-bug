<?php

/**
 * @runTestsInSeparateProcesses
 * @preserveGlobalState disabled
 */
class PhpdbgIsolatedTest extends \PHPUnit_Framework_TestCase
{
    public function testPassingTestPasses()
    {
        $this->assertTrue(true);
    }

    public function testFailingTestFails()
    {
        $this->assertTrue(false);
    }
}
