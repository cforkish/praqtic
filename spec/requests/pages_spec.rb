require 'spec_helper'

describe "Static pages" do

  let(:base_title) { "Primer" }

  describe "Home page" do
  	before { visit '/pages/home' }

    it "should have the content 'Primer'" do
      expect(page).to have_content('Primer')
    end

    it "should have the title 'Home'" do
      expect(page).to have_title("#{base_title} | Home")
    end
  end

  describe "Help page" do
  	before { visit '/pages/help' }

    it "should have the content 'Help'" do
      expect(page).to have_content('Help')
    end

    it "should have the title 'Help'" do
      expect(page).to have_title("#{base_title} | Help")
    end
  end

  describe "About page" do
  	before { visit '/pages/about' }

    it "should have the content 'About'" do
      expect(page).to have_content('About')
    end

    it "should have the title 'About'" do
      expect(page).to have_title("#{base_title} | About")
    end
  end

  describe "Contact page" do
  	before { visit '/pages/contact' }

    it "should have the content 'Contact'" do
      expect(page).to have_content('Contact')
    end

    it "should have the title 'Contact'" do
      expect(page).to have_title("#{base_title} | Contact")
    end
  end
end
