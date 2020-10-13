require 'test_helper'

class StaffInfosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get staff_infos_index_url
    assert_response :success
  end

end
