class Diagnostic < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :themes
  has_many :answers

  accepts_nested_attributes_for :answers

  validates :user_id, presence: true

  def topics
    themes.map do |t|
      answers.by_theme(t).try(:bad).try(:first).try(:question).try(:topic)
    end
  end
end
