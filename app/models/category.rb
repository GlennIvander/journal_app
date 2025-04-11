class Category < ApplicationRecord
  belongs_to :user
  has_many :tasks

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 5 }
end
