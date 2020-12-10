class RegistrationsController < Devise::RegistrationsController
  def new
    @user = User.new
    @user.build_expert
  end

  def create
    # if :profile == "Auxiliar externo"
    @user = current_user.expert.build(sign_up_params)
    if @user.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def sign_up_params
    params.require(:user).permit(:full_name, :profile, :email, :password, :password_confirmation, experts_attributes: %i[doc_number phone_number city distance accept curriculum])
  end
end
