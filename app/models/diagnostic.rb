class Diagnostic < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :themes
  has_many :answers

  accepts_nested_attributes_for :answers

  validates :user_id, presence: true

  def topics
    selected_topics = themes.order(:id).map do |theme|
      answers.by_theme(theme).order(:question_id).bad.map do |a|
        a.try(:question).try(:topic)
      end
    end

    return themes.order(:id).each_with_index.map do |theme, index|
      if selected_topics[index].present?
        selected_topics[index].first
      else
        theme.questions.order(:question_id).first.topic
      end
    end
  end
end
