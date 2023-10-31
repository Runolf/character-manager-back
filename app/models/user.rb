#     t.string "pseudo"
#     t.datetime "created_at", precision: 6, null: false
#     t.datetime "updated_at", precision: 6, null: false
#     t.string "password"
#     t.boolean "isadmin"
#     t.string "email", default: "", null: false
#     t.string "encrypted_password", default: "", null: false
#     t.string "reset_password_token"
#     t.datetime "reset_password_sent_at"
#     t.datetime "remember_created_at"
#     t.index ["email"], name: "index_users_on_email", unique: true
#     t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

class User < ApplicationRecord

  has_many :user_games
  has_many :games, through: :user_games
  # validation added in TDD during the section 7
  validates :pseudo, presence: true, length: {minimum: 3}

  # test should be unique does not pas because must set up the test db
  validates_uniqueness_of :pseudo

end
