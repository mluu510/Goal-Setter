require 'spec_helper'

feature 'Comments' do
  before(:each) do
    sign_up('Jane')
    create_goal('Find a man', true)
    click_on 'Sign Out'
    sign_up('John')
  end

  it 'should allow commenting on goal' do
    visit user_url(1)
    click_on 'Find a man'
    click_on 'Add Comment'
    fill_in "body", "I am available. *wink* *wink*"
    click_on "Submit Comment"
    expect(page).to have_content "I am available. *wink* *wink*"
  end

  it 'should allow commenting on user' do
    visit user_url(1)
    expect(page).to have_link 'Add Comment'
    click_on 'Add Comment'
    fill_in "body", "I am available. *wink* *wink*"
    click_on "Submit Comment"
    expect(page).to have_content "I am available. *wink* *wink*"
  end
end