class Task
  include Mongoid::Document
  include Mongoid::Timestamps

  validates :title, presence: true

  field :title, type: String
  field :description, type: String
  field :priority, type: Integer
  field :task_type, type: Integer
end
