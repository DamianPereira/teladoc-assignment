require 'rails_helper'

RSpec.describe Book, type: :model do
  let(:book_title) { 'Some Book' }
  let(:some_user) { User.create(first_name: 'Some', last_name: 'User') }
  let(:some_book) do
    book = Book.create(title: book_title)
    book.reviews.create(content: "This book is good", user_id: some_user.id)
    book
  end
  it "has a title" do
    expect(some_book.title).to eq(book_title)
  end
  it "has a review" do
    expect(some_book.reviews.first).to be_instance_of Review
  end
end
