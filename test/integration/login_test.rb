require "test_helper"

class LoginTest < ActionDispatch::IntegrationTest

  test "user logins in and redirects" do
    # TODO: resolve urls dynamically
    get "/users/sign_in"
    assert_equal 200, status

    # TODO: resolve urls dynamically
    post "/users/sign_in",
         "user[login]": @unconfirmed_user.email,
         "user[password]": @unconfirmed_user.password,
         "user[remember_me]": 0
    follow_redirect!
    assert_equal 200, status
    assert_equal "/", path
  end

end