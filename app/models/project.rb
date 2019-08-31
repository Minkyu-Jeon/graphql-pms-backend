class Project
  include Mongoid::Document
  include Mongoid::Timestamps

  validates :name, presence: true

  field :name, type: String
  field :description, type: String
end
