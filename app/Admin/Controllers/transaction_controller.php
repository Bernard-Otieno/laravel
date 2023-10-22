<?php

namespace App\Admin\Controllers;

use OpenAdmin\Admin\Controllers\AdminController;
use OpenAdmin\Admin\Form;
use OpenAdmin\Admin\Grid;
use OpenAdmin\Admin\Show;
use \App\Models\transaction;

class transaction_controller extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'transaction';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new transaction());

        $grid->column('transaction_id', __('Transaction id'));
        $grid->column('card_no', __('Card no'));
        $grid->column('card_id', __('card_id'));
        $grid->column('beneficiary_no', __('Beneficiary no'));
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
        $show = new Show(transaction::findOrFail($id));

        $show->field('transaction_id', __('Transaction id'));
        $show->field('card_no', __('Card no'));
        $show->field('card_id', __('card_id'));
        $show->field('beneficiary_no', __('Beneficiary no'));
        $show->field('Amount', __('Amount'));
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
        $form = new Form(new transaction());

        $form->number('card_no', __('Card no'));
        $form->number('beneficiary_no', __('Beneficiary no'));
        $form->number('Amount', __('Amount'));

        return $form;
    }
}
