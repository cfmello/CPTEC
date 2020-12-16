class InvestigationsController < ApplicationController
  before_action :validar_acesso
  before_action :fetch_expert, except: :show
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

  private

  def investigation_params
    params.require(:investigation).permit(:proc_number, :call_date)
  end

  def validar_acesso
    @servant = Servant.find_by(user_id: current_user.id)
    unless ('2'..'3').to_a.include?(current_user.profile)
      flash[:alert] = 'Não autorizado'
      redirect_to root_path
    end
  end

  def fetch_expert
    @expert = Expert.find(params[:expert_id])
  end
end
