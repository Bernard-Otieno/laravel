<?php

namespace App\Admin\Controllers;

use OpenAdmin\Admin\Controllers\AdminController;
use OpenAdmin\Admin\Form;
use OpenAdmin\Admin\Grid;
use OpenAdmin\Admin\Show;
use \App\Models\credit_Card;

class card_Controller extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'credit_Card';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new credit_Card());

        $grid->column('card_id', __('Card id'));
        $grid->column('card_no', __('Card no'));
        $grid->column('Account_id', __('Account id'));
        $grid->column('Amount', __('Amount'));
        $grid->column('CVV', __('CVV'));
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
        $show = new Show(credit_Card::findOrFail($id));

        $show->field('card_id', __('Card id'));
        $show->field('card_no', __('Card no'));
        $show->field('Account_id', __('Account id'));
        $show->field('Amount', __('Amount'));
        $show->field('CVV', __('CVV'));
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
        $form = new Form(new credit_Card());

        $form->number('card_no', __('Card no'));
        $form->number('CVV', __('CVV'));

        return $form;
    }
}
