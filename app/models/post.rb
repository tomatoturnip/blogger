class Post < ActiveRecord::Base
  acts_as_ordered_taggable

  scope :ordered, -> { order(date: :desc) }


end
