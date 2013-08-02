class Comment < ActiveRecord::Base
  attr_accessible :description, :user_id
end
