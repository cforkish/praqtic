require 'spec_helper'

describe "Static pages" do

  describe "Home page" do

    it "should have the content 'Primer'" do
      visit '/pages/home'
      expect(page).to have_content('Primer')
    end

    it "should have the title 'Home'" do
      visit '/pages/home'
      expect(page).to have_title("Primer | Home")
    end
  end

  describe "Help page" do

    it "should have the content 'Help'" do
      visit '/pages/help'
      expect(page).to have_content('Help')
    end

    it "should have the title 'Help'" do
      visit '/pages/help'
      expect(page).to have_title("Primer | Help")
    end
  end

  describe "About page" do

    it "should have the content 'About'" do
      visit '/pages/about'
      expect(page).to have_content('About')
    end

    it "should have the title 'About'" do
      visit '/pages/about'
      expect(page).to have_title("Primer | About")
    end
  end
end
