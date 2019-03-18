class Link < ApplicationRecord
  include UrlSquisher
  
  TLD_CACHE_KEY = 'tld_cache_key'.freeze
  
  validates :source_url, presence: true 
  validate :source_url_is_valid

  before_save :generate_short_url

  scope :active, -> { where(active: true) }

  def generate_short_url
    unless short_code.present?
      generated_short_code = squish_url(source_url)
      self.short_code      = generated_short_code
      self.short_url       = build_short_url(generated_short_code)
    end
  end

  private

  def source_url_is_valid
    return unless source_url
    #uri = URI.parse(source_url)
    
    #uri.scheme.match(/(http|https)/)
    tld_eval = cache_instance.tld_regex
    regex    = /(http|https)(:)(\/\/)(www.)?([a-z0-9A-z.]+)(#{tld_eval})/
    source_url.match(regex)
  end

  def build_short_url(code)
    #todo use ENV['HOST'] or something better
    case 
    when current_env == 'development'
      "localhost:3000/s/#{code}"
    when current_env == 'test'
      "http://example.com/s/#{code}"
    when current_env == 'production'
      "https://link-squish.herokuapp.com/s/#{code}"
    else
      raise "I do not know this env: #{current_env}"
    end
  end
    
  def cache_instance
    @cache_instance ||= CacheWrapper.new
  end
  # this doesn't belong here, i know, but better for testing
  def current_env
    Rails.env
  end
end
