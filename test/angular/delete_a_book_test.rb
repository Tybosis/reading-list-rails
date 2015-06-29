require "test_helper"

feature "deleting an existing book" do
  scenario "user deletes an existing book", js: true do
    visit "/"
    click_button("Remove Book", match: :first)
    page.driver.browser.accept_js_confirms
    visit "/"
    page.text.wont_include "The Martian"
  end
end
