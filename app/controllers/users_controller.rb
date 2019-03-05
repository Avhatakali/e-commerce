class UsersController < ApplicationController

  def show
    @user_login = current_user
    @track1_transactions = TrackTransaction.where(buyer: current_user)
    @track_transactions = TrackTransaction.where(seller: current_user)
  end
end
