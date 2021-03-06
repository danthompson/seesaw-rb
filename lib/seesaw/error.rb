module Seesaw
  # Standard Seesaw error
  class Error < StandardError; end

  # Raised when Seesaw returns a 400 HTTP status code
  class BadRequest < Error; end

  # Raised when Seesaw returns a 401 HTTP status code
  class Unauthorized < Error; end

  # Raised when Seesaw returns a 403 HTTP status code
  class Forbidden < Error; end

  # Raised when Seesaw returns a 404 HTTP status code
  class NotFound < Error; end

  # Raised when Seesaw returns a 406 HTTP status code
  class NotAcceptable < Error; end

  # Raised when Seesaw returns a 422 HTTP status code
  class UnprocessableEntity < Error; end

  # Raised when Seesaw returns a 500 HTTP status code
  class InternalServerError < Error; end

  # Raised when Seesaw returns a 501 HTTP status code
  class NotImplemented < Error; end

  # Raised when Seesaw returns a 502 HTTP status code
  class BadGateway < Error; end

  # Raised when Seesaw returns a 503 HTTP status code
  class ServiceUnavailable < Error; end

  # Raised when a unique ID is required but not provided
  class UniqueIDRequired < Error; end

  # Status code to exception map
  ERROR_MAP = {
    400 => Seesaw::BadRequest,
    401 => Seesaw::Unauthorized,
    403 => Seesaw::Forbidden,
    404 => Seesaw::NotFound,
    406 => Seesaw::NotAcceptable,
    422 => Seesaw::UnprocessableEntity,
    500 => Seesaw::InternalServerError,
    501 => Seesaw::NotImplemented,
    502 => Seesaw::BadGateway,
    503 => Seesaw::ServiceUnavailable
  }
end
