require "test_helper"
OmniAuth.config.test_mode = true

class UserLoginTest < ActionDispatch::IntegrationTest
  test "User can login with GitHub account" do
    visit root_path
    mock_omniauth_user

    click_link "Login with Github"

    assert_text "mock_user"
    assert_text "email@example.com"
  end

  test "User can logout if logged in" do
    visit root_path
    mock_omniauth_user

    click_link "Login with Github"
    assert_equal dashboard_path, current_path
    assert_text "email@example.com"

    click_link "Logout"
    assert_equal root_path, current_path
  end

  private

  def mock_omniauth_user
    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
      "provider" => "github",
      "uid"      => "123456",
      "info" => {
        "email"    => "email@example.com",
        "nickname" =>  "mock_user",
        "image"    => "mock_user_thumbnail_url"
      },
      "credentials" => {
        "token"  => "mock_token"
      }
    })
  end
end
