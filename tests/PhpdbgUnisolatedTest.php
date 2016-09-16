<?php

class PhpdbgUnisolatedTest extends \PHPUnit_Framework_TestCase
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
