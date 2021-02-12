class Post < ApplicationRecord
  has_many :comments,-> { order(position: :asc) },dependent: :destroy
end
