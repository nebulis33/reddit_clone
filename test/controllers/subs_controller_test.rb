require 'test_helper'

class SubsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get subs_index_url
    assert_response :success
  end

  test "should get new" do
    get subs_new_url
    assert_response :success
  end

  test "should get edit" do
    get subs_edit_url
    assert_response :success
  end

end
