require 'rails_helper'

RSpec.describe 'ShoppingLists#Index', type: :system do
  before :each do
    @user = User.first
    login_as(@user, scope: :user)
  end
  it 'has placeholder text content' do
    visit user_shopping_lists_path(user_id: @user.id)
    expect(page).to have_content('Shopping List')
    expect(page).to have_content('You need the following items')
  end

  it 'has a table row for shopping list' do
    visit user_shopping_lists_path(user_id: @user.id)
    expect(all('.shop-list-table tr').count).to eql 2
  end
end
