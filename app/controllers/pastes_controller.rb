class PastesController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show, :trends, :new, :create]
  before_action :find, only: [:show, :edit, :update, :destroy]
  
  def index
    @pastes = Paste.all.order("created_at DESC")
  end
  
  def new

    #@paste = Paste.new
    #@paste = current_user.pastes.build
    @pastes = Paste.all.order("created_at DESC")
    @paste= current_or_guest_user.pastes.build
  end
  
  def create

    #@paste = Paste.new(paste_params)
    @paste = current_or_guest_user.pastes.build(paste_params)
    @paste.user_email = current_or_guest_user.email
    @paste.username = current_or_guest_user.username

    if @paste.save
      redirect_to Paste.last
    else
      render 'new'
    end

    

  end
  
  def show
    @paste = Paste.find(params[:id])
    @pastes = Paste.all.order("created_at DESC")
  end
  
  def trends
    @pastes = Paste.all.order("created_at DESC")
  end
  
  def edit
    @paste = Paste.find(params[:id])

  end
  
  def update
    @paste = Paste.find(params[:id])
    if @paste.update(paste_params)
      redirect_to paste_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @paste.destroy
    redirect_to profile_path
  end
  
  
  private
    def paste_params
      params.require(:paste).permit(:paste, :title, :description, :name, :username)
    end
  
    def find
      @paste = Paste.find(params[:id])
    end
end
