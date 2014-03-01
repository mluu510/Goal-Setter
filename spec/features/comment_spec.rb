require 'spec_helper'

feature 'Comments' do
  before(:each) do
    sign_up('Jane')
    create_goal('Find a man', true)
    click_on 'Sign Out'
    sign_up('John')
  end

  it 'should allow commenting on a goal' do
    visit user_url(1)
    click_on 'Find a man'
    expect(page).to have_link 'Add Comment'
    add_comment("I am available. *wink* *wink*")
    expect(page).to have_content "I am available. *wink* *wink*"
  end

  it 'should allow commenting on a user' do
    visit user_url(1)
    expect(page).to have_link 'Add Comment'
    add_comment("Baby, dem goals.")
    expect(page).to have_content "Baby, dem goals."
  end
end