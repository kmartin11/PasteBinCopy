class UsersController < ApplicationController
def show
  @profile = current_user
  @pastes = Paste.all.order("created_at DESC")
end



end
