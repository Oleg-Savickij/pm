class Project < ApplicationRecord
  has_many :tasks
  validates :name, presence: true,
            length: { minimum: 5 }
  validates :summary, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
end
