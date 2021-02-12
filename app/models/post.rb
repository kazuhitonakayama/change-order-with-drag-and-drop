class Post < ApplicationRecord
  has_many :comments,dependent: :destroy,-> { order(position: :asc) }
end
