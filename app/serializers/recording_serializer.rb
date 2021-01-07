class RecordingSerializer
  include FastJsonapi::ObjectSerializer
  attributes  :audio, :user 
  #belongs_to :user --> we add this when we are using the options variable in the user#index. This should create a relationship in your json.
end
