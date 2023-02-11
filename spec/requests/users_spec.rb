require 'rails_helper'

RSpec.describe "Users", type: :request do
  let!(:user_1) {User.create(id: 1, first_name: 'John', last_name: 'Smith')}
  let!(:other_1) {User.create(first_name: 'Other', last_name: '1')}
  let!(:other_2) {User.create(first_name: 'Other', last_name: '2')}
  let!(:other_3) {User.create(first_name: 'Other', last_name: '3')}

  describe "GET /show" do
    it "renders the first user correctly" do
      get "/users/1"
      expect(response).to have_http_status(:success)
      expect(response).to render_template("users/show")
    end

    it "renders the other_1 user correctly" do
      get "/users/other_1"
      expect(response).to have_http_status(:success)
      expect(response).to render_template("users/other_1")
    end

    it "renders the other_1 user correctly" do
      get "/users/other_2"
      expect(response).to have_http_status(:success)
      expect(response).to render_template("users/other_2")
    end

    it "renders the other_1 user correctly" do
      get "/users/other_3"
      expect(response).to have_http_status(:success)
      expect(response).to render_template("users/other_3")
    end

    it "returns 404 for non existing user" do
      get "/users/6"
      expect(response).to have_http_status(:not_found)
    end
  end
end
