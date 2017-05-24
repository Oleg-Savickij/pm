class Task < ApplicationRecord
  has_many :comments
  belongs_to :projects
  belongs_to :users
end
