require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest

def setup
@category = Category.create(name: "sports") #
end

test "should get categories index" do  #ensure we have all routes and they are accessible for thedifferent actions we'll have
get categories_path  # check the path using rails routes
assert_response :success  #get a success response = we are able to get the index of cat
end

test "should get new" do  #get new category
get new_category_path
assert_response :success
end

test "should get show" do #show category
get category_path(@category) # to generate a  route for show, we need the resource(object) we want to access
assert_response :success
end
end
