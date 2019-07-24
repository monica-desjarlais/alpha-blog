require 'test_helper'

class ListCategoriesTest < ActionDispatch::IntegrationTest

def setup
@category = Category.create(name: "sports")
@category2 = Category.create(name: "programming")
end

test "should show categories listing" do
get categories_path
assert_template 'categories/index'
#check if links display and if they point to that specific path (category) and shows the category name
assert_select "a[href=?]", category_path(@category), text: @category.name  #see setup method above!
assert_select "a[href=?]", category_path(@category2), text: @category2.name
end

end
