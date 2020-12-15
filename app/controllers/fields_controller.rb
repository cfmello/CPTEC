class FieldsController < ApplicationController
  before_action :validar_acesso, except: :destroy
  before_action :validar_acesso_destroy, only: :destroy
  def create
    @field = Field.new(field_params)
    @field.expert = @expert
    if @field.save
      flash[:notice] = "Especialidade adicionada"
    else
      flash[:alert] = @field.errors.messages.values.join('<br>')
    end
    redirect_to edit_expert_path(@expert, anchor: "field-#{@field.id}")
  end

  def destroy
    if @field.destroy
      flash[:notice] = 'Especialidade removida'
    else
      flash[:alert] = @field.errors.messages.values.join('<br>')
    end
    redirect_to edit_expert_path(@field.expert)
  end

  def update
    @field = Field.find(params[:id])
    if @field.update_attributes(field_params)
      flash[:notice] = "Especialidade foi atualizada"
    else
      flash[:alert] = @field.errors.messages.values.join('<br>')
    end
    redirect_to edit_expert_path(@field.expert, anchor: "field-#{@field.id}")
  end

  private

  def field_params
    params.require(:field).permit(:area, :reg_number, :title)
  end

  def validar_acesso
    @expert = Expert.find(params[:expert_id])
    unless current_user.id == @expert.user.id
      flash[:alert] = 'Não autorizado'
      redirect_to root_path
    end
  end

  def validar_acesso_destroy
    @field = Field.find(params[:id])
    unless current_user.id == @field.expert.user.id && current_user.profile == '1'
      flash[:alert] = 'Não autorizado'
      redirect_to root_path
    end
  end
end
