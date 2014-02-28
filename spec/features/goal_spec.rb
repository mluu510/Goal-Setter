require 'spec_helper'

feature 'create goal' do
  before(:each) do
    sign_up('John')
  end

  it 'should require signed in user' do
    click_on 'Sign Out'
    visit new_goal_url
    expect(page).to have_content 'User Sign In'
  end

  it 'should show goals after creation' do
    visit new_goal_url
    fill_in 'Title', :with => 'Lose weight'
    expect(page).to have_content 'Goals'
    expect(page).to have_content 'Lose weight'
  end
end

feature 'show goals' do
  before(:each) do
    sign_up('John')
    click_on 'Sign Out'
    sign_up('Jane')
  end

  it "should show others' public goals" do
    create_goal('Find a man', true)
    click_on 'Sign Out'
    sign_in('John')
    visit '/users/2'
    expect(page).to have_content 'Find a man'
  end

  it "shouldn't show private goals to others" do
    create_goal('Smoke weed erday', false)
    click_on 'Sign Out'
    sign_in('John')
    visit '/users/2'
    expect(page).to_not have_content 'Smoke weed erday'
  end
end

feature 'edit goal' do
  it 'should have an edit goal link' do
    create_goal('Lose weight', true)
    expect(page).to have_content 'Edit'
    click_on 'Edit'
    expect(page).to have_content 'Edit Goal'
  end

  it 'should update attributes' do
    create_goal('Lose weight', true)
    click_on 'Edit'
    fill_in 'Title', :with => "Gain all the weight"
    click_on 'Update'
    expect(page).to have_content "Gain all the weight"
  end
end

feature 'delete goal' do
  it 'should have a delete button and destroy goal when clicked' do
    create_goal('Lose weight', true)
    expect(page).to have_content 'Delete'
    click_on 'Delete'
    expect(page).to_not have_content 'Lose weight'
  end
end