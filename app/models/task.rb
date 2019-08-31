class Task
  include Mongoid::Document
  include Mongoid::Timestamps

  validates :title, presence: true

  field :title, type: String
  field :description, type: String
  field :priority, type: Integer
  field :task_type, type: Integer
  belongs_to :project
  belongs_to :board
  belongs_to :assignee, class_name: User, foreign_key: 'assignee_id'
  belongs_to :registrant, class_name: User, foreign_key: 'registrant_id'
  belongs_to :workflow
  has_many :comment
end
