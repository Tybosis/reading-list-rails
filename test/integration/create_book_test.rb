require 'test_helper'

class CreatingBookTest < ActionDispatch::IntegrationTest
  test 'checking config' do
    assert_equal 4, 2 + 2
  end

  test 'second check' do
    assert_not_equal 10, 2 + 2
  end
end
