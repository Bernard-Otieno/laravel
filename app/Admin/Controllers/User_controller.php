<?php

namespace App\Admin\Controllers;

use OpenAdmin\Admin\Controllers\AdminController;
use OpenAdmin\Admin\Form;
use OpenAdmin\Admin\Grid;
use OpenAdmin\Admin\Show;
use \App\Models\User;

class User_controller extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'User';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new User());

        $grid->column('User_id', __('id'));
        $grid->column('First_Name', __('First Name'));
        $grid->column('Second_Name', __('Second Name'));
        $grid->column('Email', __('Email'));
        $grid->column('Password', __('Password'));
        $grid->column('Account_id', __('Account id'));
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
        $show = new Show(User::findOrFail($id));

        $show->column('User_id', __('User id'));
        $show->column('First_Name', __('First Name'));
        $show->column('Second_Name', __('Second Name'));
        $show->field('Email', __('Email'));
        $show->field('Password', __('Password'));
        $show->field('Account_id', __('Account id'));
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
        $form = new Form(new User());

        $form->email('Email', __('Email'));
        $form->text('First_Name', __('First Name'));
        $form->text('Second_Name', __('Second Name'));
        $form->password('Password', __('Password'));
        $form->number('Account_id', __('Account id'));
       

        return $form;
    }
}
