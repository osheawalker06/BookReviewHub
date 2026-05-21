json.extract! book, :id, :title, :author, :description, :genre, :isbn, :cover_url, :created_at, :updated_at
json.url book_url(book, format: :json)
