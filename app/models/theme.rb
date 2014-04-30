class Theme < ActiveRecord::Base
  has_many :questions
  has_and_belongs_to_many :related_themes,
                          class_name: 'Theme',
                          join_table: :related_themes,
                          foreign_key: :theme_id,
                          association_foreign_key: :related_theme_id
  validates :title, :description, presence: true
end
