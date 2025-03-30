require_relative "../../app/services/string_calculator"
require_relative "../../app/services/string_calculator_parser"
require_relative '../../test/test_helper'

class CalculationsControllerTest < ActionDispatch::IntegrationTest
  test "should return 0 for empty input" do
    post "/calculate", params: { numbers: "" }, as: :json
    assert_response :success
    assert_equal({ "result" => 0 }, JSON.parse(response.body))
  end

  test "should return sum for simple numbers" do
    post "/calculate", params: { numbers: "1,2,3" }, as: :json
    assert_response :success
    assert_equal({ "result" => 6 }, JSON.parse(response.body))
  end

  test "should handle custom delimiters" do
    post "/calculate", params: { numbers: "//;\n1;2;3" }, as: :json
    assert_response :success
    assert_equal({ "result" => 6 }, JSON.parse(response.body))
  end

  test "should return error for negative numbers" do
    post "/calculate", params: { numbers: "-1,2,-3" }, as: :json
    assert_response :unprocessable_entity
    assert_equal({ "error" => "Negative numbers not allowed: -1, -3" }, JSON.parse(response.body))
  end
end
