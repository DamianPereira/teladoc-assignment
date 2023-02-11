require 'rails_helper'

RSpec.describe Review, type: :model do
  let(:some_user) { User.create(first_name: 'Some', last_name: 'User') }
  let(:some_book) { Book.create(title: "Some Book")}
  let(:some_review_content) {"This book is great!"}
  let(:some_review) { some_book.reviews.create({content: some_review_content, user_id: some_user.id})}

  it "should have content" do
    expect(some_review.content).to eq(some_review_content)
  end
  it "should belong to one User" do
    expect(some_review.user).to eq(some_user)
  end
  it "should belong to one Book" do
    expect(some_review.book).to eq(some_book)
  end
end
