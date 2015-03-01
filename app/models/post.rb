class Post < ActiveRecord::Base
  scope :ordered, -> { order(date: :desc) }
end
