require 'spec_helper'

feature "the signup process" do
  before(:each) do
    visit new_user_url
  end

  it "has a new user page" do
    expect(page).to have_content "User Sign Up"
  end

  it "should validate username and password" do
    click_on "Sign Up"
    expect(page).to have_content "Username can't be blank"
    expect(page).to have_content "Password can't be blank"
  end

  feature "signing up a user" do
    it "shows username on the homepage after signup" do
      fill_in 'username', :with => 'John'
      fill_in 'password', :with => 'password'
      click_on 'Sign Up'
      expect(page).to have_content 'John'
    end
  end

end

feature "logging in" do
  before(:each) do
    sign_up("John")
    click_on "Sign Out"
  end

  it "should validate login in credentials" do
    visit new_session_url
    click_on "Sign In"
    expect(page).to have_content "Username can't be blank"
    expect(page).to have_content "Password can't be blank"
  end

  it "shows username on the homepage after login" do
    sign_in("John")
    expect(page).to have_content 'John'
  end
end

feature "logging out" do
  before(:each) do
    sign_up("John")
    click_on "Sign Out"
  end

  it "begins with logged out state" do
    expect(page).to have_content 'User Sign In'
  end

  it "doesn't show username on the homepage after logout" do
    expect(page).to_not have_content "John"
  end
end













