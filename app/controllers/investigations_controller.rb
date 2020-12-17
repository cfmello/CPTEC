class InvestigationsController < ApplicationController
  before_action :validar_acesso, except: :index
  before_action :validar_acesso_update, only: :update
  before_action :fetch_expert, except: %i[show index]
  def new
    @investigation = Investigation.new
  end

  def create
    @expert = Expert.find(params[:expert_id])
    @investigation = Investigation.new(investigation_params)
    @investigation.servant = @servant
    @investigation.expert = @expert
    if @investigation.save
      flash[:notice] = "Convocação confirmada"
      mail = UserMailer.with(expert: @expert).convoca(current_user, @investigation.proc_number)
      mail.deliver_now
      redirect_to @investigation
    else
      flash[:alert] = @investigation.errors.messages.values.join('<br>').html_safe
      render 'new'
    end
  end

  def show
    @investigation = Investigation.find(params[:id])
  end

  def index
    @investigations = ('2'..'3').to_a.include?(current_user.profile) ? Investigation.all : Investigation.where(expert: current_user.expert)
  end

  def update
    raise
    if @investigation.update_attributes(investigation_params_update)
      flash[:success] = "Opção registrada"
      redirect_to @investigation
    else
      flash[:error] = @investigation.errors.messages.values.join('<br>').html_safe
      render 'edit'
    end
  end

  private

  def investigation_params
    params.require(:investigation).permit(:proc_number, :call_date)
  end

  def investigation_params_update
    params.require(:investigation).permit(:status)
  end

  def redirect_unauthorized
    flash[:alert] = 'Não autorizado'
    redirect_to root_path
  end

  def validar_acesso
    @servant = Servant.find_by(user_id: current_user.id)
    redirect_unauthorized unless ('2'..'3').to_a.include?(current_user.profile)
  end

  def validar_acesso_update
    @investigation = Investigation.find(params[:id])
    redirect_unauthorized unless current_user.profile == '1' && current_user.expert == @investigation.expert
  end

  def fetch_expert
    @expert = Expert.find(params[:expert_id])
  end
end
