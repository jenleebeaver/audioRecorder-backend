class UserSerializer
  #Serializer gives us a data object that contains our array with individual objects and their attributes. Nested arrays which makes it easier to access data.
  include FastJsonapi::ObjectSerializer
  attributes :name, :created_at, :updated_at, :recordings
  #recordings allows us to access the association 
end
