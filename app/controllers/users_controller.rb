class UsersController < ApplicationController
  def show
    @user = User.find(params.require(:id))
  end

  def other_1
    @user = User.find_by(first_name: "Other", last_name: "1")
  end

  def other_2
    @user = User.find_by(first_name: "Other", last_name: "2")
  end

  def other_3
    @user = User.find_by(first_name: "Other", last_name: "3")
  end

end
