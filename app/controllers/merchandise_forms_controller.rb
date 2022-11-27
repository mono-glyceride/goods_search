class MerchandiseFormsController < ApplicationController
  before_action :set_merchandise_form, only: %i[edit update destroy]
  before_action :authenticate_user!

  def index
  end

  def new
    @merchandise_form = MerchandiseForm.new
  end

  def create
    @merchandise_form = MerchandiseForm.new(merchandise_form_params)
    if @merchandise_form.valid?
      @merchandise_form.save(current_user)
      flash[:notice] = 'グッズ情報を登録しました！'
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @merchandise_form = MerchandiseForm.new(merchandise_form: @merchandise_form)
  end

  def update
  end

  def destroy
  end

  private
    def set_merchandise_form
      @merchandise_form = merchandise_form.find(params[:id])
    end

    def merchandise_form_params
      params.require(:merchandise_form).permit(:wanted_merchandise, :owned_merchandises, :keywords)
    end
end
