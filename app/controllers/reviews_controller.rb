class ReviewsController < ApplicationController
  def all_for_book
    @book = Book.find(params.require(:id))
  end
end
