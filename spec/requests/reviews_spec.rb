require 'rails_helper'

RSpec.describe "Reviews", type: :request do
  let!(:some_user) { User.create(first_name: 'Some', last_name: 'User') }
  let!(:some_book) { Book.create(id: 1, title: "Some Book") }
  let!(:some_review) do
    some_book.reviews.create([
                               { content: 'This book is great', user_id: some_user.id },
                               { content: 'This book is still when reading it twice', user_id: some_user.id },
                               { content: 'This book is even better reading it thrice', user_id: some_user.id }
                             ])
  end

  describe "GET /books/:id/reviews" do
    it "renders the reviews for the book correctly" do
      get "/books/1/reviews"
      expect(response).to have_http_status(:success)
      expect(response).to render_template("reviews/all_for_book")
    end

    it "returns 404 for non existing book" do
      get "/books/2/reviews"
      expect(response).to have_http_status(:not_found)
    end
  end
end
