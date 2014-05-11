class Organization < ActiveRecord::Base
  include User::Image

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :events
  has_many :services

  validates :name, presence: true
  validates :kind, inclusion: { in: %w{individual legal_entity NGO university public_organ}}
end
