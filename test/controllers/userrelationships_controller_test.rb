# frozen_string_literal: true

require 'test_helper'

class UserrelationshipsControllerTest < ActionDispatch::IntegrationTest
  test 'should get create' do
    get userrelationships_create_url
    assert_response :success
  end

  test 'should get destroy' do
    get userrelationships_destroy_url
    assert_response :success
  end
end
