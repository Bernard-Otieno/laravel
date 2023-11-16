<?php

namespace Tests\Browser;

use Illuminate\Foundation\Testing\DatabaseMigrations;
use Laravel\Dusk\Browser;
use Tests\DuskTestCase;
use Tests\Browser\factory;
class ExampleTest extends DuskTestCase
{
    /**
     * A basic browser test example.
     */
    public function testLogin()
    {
        $this->browse(function (Browser $browser) {
            $browser->visit('/login')
                    
                    ->press('login')
                    ->assertPathIs('/')
                    ->visit('history') // Click on a link with the text 'Profile'
                    ->assertPathIs('/history') // Update to the path you expect after clicking the 'Profile' link
                    ->visit('transaction') // Visit another page directly
                    ->assertPathIs('/transaction');
        });
    }
    public function testRegisterView()
    { 
        $this->browse(function (Browser $browser) {
             $browser-> visit('/registration')
                     ->type('email', 'test@test.com')
                     ->type('password', '54321')
                     ->type('Account_no', '12333')
                     ->type('First_name', 'test')
                     ->type('Second_name', 'tester')
                     ->press('register');




        });

    }
    public function testAdminView()
    { 
        $this->browse(function (Browser $browser) {
             $browser-> visit('/admin');
             
        });
        
    }
   


//    public function testAdmin()
//     {
//         $this->browse(function (Browser $browser) {
//             $browser->visit('/admin')
//                     ->type('username', 'admin')
//                     ->type('password', 'admin')
//                     ->press('ye25de')
//                     ->assertPathIs('/');
//         });
//     }
}
