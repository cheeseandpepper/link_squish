class LinksController < ApplicationController
  before_action :find_link, only: [:update, :destroy]
  before_action :wipe_session, only: [:show, :new]
  
  def show
    render :show
  end

  def new
    @link = Link.new
    render :new
  end

  def update
    if @link.update(link_params)
      session[:short_url] = @link.short_url
      session[:admin_url] = @link.admin_url
      redirect_to :confirmation
    else
      flash[:error] = @link.errors.full_messages
      redirect_to new_link_path
    end
  end

  def create
    @link = Link.new(link_params)
    if @link.save
      session[:short_url] = @link.short_url
      session[:admin_url] = @link.admin_url
      redirect_to :confirmation
    else
      flash[:error] = @link.errors.full_messages
      redirect_to new_link_path
    end
  end

  def destroy
    if @link.destroy
      flash[:success] = "Link destroyed"
      redirect_to root_path
    else
      flash[:error] = "Couldn't destroy link: #{@link.errors.full_messages}"
      redirect_to root_path
    end
  end

  private

  def wipe_session
    session[:short_url] = nil
    session[:admin_url] = nil
  end

  def link_params
    params.require(:link).permit(:source_url, :active)
  end

  def find_link
    @link = Link.find(params[:id])
  end
end