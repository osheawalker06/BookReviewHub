class Book < ApplicationRecord
  has_many :reviews, dependent: :destroy

  validates :title, presence: true
  validates :author, presence: true
  validates :description, presence: true
  validates :genre, presence: true
  validates :isbn, presence: true, uniqueness: true
  validates :cover_url, presence: true

  def cover_image_url
    if isbn.present?
      "https://covers.openlibrary.org/b/isbn/#{isbn.strip}-L.jpg"
    else
      "https://placehold.co/300x400/EBE5F2/6C5B7B?text=No+Cover"
    end
  end

  def average_rating
    active_ratings = reviews.where(rating: 1..5)
    return "Unrated" if active_ratings.none?

    active_ratings.average(:rating).to_f.round(1)
  end
end
