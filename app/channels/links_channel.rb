class LinksChannel < ApplicationCable::Channel
  def subscribed
    stream_from("links_channel", coder: ActiveSupport::JSON) do |data|
      transmit data
    end
  end
end
