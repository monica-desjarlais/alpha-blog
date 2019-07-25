require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest

def setup
@category = Category.create(name: "sports")
@user = User.create(username: "mlaura", email: "mlaura@gmail.com", password: "password", admin: true) #create an admin user
end

test "should get categories index" do  #ensure we have all routes and they are accessible for the diff. actions we'll have
get categories_path  # check the path using rails routes
assert_response :success  #get a success response = we are able to get the index of categories
end

test "should get new" do  #get new category
sign_in_as(@user, "password") #only admin can create a new category -see the method created in test_helper!!
get new_category_path
assert_response :success
end

test "should get show" do #show category
get category_path(@category) # to generate a route for show, we need the resource(object) we want to access
assert_response :success
end

test "should redirect create when admin not logged in" do  #when the user is not admin, it should redirect right away
  assert_no_difference 'Category.count' do # nothing is added into the db
    post categories_path, params: { category: { name: "sports" } } #the post request, create a new category named "sports"
  end
  assert_redirected_to categories_path #redirected to categories listing
end
end
