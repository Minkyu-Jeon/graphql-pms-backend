class Project
  include Mongoid::Document
  include Mongoid::Timestamps

  validates :name, presence: true

  field :name, type: String
  field :description, type: String
  has_and_belongs_to_many :users
  embeds_many :boards
  has_many :tasks
end
