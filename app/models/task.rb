class Task < ApplicationRecord
  has_many :comments
  belongs_to :projects
  belongs_to :user
  validates :title, presence: true
  validates :description, presence: true
  validates :status, presence: true
  validates :user_id, presence: true
end
