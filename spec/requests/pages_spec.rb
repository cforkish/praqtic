require 'spec_helper'

describe "Static pages" do

  describe "Home page" do

    it "should have the content 'Primer'" do
      visit '/pages/home'
      expect(page).to have_content('Primer')
    end
  end

  describe "Help page" do

    it "should have the content 'Help'" do
      visit '/pages/help'
      expect(page).to have_content('Help')
    end
  end
end
