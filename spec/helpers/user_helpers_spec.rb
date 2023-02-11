require 'rails_helper'

describe UsersHelper do
  describe "full_name" do
    let(:some_user) {User.create(first_name: 'John', last_name: 'Smith')}
    subject { helper.full_name(some_user) }

    it "returns first and last name for a user" do
      is_expected.to eq('John Smith')
    end
  end
end
