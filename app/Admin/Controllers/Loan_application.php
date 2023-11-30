<?php

namespace App\Admin\Controllers;

use OpenAdmin\Admin\Controllers\AdminController;
use OpenAdmin\Admin\Form;
use OpenAdmin\Admin\Grid;
use OpenAdmin\Admin\Show;
use \App\Models\loans;

class Loan_application extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'loans';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new loans());

        $grid->column('id', __('Id'));
        $grid->column('account_id', __('Account id'));
        $grid->column('loan_purpose', __('Loan purpose'));
        $grid->column('amount', __('Amount'));
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
        $show = new Show(loans::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('account_id', __('Account id'));
        $show->field('loan_purpose', __('Loan purpose'));
        $show->field('amount', __('Amount'));
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
        $form = new Form(new loans());

        $form->number('account_id', __('Account id'));
        $form->text('loan_purpose', __('Loan purpose'));
        $form->number('amount', __('Amount'));

        return $form;
    }
}
