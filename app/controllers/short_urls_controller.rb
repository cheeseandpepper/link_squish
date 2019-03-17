class ShortUrlsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound do |exception|
    redirect_to :not_found, error: 'Link not found'
  end
  
  before_action :get_link, only: [:show]


  def show
    increment_hits!
    broadcast!
    redirect_to @link.source_url
  end

  def not_found
    render :not_found
  end

  private

  def get_link
    @link = Link.active.find_by!(short_code: params[:id])
  end

  def broadcast!
    ActionCable.server.broadcast(
      "links_channel",
      {
        hits: @link.hits,
        id:   @link.id
      }
    )
  end

  def increment_hits!
    # TODO - this should be queued in the bg
    return unless @link
    @link.increment!(:hits)
  end
end