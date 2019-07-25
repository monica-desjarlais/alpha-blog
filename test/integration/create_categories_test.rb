require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest

def setup
@user = User.create(username: "mlaura", email: "mlaura@gmail.com", password: "password", admin: true) #create admin
end


test "get new category form and create category" do
sign_in_as(@user, "password")
get new_category_path  #go to the new category path
assert_template 'categories/new'  # get the new form
#assert_difference=checking to make sure that the number of objects for whatever type was specified has increased by 1.
# an easy way to check to see that an object was added to the DB
#The output of the count of Categories is being compared to 1. Is the Category count equal to 1 or not?

assert_difference 'Category.count', 1 do
post categories_path, params: { category: { name: "sports" } } #http post request, post the new 'sports' category
follow_redirect!

end

assert_template 'categories/index' #we send the user to the category listing page

assert_match "sports", response.body #check if the name of new created category is displayed

end

test "invalid category submission results in failure" do
sign_in_as(@user, "password")
get new_category_path
assert_template 'categories/new'
assert_no_difference 'Category.count' do #nothing is added in database
post categories_path, params: { category: {name: " "} } # if the name is empty, cat can't be created
end

assert_template 'categories/new'

assert_select 'h2.panel-title' #check the errors are displayed

assert_select 'div.panel-body' #the class of div where errors are displayed

end
end
