# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    @user = User.find(params.require(:id))
  end

  def other_1
    @user = User.find_by(first_name: 'Other', last_name: '1')
    render 'show'
  end

  def other_2
    @user = User.find_by(first_name: 'Other', last_name: '2')
    render 'show'
  end

  def other_3
    @user = User.find_by(first_name: 'Other', last_name: '3')
    render 'show'
  end

  private

  def record_not_found
    render plain: 'User was not found', status: 404
  end
end
