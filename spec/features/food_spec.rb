require 'rails_helper'

RSpec.describe 'Foods', type: :feature do
  before(:each) do
    @user = User.create(name: 'Test user', email: 'test444@gmail.com', password: '123456',
                        password_confirmation: '123456', confirmation_token: nil, confirmed_at: Time.now)
    @food = Food.create(name: 'Pizza', price: 5, measurement_unit: 'gram', quantity: 4, user_id: @user.id)
    # post user_session_path params: { user: { email: @user.email, password: @user.password } }

    visit new_user_session_path

    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'
  end
  describe 'food new page' do
    scenario 'should display add food page' do
      visit new_user_food_path(user_id: @user.id)
      expect(page).to have_content('Add a new food')
    end
    scenario 'should have a button to add food' do
      visit user_foods_path(user_id: @user.id)
      expect(page).to have_link('Add food')
    end
    scenario 'should have a button to delete food' do
      visit user_foods_path(user_id: @user.id)
      expect(page).to have_content('Delete')
    end
  end
end
