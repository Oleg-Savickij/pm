class Comment < ApplicationRecord
  belongs_to :tasks
  belongs_to :user
  validates :user_id, presence: true
  validates :body, presence: true
end
