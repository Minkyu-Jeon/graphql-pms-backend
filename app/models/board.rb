class Board
  include Mongoid::Document
  include Mongoid::Timestamps

  validates :board_type, inclusion: { in: %w(scrum kanban) }

  field :board_type, String, null: false
end
