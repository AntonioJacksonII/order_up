require 'rails_helper'

describe "Dish show page" do
  describe "When I visit the dish show page" do
    it "I can see the chef and ingredients" do
      rat = Chef.create!(name: "Ratatouille")
      pizza = rat.dishes.create!(name: "Pizza", description: "Yum!")

      visit "/dishes/#{pizza.id}"

      expect(page).to have_content("Ratatouille")
    end
  end
end
