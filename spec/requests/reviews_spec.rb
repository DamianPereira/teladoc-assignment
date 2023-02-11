require 'rails_helper'

RSpec.describe "Reviews", type: :request do
  def create_reviews(n)
    reviews = [
      { content: 'This book is great', user_id: some_user.id },
      { content: 'This book is still when reading it twice', user_id: some_user.id },
      { content: 'This book is even better reading it thrice', user_id: some_user.id }
    ][0, n]
    some_book.reviews.create(reviews)
  end

  let!(:some_user) { User.create(first_name: 'Some', last_name: 'User') }
  let!(:some_book) { Book.create(id: 1, title: "Some Book") }
  let!(:reviews) { create_reviews(3) }

  describe "GET /books/:id/reviews" do
    it "renders the reviews for the book correctly" do
      get "/books/1/reviews"
      expect(response).to have_http_status(:success)
      expect(response).to render_template("reviews/all_for_book")
    end

    it "renders the right number of reviews" do
      get "/books/1/reviews"
      expect(response.body.scan(/<li>/).length).to eq(3)
    end

    context "when a review has malicious html tag injection" do
      before do
        some_book.reviews.create(content: 'Layout breaker </div>Evil</ul>', user_id: some_user.id)
      end
      it "does not contain malicious tags" do
        get "/books/1/reviews"
        expect(response.body.scan(/<\/div>Evil<\/ul>/).length).to eq(0)
      end
    end

    context "when a review has valid html tags" do
      before do
        some_book.reviews.create(content: 'This book is <strong>Good</strong>', user_id: some_user.id)
      end
      it "does allows the valid tags" do
        get "/books/1/reviews"
        expect(response.body.scan(/<strong>Good<\/strong>/).length).to eq(1)
      end
    end


    it "returns 404 for non existing book" do
      get "/books/2/reviews"
      expect(response).to have_http_status(:not_found)
    end

    it "returns 404 for non existing book" do
      get "/books/2/reviews"
      expect(response).to have_http_status(:not_found)
    end

    context "N+1", :n_plus_one do
      populate { |n| create_reviews(n) }

      specify do
        expect { get '/books/1/reviews' }.to perform_constant_number_of_queries
      end
    end
  end
end
