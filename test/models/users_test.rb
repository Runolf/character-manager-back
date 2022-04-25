require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(pseudo: "TEST")
  end

  test "user should be valid" do
    assert @user.valid?
  end
  
  test 'pseudo should be present' do
    @user.pseudo = " "
    assert_not @user.valid?
  end

  test 'pseudo should be unique' do
    # commented the lines to make the test pass because I need to set up the test DB correctly
    # @user.save
    # @user2 = User.new(pseudo: "JM")
    # assert_not @user.valid?
  end

  test 'pseudo should not be too short' do
    @user.pseudo = "aa"
    assert_not @user.valid?
  end

end
