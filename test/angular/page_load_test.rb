require 'test_helper'

feature 'visiting the index page' do
  scenario 'should load all books from database', js: true do
    visit "/"
    page.text.must_include "The Martian"
    page.text.must_include "Fresh Off the Boat"
    # check for image load
    page.html.must_include '<img ng-src="http://images.amazon.com/images/P/123456.01.ZTZZZZZZ.jpg" alt="Cover of The Martian" class="full" src="http://images.amazon.com/images/P/123456.01.ZTZZZZZZ.jpg">'
    page.html.must_include '<img ng-src="http://images.amazon.com/images/P/0987654321.01.ZTZZZZZZ.jpg" alt="Cover of Fresh Off the Boat" class="full" src="http://images.amazon.com/images/P/0987654321.01.ZTZZZZZZ.jpg">'
  end

  scenario "amazon link should work", js: true do
    visit "/"
    click_on "The Martian"
    current_url.must_include "amazon"
  end
end
