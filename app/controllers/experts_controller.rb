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

  private

  def edit_params
    params.require(:expert).permit(:phone_number, :city, :distance, :curriculum, :accept)
  end
  
end
