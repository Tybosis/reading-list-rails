require 'test_helper'

class EditBookTest < ActionDispatch::IntegrationTest
  test 'editing an existing book' do
    book = Book.first
    patch "/api/v1/books/#{book.id}", { title: "The Pragmatic Programmer",
                                            author: "Andy Hunt and Dave Thomas" },
           { "Accept" => "application/json",
             "Content_type" => "application/json" }
    assert_equal 200, response.status
    assert_equal 'The Pragmatic Programmer', book.reload.title
    assert_equal 'Andy Hunt and Dave Thomas', book.reload.author
  end

  test 'editing non existant book returns 404' do
    patch "/api/v1/books/57", { title: "HTML for Babies" },
          { "Accept" => "application/json",
            "Content_type" => "application/json" }
    assert_equal 404, response.status
  end
end
