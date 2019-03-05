class UsersController < ApplicationController

  def show
    @track_transactions = TrackTransaction.where(buyer: current_user)
  end
end
