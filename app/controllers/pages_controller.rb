class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home about guidance]

  def home
  end

  def about
  end

  def guidance
  end
end
