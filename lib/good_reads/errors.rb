module GoodReads
  class Error < StandardError; end
  class ConfigurationError < Error; end
  class Forbidden < Error; end
  class Unauthorized < Error; end
  class NotFound < Error; end
end
