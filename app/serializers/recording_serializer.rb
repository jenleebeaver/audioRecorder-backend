class RecordingSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :melody, :created_at, :updated_at, :user_id
end
