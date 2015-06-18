require 'test_helper'

class BookIndexTest < ActionDispatch::IntegrationTest
  test 'listing all the books' do
    get "/api/v1/books"
    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type
    books = json(response.body)
    assert_equal 2, books.size
  end
end
