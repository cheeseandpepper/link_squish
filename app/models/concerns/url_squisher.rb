module UrlSquisher
  def squish_url(source_url)
    #basic guards
    return nil unless self.respond_to?(:source_url) && self.source_url
    
    #dont want to update this
    return self.short_url if self.short_url
    
    SecureRandom.urlsafe_base64(4)
  end

  def encrypt_token(short_code)
    return self.encrypted_token if self.encrypted_token
    SecureRandom.urlsafe_base64(32)
  end
end