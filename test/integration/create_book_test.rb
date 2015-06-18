require 'test_helper'

class CreatingBookTest < ActionDispatch::IntegrationTest
  test 'creating a new book' do
    post "/api/v1/books",
      { title: 'The Stranger', author: "Albert Camus", isbn: 8438384,
        review: "Existentialism at its finest", rating: 5,
        genre: "{'fiction' => true}" }
    assert_equal 201, response.status
    assert_equal Mime::JSON, response.content_type
    book = json(response.body)
    assert_equal "The Stranger", book[:title]
    assert_equal 5, book[:rating]
  end
end
