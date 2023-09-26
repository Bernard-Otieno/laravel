<?php

namespace App\Admin\Controllers;

use OpenAdmin\Admin\Controllers\AdminController;
use OpenAdmin\Admin\Form;
use OpenAdmin\Admin\Grid;
use OpenAdmin\Admin\Show;
use \App\Models\customer;

class customer extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'customer';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new customer());

        $grid->column('customer_id', __('Customer id'));
        $grid->column('Email', __('Email'));
        $grid->column('Password', __('Password'));
        $grid->column('Account_no', __('Account no'));
        $grid->column('created_at', __('Created at'));
        $grid->column('updated_at', __('Updated at'));

        return $grid;
    }

    /**
     * Make a show builder.
     *
     * @param mixed $id
     * @return Show
     */
    protected function detail($id)
    {
        $show = new Show(customer::findOrFail($id));

        $show->field('customer_id', __('Customer id'));
        $show->field('Email', __('Email'));
        $show->field('Password', __('Password'));
        $show->field('Account_no', __('Account no'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new customer());

        $form->email('Email', __('Email'));
        $form->password('Password', __('Password'));
        $form->number('Account_no', __('Account no'));

        return $form;
    }
}
