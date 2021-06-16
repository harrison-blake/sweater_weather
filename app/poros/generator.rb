require 'securerandom'

class Generator
  def self.generate_api_key
    SecureRandom.hex
  end
end
