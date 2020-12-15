class InvestigationsController < ApplicationController
  def new
    @investigation = Investigation.new
    @expert = Expert.find(params[:expert_id])
    @servant = Servant.find_by(user_id: current_user.id)
  end
  
  def create
    # render root_path unless (2..3).to_a.include?(current_user.profile)
    @expert = Expert.find(params[:expert_id])
    @investigation = Investigation.new(investigation_params)
    @investigation.cost = 'Aceite pendente'
    if @investigation.save
      flash[:notice] = "O perito receberá um convite por email"
      redirect_to @investigation
    else
      flash[:alert] = @investigation.errors.messages.join('<br>').html_safe
      render 'new'
    end
  end

  private

  def investigation_params
    params.require(:investigation).permit(:proc_number, :servant, :call_date)
  end
end
