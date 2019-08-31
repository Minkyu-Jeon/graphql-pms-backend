class TaskActionLog
  include Mongoid::Document
  include Mongoid::Timestamps

  field :task_id, type: BSON::ObjectId
  field :before_workflow_id, type: BSON::ObjectId
  field :current_workflow_id, type: BSON::ObjectId

  belongs_to :before_workflow, class_name: Workflow, foreign_key: 'before_workflow_id'
  belongs_to :current_workflow, class_name: Workflow, foreign_key: 'current_workflow_id'
end
