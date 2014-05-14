class User < ActiveRecord::Base
acts_as_copy_target
  include User::Image,
          User::Authorizable,
          User::Voter

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  acts_as_copy_target

  has_many :articles
  has_many :diagnostics
  validates :name, :birthdate, :gender, presence: true

  acts_as_voter

  def soft_delete
    update_attribute(:active, false)
  end

end
