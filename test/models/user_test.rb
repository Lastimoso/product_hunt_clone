require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "#full_name returns first and last name capitalize" do
    @user = User.new(first_name: "homero", last_name: "simpson")

    assert_equal "Homero Simpson", @user.full_name
  end

  test "#full_name returns first only if last is nil" do
    @user = User.new(first_name: "homero")

    assert_equal "Homero", @user.full_name
  end
end
