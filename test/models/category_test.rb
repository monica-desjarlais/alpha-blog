require 'test_helper'

class CategoryTest < ActiveSupport::TestCase  # to test our category model that are able to create a new category

def setup  # a key method that runs before of any test
@category = Category.new(name: "sports") #initiate a test Category instance (with a name parameter)
end

test "category should be valid" do  #test that checks the validity of category
assert @category.valid?
end

test "name should be present" do
@category.name = " "
assert_not @category.valid? #negative assertion - expects a false return
end

test "name should be unique" do
@category.save   #save the cat instance variable, to hit the db first
category2 = Category.new(name: "sports")
assert_not category2.valid?  #category2 should not be valid
end

test "name should not be too long" do
@category.name = "a" * 26 # an instance with more than 25 char (which we set as being the max accepted)
assert_not @category.valid? # this test should fail, as @category has more than 25
end

test "name should not be too short" do
@category.name = "aa"
assert_not @category.valid? #should fail, being too short
end
end
