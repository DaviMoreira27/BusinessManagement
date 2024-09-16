<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use PHPUnit\Framework\TestCase;

class ExampleTest extends TestCase
{
    /**
     * A basic test example.
     */
    public function test_that_true_is_true(): void
    {
        $this->assertTrue(true);
    }
}


// Feature test Example

// namespace Tests\Feature;

// use Illuminate\Foundation\Testing\RefreshDatabase;
// use Tests\TestCase;


/*
  The name and location change is due to this bug on PHPUnit
  https://github.com/nunomaduro/collision/issues/293
*/

// class ExampleTest extends TestCase
// {
    /*
      A basic test example.
      
    public function test_the_application_returns_a_successful_response(): void
    {
        $response = $this->get('/');

        $response->assertStatus(200);
    }
    */

// }
