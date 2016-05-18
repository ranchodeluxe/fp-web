require "test_helper"

class AtlasDetail < ActionDispatch::IntegrationTest

  def setup
    super
    @atlas = create(:default_atlas)
  end

  test "atlas detail renders" do
    login @unconfirmed_user
    atlas_detail_has_user_info @atlas
  end

  def atlas_detail_has_user_info(atlas)
    # TODO: resolve urls dynamically
    get "/atlases/#{atlas.slug}"
    assert_equal 200, status
    assert_equal "/atlases/#{atlas.slug}", path
    # TODO: add test for greping page info
  end

  def login(who)
    # TODO: resolve urls dynamically
    get "/users/sign_in"
    assert_equal 200, status

    # TODO: resolve urls dynamically
    post "/users/sign_in",
         "user[login]": who.email,
         "user[password]": who.password,
         "user[remember_me]": 0
    follow_redirect!
    assert_equal 200, status
    assert_equal "/", path
  end

end