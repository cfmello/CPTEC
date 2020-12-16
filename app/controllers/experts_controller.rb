class ExpertsController < ApplicationController
  before_action :validar_acesso, only: %i[edit update]
  before_action :validar_acesso_index, only: :index
  def edit
    @field = Field.new
  end

  def update
    if @expert.update_attributes(edit_params)
      flash[:notice] = "Operação realizada com sucesso"
      redirect_to @expert
    else
      flash[:alert] = @expert.errors.messages.join('<br>').html_safe
      render 'Editar'
    end
  end

  def index
    @experts = Expert.where(active: true)
    @experts = @experts.city_search(params[:city]) if params[:city].present?
    @experts = @experts.pratictioner_search(params[:practitioner]) if params[:practitioner].present?
    @experts = Expert.last(10) unless params[:city].present? || params[:practitioner].present?
    @pratictioners = Field.distinct.pluck(:area) + Field.distinct.pluck(:title)
    pick if params[:button] == 'pick'
  end

  def show
    @expert = Expert.find(params[:id])
    respond_to do |format|
      format.html
      format.json {
        render json: {
          name: @expert.user.full_name,
          content: render_to_string("show", :formats => [:html], :layout => false, :locals => {:biz => @biz})
        }
      }
    end
  end

  private

  def edit_params
    params.require(:expert).permit(:phone_number, :city, :distance, :curriculum, :accept, files: [])
  end

  def pick
    if params[:city].present? && params[:practitioner].present?
      if @experts.length.positive?
        redirect_to new_expert_investigation_path(@experts.sample)
      else
        flash[:alert] = 'Nenhum especialista para sortear. Realize nova busca'
      end
    else
      flash[:alert] = 'Aplique ambos os filtros para realizar o sorteio'
    end
  end

  def validar_acesso
    @expert = Expert.find(params[:id])
    unless current_user.id == @expert.user.id && current_user.profile == '1'
      flash[:alert] = 'Não autorizado'
      redirect_to root_path
    end
  end

  def validar_acesso_index
    unless ('2'..'3').to_a.include?(current_user.profile)
      flash[:alert] = 'Não autorizado'
      redirect_to root_path
    end
  end
end
