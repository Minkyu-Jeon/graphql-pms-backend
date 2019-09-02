module Types
  module InputType
    class BoardInputType < BaseInputObject
      argument :board_type, GraphQL::STRING_TYPE, required: true
    end
  end
end