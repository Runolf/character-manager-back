class User < ApplicationRecord
  extend Devise::Models
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable
         # :jwt_authenticatable,
         # jwt_revocation_strategy: JWTBlacklist

  has_many :user_games
  has_many :games, through: :user_games
  # validation added in TDD during the section 7
  validates :pseudo, presence: true, length: {minimum: 3}

  # test should be unique does not pas because must set up the test db
  validates_uniqueness_of :pseudo

end
