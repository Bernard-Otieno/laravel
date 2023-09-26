<?php

namespace App\Admin\Controllers;

use OpenAdmin\Admin\Controllers\AdminController;
use OpenAdmin\Admin\Form;
use OpenAdmin\Admin\Grid;
use OpenAdmin\Admin\Show;
use \App\Models\reportTransaction;

class reportTransaction_controller extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'reportTransaction';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new reportTransaction());

        $grid->column('report_id', __('Report id'));
        $grid->column('transaction_id', __('Transaction id'));
        $grid->column('card_id', __('Card id'));
        $grid->column('details', __('Details'));
        $grid->column('is_resolved', __('Is resolved'));
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
        $show = new Show(reportTransaction::findOrFail($id));

        $show->field('report_id', __('Report id'));
        $show->field('transaction_id', __('Transaction id'));
        $show->field('card_id', __('Card id'));
        $show->field('details', __('Details'));
        $show->field('is_resolved', __('Is resolved'));
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
        $form = new Form(new reportTransaction());

        $form->number('transaction_id', __('Transaction id'));
        $form->number('card_id', __('Card id'));
        $form->textarea('details', __('Details'));
        $form->switch('is_resolved', __('Is resolved'));

        return $form;
    }
}
