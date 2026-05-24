class ReviewsController < ApplicationController
  before_action :set_book
  before_action :set_review, only: [ :edit, :update, :destroy ]

  def create
    @review = @book.reviews.build(review_params)
    if @review.save
      redirect_to @book, notice: "Review has been created."
    else
      @reviews = @book.reviews.where.not(id: nil).order(created_at: :desc)
      render "books/show", status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @review.update(review_params)
      redirect_to @book, notice: "Review has been updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @review.destroy
    redirect_to @book, notice: "Review deleted"
  end

  private

  def set_review
    @review = @book.reviews.find(params[:id])
  end

  def set_book
    @book = Book.find(params[:book_id])
  end

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end
