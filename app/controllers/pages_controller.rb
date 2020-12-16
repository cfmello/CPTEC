class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :about, :guidance]

  def home
  end
  def about
  end
  def guidance
  end
end
