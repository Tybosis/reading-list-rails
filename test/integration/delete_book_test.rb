require 'test_helper'

class DeletingBookTest < ActionDispatch::IntegrationTest
  test 'deleting an existing book' do
    book = Book.first
    assert_equal 2, Book.count
    delete "/api/v1/books/#{book.id}"
    assert_equal 204, response.status
    assert_equal 1, Book.count
  end

  test 'deleting a non existant book returns 404 error' do
    delete "/api/v1/books/57"
    assert_equal 404, response.status
    assert_equal 2, Book.count
  end
end
