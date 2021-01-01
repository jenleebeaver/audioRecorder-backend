class RecordingSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :melody, :created_at, :updated_at, :user_id
  #belongs_to :user --> we add this when we are using the options variable in the user#index. This should create a relationship in your json.
end
