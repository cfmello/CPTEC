class RegistrationsController < Devise::RegistrationsController
  def create
    @user = User.new(sign_up_params)
    if @user.profile == 'Auxiliar externo'
      if @user.save && create_expert(@user) && @expert.save
        redirect_to new_user_session_path
      else
        render :new
      end
    elsif @user.profile == "Magistrado" || @user.profile == "Servidor"
      if @user.save && create_servant(@user) && @servant.save
        redirect_to new_user_session_path
      else
        render :new
      end
    end
  end

  private

  def sign_up_params
    params.require(:user).permit(:full_name,
                                 :profile,
                                 :email,
                                 :password,
                                 :password_confirmation,
                                 experts_attributes: %i[doc_number phone_number city distance accept curriculum],
                                 servants_attributes: %i[court city])
  end

  def create_expert(user)
    @expert = Expert.new
    @expert.doc_number = params[:user][:experts][:doc_number]
    @expert.phone_number = params[:user][:experts][:phone_number]
    @expert.city = params[:user][:experts][:city]
    @expert.distance = params[:user][:experts][:distance]
    @expert.accept = params[:user][:experts][:accept]
    @expert.curriculum = params[:user][:experts][:curriculum]
    @expert.user = user
  end

  def create_servant(user)
    @servant = Servant.new
    @servant.court = params[:user][:servants][:court]
    @servant.city = params[:user][:servants][:city]
    @servant.user = user
  end
end
