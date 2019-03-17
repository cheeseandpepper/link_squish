class LinksController < ApplicationController
  before_action :find_link, only: [:edit, :update, :destroy]
  
  def index
    @links = Link.all
  end

  def edit; end

  def new
    @link = Link.new
    render :new
  end

  def update
    if @link.update(link_params)
      flash[:success] = "Squished link for #{@link.source_url} updated"
      redirect_to edit_link_path(@link.id)
    else
      flash[:error] = @link.errors.full_messages
      redirect_to new_link_path
    end
  end

  def create
    @link = Link.new(link_params)
    if @link.save
      flash[:success] = "Squished link for #{@link.source_url} created"
      redirect_to edit_link_path(@link.id)
    else
      flash[:error] = @link.errors.full_messages
      redirect_to new_link_path
    end
  end

  def destroy
    if @link.destroy
      flash[:success] = "Link destroyed"
      redirect_to links_path
    else
      flash[:error] = "Couldn't destroy link: #{@link.errors.full_messages}"
      redirect_to links_path
    end
  end

  private

  def link_params
    params.require(:link).permit(:source_url, :active)
  end

  def find_link
    @link = Link.find(params[:id])
  end
end