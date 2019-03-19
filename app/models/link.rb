class Link < ApplicationRecord
  include UrlSquisher
  
  validates :source_url, url: true, presence: true 

  before_save :generate_short_url

  scope :active, -> { where(active: true) }

  def generate_short_url
    unless short_code.present?
      generated_short_code = squish_url(source_url)
      self.short_code      = generated_short_code
      self.short_url       = build_short_url(generated_short_code)
      self.encrypted_token = encrypt_token(short_code)
    end
  end

  def admin_url
    build_short_url(encrypted_token, true)
  end

  private

  def build_short_url(code, edit=false)
    path_letter = edit ? 'x' : 's'
    #todo use ENV['HOST'] or something better
    case 
    when current_env == 'development'
      "localhost:3000/#{path_letter}/#{code}"
    when current_env == 'test'
      "http://example.com/#{path_letter}/#{code}"
    when current_env == 'production'
      "https://link-squish.herokuapp.com/#{path_letter}/#{code}"
    else
      raise "I do not know this env: #{current_env}"
    end
  end

  # this doesn't belong here, i know, but better for testing
  def current_env
    Rails.env
  end
end
