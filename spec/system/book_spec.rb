
require 'rails_helper'

RSpec.feature "Books", type: :feature do
  scenario "User adds a book with valid attributes" do
    visit new_book_path
    fill_in "Title", with: "Sample Title"
    click_button "Add New Book"

    expect(page).to have_content("Book was successfully created.")
  end

  scenario "User tries to add a book with a blank title" do
    visit new_book_path
    click_button "Add New Book"

    
    expect(page).to have_content("Book was successfully created.")
  end
end

RSpec.describe Book, type: :model do
    it "has an 'author' attribute in the database schema" do
        expect(Book.column_names).to include("author")
      end
    
      it "has a 'price' attribute in the database schema" do
        expect(Book.column_names).to include("price")
      end
    

  end
  