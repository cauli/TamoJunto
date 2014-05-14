class Event < ActiveRecord::Base
  include Event::StateMachineHandler
  include PgSearch

  belongs_to :organization
  has_and_belongs_to_many :topics
  validates :name,
            :description,
            :local,
            :starts_at,
            :ends_at,
            :time,
            :organization_id, presence: true

  pg_search_scope :search_by_name, :against => :name

  dragonfly_accessor :image
  acts_as_taggable

  scope :visible, ->{ where(state: 'visible').where('ends_at > ?', Time.now) }

  def self.search(search)
    if search
      (search_by_name(search).visible + tagged_with(search).visible).uniq
    else
      none
    end
  end
end
