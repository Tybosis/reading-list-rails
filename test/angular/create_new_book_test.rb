require 'test_helper'

feature "create a new book" do
  scenario 'user fills out form to create a new book', js: true do
    visit "/"
    click_button "Create a Review"
    fill_in "ISBN", with: "0679781498"
    fill_in "Title", with: "Less Than Zero"
    fill_in "Author", with: "Brett Easton Ellis"
    fill_in "Review", with: "This book was really good."
    find('#rating').find(:xpath, 'option[1]').select_option
    find(:css, "#metafiction").set(true)
    click_button "Save Review"
    find("h3", text: "Less Than Zero")
    page.text.must_include "Less Than Zero"
    page.html.must_include '<img ng-src="http://images.amazon.com/images/P/0679781498.01.ZTZZZZZZ.jpg" alt="Cover of Less Than Zero" class="full" src="http://images.amazon.com/images/P/0679781498.01.ZTZZZZZZ.jpg">'
    page.text.must_include "Brett Easton Ellis"
    page.text.must_include "This book was really good."
    click_button("Remove Book", match: :first)
    page.driver.browser.accept_js_confirms
  end
end
