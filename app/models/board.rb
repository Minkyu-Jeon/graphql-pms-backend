class Board
  include Mongoid::Document
  include Mongoid::Timestamps

  validates :board_type, inclusion: { in: %w(scrum kanban) }

  field :board_type, type: String

  embeds_many :workflows
end
