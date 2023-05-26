require 'rails_helper'

RSpec.describe 'Foods#New', type: :system do
  before :each do
    @user = User.first
    login_as(@user, scope: :user)
  end

  it 'has placeholder text content' do
    visit new_user_food_path(user_id: @user.id)
    expect(page).to have_content('Add a new food')
  end

  it 'submit form redirects to /users/foods/index page' do
    visit new_user_food_path(user_id: @user.id)
    fill_in 'food_name', with: 'wurst'
    fill_in 'food_measurement_unit', with: 'pcs'
    fill_in 'food_price', with: 1.5
    fill_in 'food_quantity', with: 5
    find('input[name="commit"]').click
    sleep 2
    expect(current_path).to eql "/users/#{@user.id}/foods"
  end

  it 'click cancel button redirects to /users/foods/index page' do
    visit new_user_food_path(user_id: @user.id)
    find(:button, 'Cancel').click
    sleep 2
    expect(current_path).to eql "/users/#{@user.id}/foods"
  end
end
