module Diagnostic::Topics

  extend ActiveSupport::Concern

  included do
    def main_topics
      themes.order(:id).each_with_index.map do |theme, index|
        if bad_topics[index].present?
          bad_topics[index].first
        else
          theme.questions.order(:id).first.topic
        end
      end
    end

    private

    def bad_topics
      themes.order(:id).map do |theme|
        answers.by_theme(theme).order(:question_id).bad.map do |a|
          a.try(:question).try(:topic)
        end
      end
    end
  end
end
