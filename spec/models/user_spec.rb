require 'rails_helper'

describe User, type: :model do
  let(:some_first_name) {'John'}
  let(:some_last_name) {'Smith'}
  let(:some_user) { User.create(first_name: some_first_name, last_name: some_last_name) }
  it "has a first name" do
    expect(some_user.first_name).to eq(some_first_name)
  end
  it "has a last name" do
    expect(some_user.last_name).to eq(some_last_name)
  end
end
