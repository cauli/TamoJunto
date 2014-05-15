module Diagnostic::Topics

  extend ActiveSupport::Concern

  included do
    def main_topics
      themes.order(:id).each_with_index.map { |t, i| select_main_topic(t, i) }
    end

    private

    def bad_topics
      themes.order(:id).map do |theme|
        answers.by_theme(theme).order(:question_id).bad.map do |a|
          a.try(:question).try(:topic)
        end
      end
    end

    def select_main_topic(theme, index)
      if bad_topics[index].present?
          bad_topics[index].first
      else
        theme.questions.order(:id).first.topic
      end
    end
  end
end
