class Comment
  include Mongoid::Document
  include Mongoid::Timestamps

  field :content, type: String
  field :user_id, tpye: BSON::ObjectId
end
