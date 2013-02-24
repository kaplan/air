require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "make a new user" do
    new_user = User.new
    new_user.name = "David"
    new_user.password = "beans"
    new_user.save
    assert new_user.valid?, new_user.errors.full_messages.join("\n")
  end


end
