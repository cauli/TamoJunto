class User < ActiveRecord::Base

  include User::Image,
          User::Authorizable,
          User::Voter

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  validates :name, presence: true

  acts_as_voter

  def soft_delete
    update_attribute(:active, false)
  end



end
