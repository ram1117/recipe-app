require 'rails_helper'

RSpec.describe 'Foods#Index', type: :system do
  before :each do
    @user = User.first
    login_as(@user, scope: :user)
  end

  it 'has list of foods' do
    visit user_foods_path(user_id: @user.id)
    foods = page.all('.custom-table tbody tr')
    expect(foods.count).to eql 3
  end

  it 'clicking add foods redirects to foods/new page' do
    visit user_foods_path(user_id: @user.id)
    find(:button, 'Add food').click
    sleep 2
    expect(current_path).to eql "/users/#{@user.id}/foods/new"
  end

  it 'clicking add foods redirects to foods/new page' do
    visit user_foods_path(user_id: @user.id)
    first(:button, 'Delete').click
    sleep 1
    foods = page.all('.custom-table tbody tr')
    expect(foods.count).to eql 2
  end
end
