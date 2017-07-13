require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
    def setup
      @chef = Chef.create(chefname: "bob", email: "bob@example.com")
      @recipe = @chef.recipes.build(name: "Smothered Chicken", summary: "This is straight for the Southeastern region of the United States", 
                description: "Take a large pan heat the oil and put the chicken battered in flour and seasoning in the pan and begin the fry. Take out once golden brown, drain the oil but leave the remianing bits of flours at the bottem of the pan. cut up bell peppers onions, garlic and put into the pot fry on medium for a few minutes. add extra flour and seasoning creating a gravy like substance. Place the chicken back into the pan put a top and cook until the meat is falling off the bone.")
    end
    
    test "recipe should be valid" do
      assert @recipe.valid?
    end
    
    test "chef_id should be present" do
      @recipe.chef_id = nil
      assert_not @recipe.valid?
    end
    
    test "name should be present" do
      @recipe.name = " "
      assert_not @recipe.valid?
    end
    
    test "name length should not be too long" do
      @recipe.name = "a" * 101
      assert_not @recipe.valid?
    end
    
    test "name length should not be too short" do
      @recipe.name = "aaaa"
      assert_not @recipe.valid?
    end
    
    test "summary should be present" do
      @recipe.summary = " "
      assert_not @recipe.valid?
    end
    
    test "summary length should not be too long" do
      @recipe.summary = "a" * 151
      assert_not @recipe.valid?
    end
    
    test "summary length should not be too short" do
      @recipe.summary = "a" * 9
      assert_not @recipe.valid?
    end
    
    test "description must be present" do
      @recipe.description = " "
      assert_not @recipe.valid?
    end
    
    test "description should not be too long" do
      @recipe.description = "a" * 501
      assert_not @recipe.valid?
    end
    
    test "description should not be too short" do
      @recipe.description = "a" * 19
      assert_not @recipe.valid?
    end
end