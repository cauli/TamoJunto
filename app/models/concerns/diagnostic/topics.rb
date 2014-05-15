module Diagnostic::Topics
  extend ActiveSupport::Concern

  included do
    def main_topics
      themes.order(:id).each_with_index.map { |t, i| select_main_topics(t, i).first }
    end

    def secondary_topics
      themes.order(:id).each_with_index.map { |t, i| select_secondary_topics(t, i).first }
    end

    def bad_answers_by_theme(theme)
      answers.by_theme(theme).bad.count
    end

    def result_text(theme)
      if bad_answers_by_theme(theme) / answers.by_theme(theme).count.to_f < 0.5
        return [theme.good_headline, theme.good_text]
      else
        return [theme.bad_headline, theme.bad_text]
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

    def related_answers
      answers.where.not(id: answers.by_themes(themes.map { |t| t.id }).map { |a| a.id })
    end

    def select_related_topics
      related_answers.order(:question_id).bad.map do |a|
        a.try(:question).try(:topic)
      end
    end

    def select_main_topics(theme, index)
      if bad_topics[index].present?
        bad_topics[index]
      else
        [theme.questions.order(:id).first.topic,
         theme.questions.order(:id).try(:second).try(:topic)]
      end
    end

    def select_secondary_topics(theme, index)
      main = select_main_topics(theme, index)
      related = select_related_topics
      if bad_answers_by_theme(theme) > 1
        [main.second]
      elsif related.count > 0
        [related[index]]
      else
        [main.second]
      end
    end
  end
end
