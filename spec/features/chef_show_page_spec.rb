require 'rails_helper'

describe "Chef show page" do
  describe "When I visit the chef show page" do
    it "I can see the chef's name" do
      rat = Chef.create!(name: "Ratatouille")

      visit "/chefs/#{rat.id}"

      expect(page).to have_content("Ratatouille")
    end
    it "I can see a link to all of the chef's ingredients" do
      rat = Chef.create!(name: "Ratatouille")
      pizza = rat.dishes.create!(name: "Pizza", description: "Yum!")
      dough = Ingredient.create!(name: "dough", calories: 10)
      cheese = Ingredient.create!(name: "cheese", calories: 20)
      DishIngredient.create!(dish: pizza, ingredient: cheese)
      DishIngredient.create!(dish: pizza, ingredient: dough)

      visit "/chefs/#{rat.id}"

      expect(page).to have_link("All Ingredients Used")
      click_link("All Ingredients Used")
      expect(current_path).to eq("/chefs/#{rat.id}/ingredients")
      expect(page).to have_content("dough\ncheese")
    end
  end
end
