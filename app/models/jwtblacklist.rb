class JWTBlacklist < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JWTBlacklist

  self.table_name = 'jwt_blacklist'
end
