class Organization < ActiveRecord::Base
  include User::Image

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  acts_as_copy_target

  has_many :events
  has_many :services
  belongs_to :state

  validates :name, presence: true
  validates :kind, inclusion: { in: %w{individual legal_entity NGO university public_organ}}
end
