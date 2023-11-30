<?php

namespace App\Admin\Controllers;

use OpenAdmin\Admin\Controllers\AdminController;
use OpenAdmin\Admin\Form;
use OpenAdmin\Admin\Grid;
use OpenAdmin\Admin\Show;
use \App\Models\accounts;

class accounts_controller extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'accounts';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new accounts());

        $grid->column('Account_id', __('Account id'));
        $grid->column('credit_card_id', __('Credit card id'));
        $grid->column('Customer_id', __('Customer id'));
        $grid->column('Account_no', __('Account no'));
        $grid->column('Amount', __('Amount'));
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
        $show = new Show(accounts::findOrFail($id));

        $show->field('Account_id', __('Account id'));
        $show->field('credit_card_id', __('Credit card id'));
        $show->field('Customer_id', __('Customer id'));
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
        $form = new Form(new accounts());

        $form->number('credit_card_id', __('Credit card id'));

        return $form;
    }
}
