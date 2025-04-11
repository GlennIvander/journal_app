class Task < ApplicationRecord
  belongs_to :category

  validates :task, presence: true
  validates :body, presence: true, length: { minimum: 5 }
end
