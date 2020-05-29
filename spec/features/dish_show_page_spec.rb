require 'rails_helper'

describe "Dish show page" do
  describe "When I visit the dish show page" do
    it "I can see the chef and ingredients" do
      rat = Chef.create!(name: "Ratatouille")
      pizza = rat.dishes.create!(name: "Pizza", description: "Yum!")
      dough = Ingredient.create!(name: "dough", calories: 10)
      cheese = Ingredient.create!(name: "cheese", calories: 20)
      DishIngredient.create!(dish: pizza, ingredient: cheese)
      DishIngredient.create!(dish: pizza, ingredient: dough)

      visit "/dishes/#{pizza.id}"

      expect(page).to have_content("Ratatouille")
      expect(page).to have_content("Ingredients:\ndough\ncheese")
    end
    it "I can see the total calorie count of the dish" do
      rat = Chef.create!(name: "Ratatouille")
      pizza = rat.dishes.create!(name: "Pizza", description: "Yum!")
      dough = Ingredient.create!(name: "dough", calories: 10)
      cheese = Ingredient.create!(name: "cheese", calories: 20)
      DishIngredient.create!(dish: pizza, ingredient: cheese)
      DishIngredient.create!(dish: pizza, ingredient: dough)

      visit "/dishes/#{pizza.id}"

      expect(page).to have_content("Ratatouille")
      expect(page).to have_content("Ingredients:\ndough\ncheese")
      expect(page).to have_content("Total Calories: 30")
    end
  end
end
