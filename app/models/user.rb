class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  after_create :send_welcome_email

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :expert
  accepts_nested_attributes_for :expert

  private

  def send_welcome_email
    UserMailer.with(user: self).welcome.deliver_now
  end
end
