class ReviewsController < ApplicationController
  def show
    @book = Book.find(params.require(:id))
  end
end
