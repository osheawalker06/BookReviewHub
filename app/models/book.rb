class Book < ApplicationRecord
  validates :title, presence: true
  validates :author, presence: true
  validates :description, presence: true
  validates :genre, presence: true
  validates :isbn, presence: true, uniqueness: true
  validates :cover_url, presence: true
end
