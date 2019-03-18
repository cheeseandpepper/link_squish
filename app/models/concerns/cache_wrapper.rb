class CacheWrapper
  class CacheWrapperImmutableError < StandardError; end
  
  attr_reader :instance
  CACHE_IMMUTABLE = Rails.application.secrets.cache_immutable

  def initialize
    @instance = cache_instance
  end

  def method_missing(method, *args, &block)
    key, equals_sign = method.to_s.split(/(\W+)(=?)/)
    operation        = equals_sign == '=' ? :write : :read
    data             = args.first
    
    if equals_sign
      raise CacheWrapperImmutableError if check_immutable(key)
      instance.send(operation, key, data)
    else
      instance.send(operation, key)
    end
  end
  
  private

  def check_immutable(key)
    # immutable can be written once
    key.in?(CACHE_IMMUTABLE) && instance.read(key)
  end

  def cache_instance
    Rails.cache
  end
end