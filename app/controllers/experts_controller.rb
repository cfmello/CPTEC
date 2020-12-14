class ExpertsController < ApplicationController
  def edit
    @expert = Expert.find(params[:id])
    @field = Field.new
  end

  def update
    @expert = Expert.find(params[:id])
    if @expert.update_attributes(edit_params)
      flash[:notice] = "Operação realizada com sucesso"
      redirect_to @expert
    else
      flash[:alert] = @expert.errors.messages.join('<br>').html_safe
      render 'edit'
    end
  end

  def index
    @experts = Expert.where(active: true)
    @experts = @experts.city_search(params[:city]) if params[:city].present?
    @experts = @experts.pratictioner_search(params[:practitioner]) if params[:practitioner].present?
    @experts = Expert.where(active: true).last(10) unless params[:city].present? || params[:practitioner].present?
    @pratictioners = Field.distinct.pluck(:area) + Field.distinct.pluck(:title)
  end

  def show
    @expert = Expert.find(params[:id])
  end

  private

  def edit_params
    params.require(:expert).permit(:phone_number, :city, :distance, :curriculum, :accept)
  end
end
