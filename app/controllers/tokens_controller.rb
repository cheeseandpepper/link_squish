class TokensController < ApplicationController
  before_action :get_link, only: [:edit]
  
  def edit
    render :edit
  end

  private

  def get_link
    @link ||= Link.find_by!(encrypted_token: token_params[:id])
  end

  def token_params
    params.permit(:id)
  end
end