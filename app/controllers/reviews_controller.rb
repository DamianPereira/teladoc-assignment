# frozen_string_literal: true

class ReviewsController < ApplicationController
  def all_for_book
    @book = Book.includes(reviews: :user).find(params.require(:id))
  end
end
