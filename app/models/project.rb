class Project
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String, null: false
  field :description, type: String
end
