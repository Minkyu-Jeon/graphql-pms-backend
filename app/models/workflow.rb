class Workflow
  include Mongoid::Document
  include Mongoid::Timestamps

  validates :title, presence: true

  field :title, type: String
  field :is_default, type: Boolean, default: false
  has_many :task
end
