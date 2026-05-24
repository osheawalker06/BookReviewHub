class ReviewsController < ApplicationController
  before_action :authenticate_user!,  only: [ :create, :edit, :update, :destroy ]
  before_action :set_book
  before_action :set_review, only: [ :edit, :update, :destroy ]
  before_action :authorize_reviewer!, only: [ :edit, :update, :destroy ]


  def create
    @review = @book.reviews.build(review_params)
    @review.user = current_user

    if @review.save
      redirect_to @book, notice: "Review has been created."
    else
      @reviews = @book.reviews.reload
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

  def authorize_reviewer!
    unless @review.user == current_user
      redirect_to @book, alert: "You are not authorized to alter this review."
    end
  end

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end
