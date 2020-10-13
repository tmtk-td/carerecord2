require 'test_helper'

class CareRecordsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get care_records_index_url
    assert_response :success
  end

end
