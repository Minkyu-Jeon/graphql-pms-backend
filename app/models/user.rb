class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include ActiveModel::SecurePassword

  validates :email, presence: true

  field :email, type: String
  field :password_digest, type: String
  has_and_belongs_to_many :projects
  has_many :assigned_tasks, class_name: Task, foreign_key: 'assignee_id'
  has_many :registered_tasks, class_name: Task, foreign_key: 'registrant_id'
  has_many :comments
  
  has_secure_password
end
