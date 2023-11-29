<?php

namespace App\Admin\Controllers;

use App\Http\Controllers\Controller;
use OpenAdmin\Admin\Admin;
use OpenAdmin\Admin\Controllers\Dashboard;
use OpenAdmin\Admin\Layout\Column;
use OpenAdmin\Admin\Layout\Content;
use OpenAdmin\Admin\Layout\Row;

class HomeController extends Controller
{
    public function index(Content $content)
    {
        return $content
            ->css_file(Admin::asset("open-admin/css/pages/dashboard.css"))
            ->title('Dashboard')
            ->description('Welcome Admin')
            ->row(function (Row $row) {

                
            });
    }

    public function plot()
    {
        return Admin::content(function (Content $content) {
    
            $content->header('chart');
            $content->description('.....');
    
            $content->body(view('admin.charts.bar'));
        });
    }
    
}
